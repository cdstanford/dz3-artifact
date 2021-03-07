#!/usr/bin/env python3

"""
Script to run experiments with one or more SMT solvers
on a set of testcases or benchmark files.

Requirements: Python 3 version 3.7 or higher

To get started, run
    ./run_all.py --help
Or if this doesn't work, try one of these:
    python3 ./run_all.py --help
    python3.7 ./run_all.py --help
    python3.8 ./run_all.py --help

The script has three modes:
- Default
  Run an experiment between one or more executables, and
  print the results in two summary tables.
  + This mode tries to determine a "correct" answer for each test case:
    make sure that if the path to a benchmark contains "sat" or "unsat",
    then that label is correct. Otherwise, you can provide a baseline solver
    whose answer (if any) is taken to be correct.
  + The first summary table contains the total # of benchmarks solved
    (sat/unsat) by various solvers, and the second contains the running
    times on solved benchmarks, divided into buckets.
- Standalone mode
  Run on a single executable, and report on slow cases, timeouts, and crashes.
  Warning: This mode does not check for correct answers.
- Comparison mode
  Run on two executables, and report on relative speedup/slowdown.
  Warning: This mode does not check for correct answers.

Various additional options are available for all of the modes, and can
be seen on the command line.

SOLVER EXECUTABLES
Solvers known to the script are in the configuration file `solvers.json`.
To add a new solver, make an executable for that solver and put
it in ../baselines, then edit `solvers.json` with the relative path to
the solver and other relevant information.
Specifically, the other information includes command-line options
and optional regex-based input and output modifications:
SMT input syntax to replace with other syntax to make it recognized by the
solver, and output syntax to interpret as a crash or unknown answer, etc.
"""

import argparse
import contextlib
import filecmp
import glob
import json
import logging
import os
import random
import re
import subprocess
import signal
import sys
import time

# ==================== Check Python version ====================

MIN_PYTHON3 = 7
assert sys.version_info >= (3, MIN_PYTHON3), \
    f"requires Python 3.{MIN_PYTHON3} or newer"

# ==================== Constants ====================

# Script display name
SCRIPT_NAME = "run_all.py"

# Input files/pathnames used by the script
SOLVER_JSON_FILEPATH = "solvers.json" # input config file
TEST_FILE_PATTERN = './**/*.smt2' # file pattern to locate test case files
TEMP_IN_FILES = [".run_all_in.tmp.smt2"]
TEMP_OUT_FILES = [".run_all_out1.tmp", ".run_all_out2.tmp"]

# Output files/pathnames used by the script
RESULTS_FOLDER = "results"
SUMMARY_RESULTS_SUFFIX = "_summary.txt"
RAW_RESULTS_SUFFIX = "_raw.csv"

# Command line option defaults (can be overriden)
DEFAULT_TESTCASE_REPETITIONS = 1
DEFAULT_TESTCASE_TIMEOUT = 10
DEFAULT_USE_RANDOM_SEEDS = 'y'
RANDOM_SEED_UPPER_BOUND = 10000

# Integer codes (these can be arbitrary negative numbers, only used internall)
# for test case results
UNKNOWN_CODE = -1
WRONG_CODE = -2
TIMEOUT_CODE = -3
CRASH_CODE = -4

# Strings for understanding solver output
ANSWER_SAT = "sat"
ANSWER_UNSAT = "unsat"
ANSWER_UNKNOWN = "unknown"

# Testcase times (in s) and slowdowns (relative) to report a potential problem
# in standalone and comparison mode, respectively
TIME_SLOW = 0.07
TIME_VSLOW = 0.5
SLOWDOWN_VSLOW = 10
SLOWDOWN_SLOW = 1.3
SPEEDUP_FAST = 0.8
SPEEDUP_VFAST = 0.1

# Set up logging; color output for warnings and errors
logging.basicConfig(level=logging.INFO)
logging.addLevelName(
    logging.WARNING,
    "\033[1;31m%s\033[1;0m" % logging.getLevelName(logging.WARNING)
)
logging.addLevelName(
    logging.ERROR,
    "\033[1;41m%s\033[1;0m" % logging.getLevelName(logging.ERROR)
)

# ==================== Validation ====================

def validate_executable_path(filepath):
    if not os.path.isfile(filepath):
        logging.error(
            f"No executable file found at: {filepath}."
            f" Please edit {SOLVER_JSON_FILEPATH} with the correct path."
        )
        sys.exit(1)
    elif not os.access(filepath, os.X_OK):
        logging.error(
            f"File found but not executable at: {filepath}."
            f" Please add execute permissions."
        )
        sys.exit(1)

def validate_file_dne(filepath):
    if os.path.exists(filepath):
        logging.error(
            f"Something already exists at {filepath}."
            f" Try removing that file or directory, or changing the name of"
            f" the temp files used in the script."
        )
        sys.exit(1)

def validate_folder_exists(dirpath):
    if not os.path.isdir(dirpath):
        logging.error(f"Not an existing directory: {dirpath}")
        sys.exit(1)

def validate_file_or_folder_exists(path):
    if not os.path.exists(path):
        logging.error(f"Not an existing file or directory: {path}")
        sys.exit(1)

# ==================== Utilities ====================

def pause_if_true(cond, msg="paused"):
    if cond:
        input(f"=== [{msg} -- press any key] ===")

# ==================== Abstractions for Test Results ====================

class TestResult:
    """
    Abstract result of a timing test.
    Either a time or some kind of error (crash, timeout, wrong, unknown).

    The additional field 'output' stores the program output as a string,
    and self.answer stores a short parsed output (or None).
    """
    def __init__(self, time, timeout, output):
        # Initialized fields
        self.time = time
        self.timeout = timeout
        self.output = output
        self.answer_checked = False
        # Other fields -- must be set by user
        self.answer = None
        self.path = None
        # Validation
        assert type(output) == str
        assert (self.is_crash() or self.is_timeout() or self.time > 0)
        if self.time > self.timeout + .2:
            logging.warning(f"Time result {self.timeout} was significantly"
                            f" greater thanthe timeout {self.timeout}!")

    def is_unknown(self):
        return (self.time == UNKNOWN_CODE)
    def is_wrong(self):
        return (self.time == WRONG_CODE)
    def is_timeout(self):
        return (self.time == TIMEOUT_CODE)
    def is_crash(self):
        return (self.time == CRASH_CODE)
    def is_err(self):
        return (self.is_unknown() or self.is_wrong() or
                self.is_timeout() or self.is_crash())

    def mark_unknown(self):
        self.time = UNKNOWN_CODE
    def mark_wrong(self):
        self.time = WRONG_CODE
    def mark_timeout(self):
        self.time = TIMEOUT_CODE
    def mark_crash(self):
        self.time = CRASH_CODE

    def check_answer(self, correct_answer):
        assert correct_answer is not None
        if (not self.is_err() and self.answer != correct_answer):
            self.mark_wrong()
        self.answer_checked = True

    def get_time(self):
        return self.timeout if self.is_err() else self.time

    def __eq__(self, other):
        return self.time == other.time

    # Order on test results for the purposes of finding regressions.
    # Wrong > {Crash, Timeout, Unknown} > Correct
    # Correct answers further ordered by time
    def __gt__(self, other):
        if other.is_wrong():
            return False
        elif self.is_wrong():
            return True
        elif other.is_err():
            return False
        elif self.is_err():
            return True
        else:
            return self.time > other.time

    def __repr__(self):
        if self.is_crash():
            return "Crash"
        elif self.is_timeout():
            return f"Timeout ({self.timeout}s)"
        elif self.is_wrong():
            return "Wrong"
        elif self.is_unknown():
            return "Unknown"
        elif self.answer is not None:
            return f"{self.answer} ({self.time:.2f}s)"
        else:
            return f"{self.time:.2f}s"

def make_crash_result(timeout, output):
    return TestResult(CRASH_CODE, timeout, output)

def make_timeout_result(timeout, output):
    return TestResult(TIMEOUT_CODE, timeout, output)

def avg_test_result(test_result_list):
    # Precondition: nonempty list with no error results
    assert len(test_result_list) > 0
    assert not [tr for tr in test_result_list if tr.is_err()]
    total = sum([tr.time for tr in test_result_list])
    avg_time = total / len(test_result_list)
    max_timeout = max([tr.timeout for tr in test_result_list])
    fst_output = test_result_list[0].output
    result = TestResult(avg_time, max_timeout, fst_output)
    result.answer = test_result_list[0].answer
    result.answer_checked = test_result_list[0].answer_checked
    result.path = test_result_list[0].path
    return result

class TestResultTotals:
    """
    Abstract class for a set of timing results.
    """
    code_to_cat = {
        UNKNOWN_CODE: "unknown",
        WRONG_CODE: "wrong",
        TIMEOUT_CODE: "timeout",
        CRASH_CODE: "crash"
    }
    answer_to_cat = {
        None: "unchecked",
        ANSWER_SAT: "sat",
        ANSWER_UNSAT: "unsat",
        "": "blank"
    }
    other_cats = {"other"}
    categories = (set(code_to_cat.values()) |
                  set(answer_to_cat.values()) | other_cats)
    cats_ordered = ["sat", "unsat", "other", "blank", "unchecked",
                    "unknown", "wrong", "timeout", "crash"]
    cats_abbrevs = ["sat", "unsat", "other", "blank", "unchk",
                   "unk", "wrong", "tmout", "crash"]

    # time_buckets = [0.01, 0.02, 0.04, 0.08, 0.16,
    #                 0.32, 0.64, 1.3, 2.6, 5.1, 10.2]
    time_buckets = [0.041, 0.12, 0.37, 1.1, 3.3, 10.2]
    time_buckets_str = [str(bkt) for bkt in time_buckets]

    def __init__(self, name):
        self.ctotals = {cat: 0 for cat in self.categories}
        self.btotals = {bkt: 0 for bkt in self.time_buckets}
        self.raw = []
        self.name = name
        # Validate class constants
        assert set(self.cats_ordered) == self.categories

    def add_result(self, test_result):
        # Calculate category
        if test_result.is_err():
            cat = self.code_to_cat[test_result.time]
        elif not test_result.answer_checked:
            cat = "unchecked"
        elif test_result.answer in self.answer_to_cat:
            cat = self.answer_to_cat[test_result.answer]
        else:
            cat = "other"
        self.ctotals[cat] += 1
        # Calculate time bucket
        if test_result.is_err():
            time = "--"
            bkt = None
        else:
            time = test_result.time
            bkt = [b for b in self.time_buckets if b > time][0]
            self.btotals[bkt] += 1
        # Save raw data
        path = test_result.path
        answer = test_result.answer
        if len(answer) > 20:
            answer = answer[:17] + "..."
        self.raw.append((self.name, path, cat, time, answer))

    def __repr__(self):
        info_str = f"{name}:Totals:"
        for cat, ttl in self.ctotals.items():
            info_str += f" {ttl} {cat},"
        # self.times.sort()
        # times_str = [f"{time:.2f}" for time in self.times]
        # info_str += f"\n{name}:Times: {times_str}"
        return info_str

def table_tostr(fstcol_width, rows, headers):
    """
    Pretty print a table.

    First col width given, others deduced from headers.
    """
    fstcol_fmt = '{:>' + str(fstcol_width) + '}'
    othercol_fmts = ["{:>" + str(len(hdr) + 1) + "}" for hdr in headers[1:]]
    row_fmt = fstcol_fmt + "".join(othercol_fmts) + "\n"
    result = row_fmt.format(*headers)
    for row in rows:
        result += row_fmt.format(*row)
    return result

def list_of_totals_tostr(list_of_totals):
    """
    Pretty print a list where each item is a TestResultTotals object.
    Prints two tables (categories and time buckets).
    Returns a string.
    """
    result = "===== Categories =====\n"
    # Print first table
    cats = TestResultTotals.cats_ordered
    cats_abb = TestResultTotals.cats_abbrevs
    rows = [
        [ttls.name] + [str(ttls.ctotals[cat]) for cat in cats]
        for ttls in list_of_totals
    ]
    result += table_tostr(20, rows, ["solver"] + cats_abb)
    result += "===== Time Buckets =====\n"
    # Print second table
    bkts = TestResultTotals.time_buckets
    bkts_str = TestResultTotals.time_buckets_str
    rows = [
        [ttls.name] + [str(ttls.btotals[bkt]) for bkt in bkts]
        for ttls in list_of_totals
    ]
    result += table_tostr(20, rows, ["solver"] + bkts_str)

    return result

def list_of_totals_dump_summary(list_of_totals, fh):
    fh.write(list_of_totals_tostr(list_of_totals))

def list_of_totals_dump_raw(list_of_totals, fh):
    """
    Given a file handle, dump all the raw results as comma separated values.
    """
    for ttls in list_of_totals:
        for row in ttls.raw:
            fh.write(",".join([str(ele) for ele in row]) + "\n")

# ==================== Handling Solver Input and Output ====================

def time_cl_call(cl_call, timeout):
    """
    Run a command line call and return both the time and the output.
    cl_call should be a list of strings.
    Returns a TestResult.

    Use time.time() to time and subprocess to call a command with options.
    """
    logging.debug(f"Timing {cl_call}")
    try:
        start_time = time.time()
        result = subprocess.run(cl_call, timeout=timeout, text=True,
                                check=True, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT)
        end_time = time.time()
        return TestResult(end_time - start_time, timeout, result.stdout)
    except subprocess.TimeoutExpired as result:
        # for some reason in this case result.stdout is not properly
        # converted to string instead of bytes, so we have to decode it
        output = (result.stdout.decode(sys.stdout.encoding)
                  if result.stdout else "")
        return make_timeout_result(timeout, output)
    except subprocess.CalledProcessError as result:
        output = result.stdout if result.stdout else ""
        # Add helpful output if the process is terminated by a signal
        if result.returncode < 0:
            sigcode = -result.returncode
            output += (f"\nProgram crashed with signal:"
                         f" {signal.Signals(sigcode).name}")
        return make_crash_result(timeout, output)

class SolverImpl:
    """
    Small wrapper class to compare different solvers, solver versions,
    and runtime options.

    Also includes:
    - Regex replacements on the input, to resolve input format differences
      between solvers
    - Regex parsing on the output, to detect crashes and to exctract
      whether an answer is correct/unknown/incorrect.
    """
    def __init__(self, name, path, opts, rseed_opt,
                 input_regex_replacements, detect_crash_patterns,
                 output_pattern, timeout, reps, randomize):
        validate_executable_path(path)
        assert timeout > 0
        assert reps >= 1
        assert type(randomize) == bool
        if randomize and rseed_opt is None:
            logging.warning(f"Solver {name}: 'randomize=true' ignored because"
                            f" solver does not support random seeds. Edit"
                            f" '{SOLVER_JSON_FILEPATH}' to provide 'rseed_opt'"
                            f" or turn off randomization to suppress this"
                            f" message.")
            randomize = False
        self.name = name
        self.path = path
        self.opts = opts
        self.rseed_opt = rseed_opt
        self.input_regex_replacements = input_regex_replacements
        self.detect_crash_patterns = detect_crash_patterns
        self.output_pattern = output_pattern
        self.timeout = timeout
        self.reps = reps
        self.randomize = randomize
        logging.info(f"Configured solver implementation: {self}")

    def prepare_input(self, infile, tempfile):
        with open(infile, 'r') as in_fh, open(tempfile, 'w') as tmp_fh:
            logging.debug(
                f"Converting {infile} to {tempfile} (applying "
                f" {len(self.input_regex_replacements)} pattern replaces)"
            )
            contents = in_fh.read()
            for pattern, replacement in self.input_regex_replacements:
                contents = re.sub(pattern, replacement, contents)
            tmp_fh.write(contents)

    def make_cl_call(self, tempfile):
        cl_call = [self.path] + self.opts + [tempfile]
        if self.randomize:
            rseed = random.randrange(0, RANDOM_SEED_UPPER_BOUND)
            cl_call += [f"{self.rseed_opt}{rseed}"]
        return cl_call

    # Parse the output to detect crashes and unknown answers.
    # Store the answers as test_result.answer
    # Does not check for incorrect answers.
    def parse_output(self, test_result):
        output = test_result.output
        assert test_result.answer is None
        assert not test_result.is_wrong()
        assert not test_result.is_unknown()
        # Check for crash patterns
        for pattern in self.detect_crash_patterns:
            if re.search(pattern, output):
                logging.debug(f"Detected solver crash!"
                              f" Found crash pattern {pattern}")
                test_result.mark_crash()
        # Parse answers returned by solver
        answer_list = re.findall(self.output_pattern, output)
        test_result.answer = ",".join(answer_list)
        if (not test_result.is_err() and ANSWER_UNKNOWN in answer_list):
            logging.debug(f"Detected unknown answer: '{ANSWER_UNKNOWN}'")
            test_result.mark_unknown()

    def time_on(self, infile, tempfile, outfile=None, debug_out=False):
        logging.debug(f"===== Timing {os.path.basename(infile)} =====")
        self.prepare_input(infile, tempfile)
        test_results = []
        for i in range(self.reps):
            cmd = self.make_cl_call(tempfile)
            # Get test_result and save output
            test_result = time_cl_call(cmd, self.timeout)
            test_result.path = infile
            if outfile is not None:
                with open(outfile, "w") as fh:
                    fh.write(test_result.output)
            # Parse output
            self.parse_output(test_result)
            # If debug_out, debug a crash
            if debug_out:
                print(test_result.output)
                print(f"Parsed answer: {test_result.answer}")
                pause_if_true(test_result.is_crash() or
                              test_result.is_unknown(), "pause for debugging")
            # On error, return immediately
            if test_result.is_err():
                return test_result
            test_results.append(test_result)

        logging.debug(f"Time results: {test_results}")
        avg_tr = avg_test_result(test_results)
        return avg_tr

    def __repr__(self):
        display_opts = self.opts.copy()
        if self.randomize:
            display_opts.append(f"{self.rseed_opt}<int>")
        return (
            f"'{self.name}' at {self.path},"
            f" options = {display_opts},"
            f" timeout = {self.timeout},"
            f" repetitions = {self.reps},"
            f" {len(self.input_regex_replacements)} input replacements,"
            f" {len(self.detect_crash_patterns)} output crash patterns"
        )

# ==================== Running Test Cases ====================

def run_standalone_test_case(solver_impl, infile, debug_out=False):
    """
    Run a single solver on a file and log the test result.
    """
    test_result = solver_impl.time_on(infile, TEMP_IN_FILES[0],
                                      debug_out=debug_out)

    info_str = ""
    if test_result.is_err():
        log_level = logging.ERROR
        info_str += "Failure"
    elif test_result.time >= TIME_VSLOW:
        log_level = logging.WARNING
        info_str += "Very slow"
    elif test_result.time >= TIME_SLOW:
        log_level = logging.WARNING
        info_str += "Slow"
    else:
        log_level = logging.INFO
        info_str += "Finished"
    info_str += f": {test_result} at {infile}"

    logging.log(log_level, info_str)

def run_comparison_test_case(solver_impl, baseline_impl,
                             infile, compare_out=False, debug_out=False):
    """
    Compare a solver vs a baseline on a file and log the relative slowdown.
    With compare_out, also compare output for equivalence.
    """
    tempfile = TEMP_IN_FILES[0]
    outfile1 = TEMP_OUT_FILES[0] if compare_out else None
    outfile2 = TEMP_OUT_FILES[1] if compare_out else None

    test_result = solver_impl.time_on(infile, tempfile, outfile1, debug_out)
    baseline_result = baseline_impl.time_on(infile, tempfile,
                                            outfile2, debug_out)
    slowdown = test_result.get_time() / baseline_result.get_time()

    if (test_result.is_err() and test_result > baseline_result):
        log_level = logging.ERROR
        info_str = f"Regression: {test_result}"
    elif test_result.is_err():
        log_level = logging.WARNING
        info_str = f"Failure: {test_result}"
    elif slowdown >= SLOWDOWN_VSLOW:
        log_level = logging.WARNING
        info_str = f"Large slowdown: {slowdown:.2f}x"
    elif slowdown >= SLOWDOWN_SLOW:
        log_level = logging.WARNING
        info_str = f"Slowdown: {slowdown:.2f}x"
    elif slowdown >= SPEEDUP_FAST:
        log_level = logging.INFO
        info_str = f"Finished: {slowdown:.2f}x"
    elif slowdown >= SPEEDUP_VFAST:
        log_level = logging.INFO
        info_str = f"Speedup: {slowdown:.2f}x"
    else:
        log_level = logging.INFO
        info_str = f"Large speedup: {slowdown:.2f}x"
    info_str += f" (baseline {baseline_result}) at {infile}"

    logging.log(log_level, info_str)

    # Report error if output files differ (only in case of normal termination)
    if (compare_out and not test_result.is_err()
                    and not baseline_result.is_err()
                    and not filecmp.cmp(outfile1, outfile2, False)):
        logging.error(f"Output differs on input {infile}")
        pause_if_true(debug_out, "pause for debugging")

def run_group_test_case(solver_impl_list, totals_list,
                        infile, debug_out=False,
                        correct_answer=None, baseline_index=None):
    """
    Run several solvers on an input file.
    Check their answers either compared to a provided correct answer,
    or compared to solver at baseline_index.
    """
    n_solvers = len(solver_impl_list)
    assert n_solvers >= 1
    assert (baseline_index is None or
            (correct_answer is None and baseline_index in range(n_solvers)))

    test_result_list = []
    for solver_impl in solver_impl_list:
        test_result = solver_impl.time_on(infile, TEMP_IN_FILES[0],
                                          debug_out=debug_out)
        test_result_list.append(test_result)
    # Try to get correct answer
    if baseline_index is not None:
        baseline = test_result_list[baseline_index]
        if not baseline.is_err():
            correct_answer = baseline.answer
    info_str = ""
    if correct_answer is None:
        info_str += "(no correct answer known) "
    else:
        for test_result in test_result_list:
            if not test_result.is_err():
                test_result.check_answer(correct_answer)

    info_str += f"Results at {infile}:"
    for i in range(n_solvers):
        info_str += f"\n    {solver_impl_list[i].name}: {test_result_list[i]}"
    logging.info(info_str)
    wrong_answers = [tr for tr in test_result_list if tr.is_wrong()]
    pause_if_true(debug_out and wrong_answers)

    # Update totals
    for i in range(n_solvers):
        totals_list[i].add_result(test_result_list[i])

    return test_result_list

def do_for_all(pattern, filepath_fun):
    """
    Recursively traverse subdirectories and run the given command.
    """
    logging.debug(f"Running all files matching {pattern}...")
    for filepath in glob.glob(pattern, recursive=True):
        filepath_fun(filepath)

# ==================== CLI Entrypoint ====================

if __name__ == "__main__":
    logging.info(f"========== {SCRIPT_NAME}: Initializing ==========")

    # Get solver data from JSON file
    with open(SOLVER_JSON_FILEPATH) as fh:
        solver_data = json.load(fh)
    solvers = solver_data["solvers"]
    solver_names = solvers.keys() - solver_data["disabled_solvers"]
    default_solver = solver_data["default_solver"]
    default_baseline = solver_data["default_baseline"]

    # Parse command-line arguments
    parser = argparse.ArgumentParser(formatter_class=lambda prog:
                                     argparse.HelpFormatter(prog, width=70))

    parser.add_argument(
        "solvers",
        help="name of solver or list of solvers to test (edit solvers.json to make additional solvers available) -- choices {%(choices)s}",
        nargs="+",
        metavar="SOLVER",
        choices=solver_names
    )
    parser.add_argument(
        "-i", "--input-path",
        help="file or directory containing testcases or benchmarks to run, e.g. '../benchmarks/handwritten' (if a directory, runs recursively in all subfolders)",
        required=True
    )
    parser.add_argument(
        "-s", "--standalone",
        help="run in standalone mode: test a single solver implementation for fast/slow output and errors",
        action='store_true'
    )
    parser.add_argument(
        "-c", "--comparison",
        help="run in comparison mode: compare a solver implementation against a baseline, and report on regressions or speedups",
        action='store_true'
    )
    parser.add_argument(
        "-b", "--baseline",
        help="name of baseline solver to test, in addition to the listed solvers (edit solvers.json to provide other solvers) (required in comparison mode) -- choices {%(choices)s}",
        metavar="SOLVER",
        default=None,
        choices=solver_names
    )
    parser.add_argument(
        "--opts",
        help="additional command line options (separated by whitespace) to pass to the solver executable(s)",
        type=(lambda s: s.split()),
        default=[]
    )
    parser.add_argument(
        "-t", "--timeout",
        help="timeout for each test case",
        type=float,
        default=DEFAULT_TESTCASE_TIMEOUT
    )
    parser.add_argument(
        "-n", "--num-repetitions",
        help="number of repetitions for each test case",
        type=int,
        default=DEFAULT_TESTCASE_REPETITIONS
    )
    parser.add_argument(
        "-r", "--randomize",
        help=f"use random seeds to randomize each solver run",
        choices=['y', 'n'],
        default=DEFAULT_USE_RANDOM_SEEDS
    )
    parser.add_argument(
        "-l", "--log-level",
        help="set logging level (has no effect if --debug is set)",
        choices=['debug', 'info', 'warning', 'error'],
        default='info'
    )
    parser.add_argument(
        "-d", "--debug",
        help="mode to debug solver output and crashes (implies '--log-level debug')",
        action='store_true'
    )
    parser.add_argument(
        "--compare-out",
        help="only in comparison mode, compare the output files for exact equivalence (has no effect if -s is set)",
        action='store_true',
    )

    args = parser.parse_args()

    validate_file_or_folder_exists(args.input_path)

    # Set up logging
    if args.debug:
        args.log_level = 'debug'
    log_level = logging.getLevelName(args.log_level.upper())
    logging.getLogger().setLevel(log_level)

    # Finish parsing the JSON data
    # Add regex input replacements to the solvers they apply to
    input_replacements = solver_data["input_replacements"]
    for solver in solver_names:
        solvers[solver]["input_regex_replacements"] = []
        for replacement in input_replacements:
            applies_to = replacement["applies_to"]
            if applies_to == "ALL" or solver in applies_to:
                solvers[solver]["input_regex_replacements"].append(
                    (replacement["replace"], replacement["with"]))
    # Add regex output pattern and CLI data
    output_pattern = solver_data["output_pattern"]
    for solver in solver_names:
        solvers[solver]["name"] = solver
        solvers[solver]["timeout"] = args.timeout
        solvers[solver]["reps"] = args.num_repetitions
        solvers[solver]["randomize"] = (args.randomize == 'y')
        solvers[solver]["opts"] += args.opts
        solvers[solver]["output_pattern"] = output_pattern

    # Get specific set of solvers to use
    using_solvers = args.solvers
    if args.baseline:
        using_solvers = [args.baseline] + using_solvers
        solvers[using_solvers[0]]["name"] += " (baseline)"
    n_solvers = len(using_solvers)
    if args.standalone and n_solvers != 1:
        logging.error("expected only one solver in standalone mode"
                      f" ({n_solvers} provided)")
        sys.exit(1)
    if args.comparison and n_solvers != 2:
        logging.error("expected exactly two solvers in comparison mode,"
                      f" including the baseline ({n_solvers} provided)")
        sys.exit(1)
    elif args.comparison:
        solvers[using_solvers[1]]["name"] += " (under test)"

    # Log result
    logging.info(f"Parsed JSON solver data from {SOLVER_JSON_FILEPATH}")
    logging.debug(f"JSON result: {solvers}")

    solver_impls = [SolverImpl(**(solvers[s])) for s in using_solvers]

    input_path = os.path.normpath(args.input_path)
    if os.path.isdir(input_path):
        test_file_pattern = os.path.join(input_path, TEST_FILE_PATTERN)
    else:
        test_file_pattern = input_path

    # === Standalone Mode ===
    if args.standalone:
        temp_files = TEMP_IN_FILES
        out_files = []
        def test_fun(filepath):
            run_standalone_test_case(solver_impls[0], filepath, args.debug)
        print_summary = None

    # === Comparison Mode ===
    elif args.comparison:
        temp_files = TEMP_IN_FILES + TEMP_OUT_FILES
        out_files = []
        def test_fun(filepath):
            run_comparison_test_case(solver_impls[1], solver_impls[0],
                                     filepath, args.compare_out, args.debug)
        print_summary = None

    # === Default Mode (any number of solvers) ===
    else:
        validate_folder_exists(RESULTS_FOLDER)
        temp_files = TEMP_IN_FILES
        timestr = time.strftime("%Y%m%d_%H%M%S")
        sum_suffix = "_" + os.path.basename(input_path) + SUMMARY_RESULTS_SUFFIX
        raw_suffix = "_" + os.path.basename(input_path) + RAW_RESULTS_SUFFIX
        summary_file = os.path.join(RESULTS_FOLDER, timestr + sum_suffix)
        raw_file = os.path.join(RESULTS_FOLDER, timestr + raw_suffix)
        out_files = [summary_file, raw_file]
        totals_objs = [TestResultTotals(s.name) for s in solver_impls]
        def test_fun(filepath):
            kwd_args = dict()
            # If filepath contains 'sat' or 'unsat', this labels satisfiability
            if ANSWER_UNSAT in filepath:
                kwd_args["correct_answer"] = ANSWER_UNSAT
            elif ANSWER_SAT in filepath:
                kwd_args["correct_answer"] = ANSWER_SAT
            # Otherwise fall back on baseline
            elif args.baseline:
                kwd_args["baseline_index"] = 0
            run_group_test_case(solver_impls, totals_objs,
                                filepath, args.debug, **kwd_args)
        def print_summary():
            logging.info(f"\n{list_of_totals_tostr(totals_objs)}")
            with open(summary_file, "w") as fh:
                list_of_totals_dump_summary(totals_objs, fh)
                # Add some other useful info
                fh.write("===== Experiment Info =====\n")
                fh.write(f"command: {sys.argv}\n")
                fh.write(f"parsed: {args}\n")
                fh.write(f"solvers:\n")
                for impl in solver_impls:
                    fh.write(f"- {impl}\n")
            with open(raw_file, "w") as fh:
                list_of_totals_dump_raw(totals_objs, fh)
            logging.info(f"Results successfully saved to"
                         f" {summary_file} and {raw_file}.")

    # === Run the Tests ===
    for temp_file in (temp_files + out_files):
        validate_file_dne(temp_file)

    logging.info(f"========== {SCRIPT_NAME}: Running Tests ==========")
    try:
        do_for_all(test_file_pattern, test_fun)

    finally:
        # clean up temp files
        for temp_file in temp_files:
            with contextlib.suppress(FileNotFoundError):
                os.remove(temp_file)

    if print_summary is not None:
        logging.info(f"========== {SCRIPT_NAME}: Summary ==========")

        print_summary()

    sys.exit(0)
