# dZ3

This is the artifact for the paper: *Symbolic Boolean Derivatives for Efficiently Solving Extended Regular Expression Constraints.* This artifact is provided as a Docker container for the artifact evaluation for PLDI 2021.

If convenient, you can also view the artifact files online on GitHub [here](https://github.com/cdstanford/dz3-artifact). The GitHub repository contains everything in the Docker container except the solver binaries, which are too large.

## Artifact Overview

dZ3 is an SMT solver for regular expression constraints. It is built on top of the SMT solver Z3, and has since been included with the [latest release of Z3](https://github.com/Z3Prover/z3).

Because Z3 is its own open source code base, this artifact does not attempt to be a packaged copy of Z3, but rather focuses on the dZ3-specific code and experimental scripting. In particular, this artifact contains:

- A snapshot of the dZ3 code (i.e. only the files modified for dZ3) at the time that the artifact was built and evaluated (`/code`).

- Executables for dZ3, Z3 and the other SMT solvers that were used as baselines (`/solvers`).

- The suite of SMT benchmarks that were used for evaluation in the paper (`/benchmarks`).

- Scripting that can be used to compare SMT solver outputs on a set of benchmarks, and in particular to generate the experiment results in the paper (`/experiments`).

- A copy of the PLDI paper (submitted version), including the appendix (`/paper.pdf`).

- Additional documentation about the solver, how to use it, and how to replicate the experiments (this file).

Of these, the main script is `experiments/run_all.py`, which is a command-line tool for comparing a set of SMT solvers on a given directory of benchmark files.

### Claims Supported

This artifact supports all of the experimental claims made in the paper. The particular figures are:

- Appendix Figure 6, the full table of experimental results.

- Section 6 Figure 4(a), showing the average time, median time, and number of benchmarks solved for dZ3 and the various baselines.

- Section 6 Figure 4(b), showing the cumulative number of benchmarks solved in each amount of time or less.

## Getting Started Guide

**Running the Docker Container:**
You will need a working installation of [Docker](https://www.docker.com/).
Run `docker run hello-world` to see if it is working properly.
You should have a file `dz3.tar` which contains the docker image.
The file is about 2.7GB, and the md5 checksum is `ba33f408d84ac315b1a6ec5873a838a3`,
Please load the image with `docker load dz3.tar`.
You can see all of your images with `docker image ls`; you should
see one listed as `dz3 dz3`.
Load the image into an interactive container with `docker run -it dz3:dz3`
This should bring you into an Ubuntu shell to continue the remainder of the instructions.
You can quit the shell (and exit the container) with `ctrl-D`.
Outside of this shell, you can see all (past and currently running) containers with `docker ps -a`.
The `README.md` inside the artifact is identical to this one, except that it does not contain this paragraph.

Once the docker container is running, if you `ls home` you should be able to view the contents of the artifact: this `README.md`, the paper `.pdf` files, as well as the folders mentioned in the overview (`benchmarks`, `code`, `experiments`, and `solvers`) if you would like to poke around.

To get started, run `cd home/experiments`, then `./run_all.py --help`. You should see information about the command-line options to run various kinds of experiments:

```
$ ./run_all.py --help
INFO:root:========== run_all.py: Initializing ==========
usage: run_all.py [-h] -i INPUT_PATH [-s] [-c] [-b SOLVER]
                  [--opts OPTS] [-t TIMEOUT] [-n NUM_REPETITIONS]
                  [-r {y,n}] [-l {debug,info,warning,error}] [-d]
                  [--compare-out]
                  SOLVER [SOLVER ...]

positional arguments:
  SOLVER                name of solver or list of solvers to test
                        (edit solvers.json to make additional solvers
                        available) -- choices {dz3, z3str3, cvc4,
                        z3trau, ostrich, z3}

optional arguments:
  -h, --help            show this help message and exit
  -i INPUT_PATH, --input-path INPUT_PATH
                        file or directory containing testcases or
                        benchmarks to run, e.g.
                        '../benchmarks/handwritten' (if a directory,
                        runs recursively in all subfolders)
  -s, --standalone      run in standalone mode: test a single solver
                        implementation for fast/slow output and errors
  -c, --comparison      run in comparison mode: compare a solver
                        implementation against a baseline, and report
                        on regressions or speedups
  -b SOLVER, --baseline SOLVER
                        name of baseline solver to test, in addition
                        to the listed solvers (edit solvers.json to
                        provide other solvers) (required in comparison
                        mode) -- choices {dz3, z3str3, cvc4, z3trau,
                        ostrich, z3}
  --opts OPTS           additional command line options (separated by
                        whitespace) to pass to the solver
                        executable(s)
  -t TIMEOUT, --timeout TIMEOUT
                        timeout for each test case
  -n NUM_REPETITIONS, --num-repetitions NUM_REPETITIONS
                        number of repetitions for each test case
  -r {y,n}, --randomize {y,n}
                        use random seeds to randomize each solver run
  -l {debug,info,warning,error}, --log-level {debug,info,warning,error}
                        set logging level (has no effect if --debug is
                        set)
  -d, --debug           mode to debug solver output and crashes
                        (implies '--log-level debug')
  --compare-out         only in comparison mode, compare the output
                        files for exact equivalence (has no effect if
                        -s is set)
```

To use the script, we supply a list of solver names to compare followed by `-i INPUT_PATH` where `INPUT_PATH` is a directory of `.smt2` benchmarks (SMT benchmarks in the standard `.smt2` format).
For a quick stress test, try comparing `dz3` against the baseline solvers `cvc4`, `z3str3`, and `z3` on one of the handwritten benchmark folders using a timeout of `5` seconds:

```
./run_all.py dz3 cvc4 z3str3 z3 -i ../benchmarks/suite_tiny/handwritten/boolean_and_loops/ -t 5
```

You should first see some logging about how the solvers are configured (`INFO:root:Configured solver implementation: ...`), then a list of the tests as they are being run. Each test prints out the result of each solver on the input test file, for example:
```
INFO:root:Results at ../benchmarks/suite_tiny/handwritten/boolean_and_loops/./unsat/nestedloop1_unsat.smt2:
    dz3: unsat (0.10s)
    cvc4: unsat (0.02s)
    z3str3: Crash
    z3: unsat (0.02s)
```

All that the script is doing is running these four SMT solver executables on the given input file: if you are curious, you can see what the input file looks like (in SMT syntax) for the above example or any other by running `cat ../benchmarks/suite_tiny/handwritten/boolean_and_loops/./unsat/nestedloop1_unsat.smt2`.
It is also parsing the output and trying to determine whether each solver's output was correct (sat or unsat matching the correct label), or incorrect in some way (wrong, crash, unknown, timeout).

After all tests are finished, the script will then print a summary including how many benchmarks each solver solved, and how long it took to solve them, in buckets of `< .04`, `< 0.12`, `< .37`, `< 1.1`, `< 3.3`, and `< 10.2`.
The output should be similar to the following.
However, please note that you will get at least minor variations, particularly in the time buckets table, due to running times which are close to the bucket boundaries.
Additional factors are that the solvers are random (initialized with a random seed), and that there is always variation in running time over different runs and on different platforms.
```
INFO:root:========== run_all.py: Summary ==========
INFO:root:
===== Categories =====
              solver sat unsat other blank unchk unk wrong tmout crash
                 dz3   3     4     0     0     0   0     0     0     0
                cvc4   2     3     0     0     0   0     0     0     2
              z3str3   2     0     0     0     0   0     1     0     4
                  z3   2     4     0     0     0   0     0     0     1
===== Time Buckets =====
              solver 0.041 0.12 0.37 1.1 3.3 10.2
                 dz3     6    1    0   0   0    0
                cvc4     5    0    0   0   0    0
              z3str3     2    0    0   0   0    0
                  z3     5    0    1   0   0    0

INFO:root:Results successfully saved to results/20210306_231158_boolean_and_loops_summary.txt and results/20210306_231158_boolean_and_loops_raw.csv.
```

**Java Check:** Please also run the following test with the `ostrich` solver, since this will make sure there are no problems with the `java` installation: `./run_all.py ostrich -i ../benchmarks/suite_tiny/handwritten/boolean_and_loops/ -t 5`.
As long as Ostrich is reporting some `sat` and `unsat` answers (not all `crash`), everything should be good.

If all of this works, you can run the following full experiment, which should take no more than `10` minutes. Run `./run_all.py dz3 cvc4 z3str3 z3trau ostrich z3 -i ../benchmarks/suite_tiny/handwritten -t 10`. You will get one warning which can safely be ignored (`WARNING:root:Solver ostrich: 'randomize=true' ignored because solver does not support random seeds`).
Verify that the output is roughly similar to the following.
```
INFO:root:========== run_all.py: Summary ==========
INFO:root:
===== Categories =====
              solver sat unsat other blank unchk unk wrong tmout crash
                 dz3  12    11     0     0     0   0     0     4     0
                cvc4   9     6     0     0     0   0     0     8     4
              z3str3   6     1     0     0     0   0     4     9     7
              z3trau   1     1     0     0     0   1     2     2    20
             ostrich  10    11     0     0     0   0     2     3     1
                  z3   4     8     0     0     0   0     0    13     2
===== Time Buckets =====
              solver 0.041 0.12 0.37 1.1 3.3 10.2
                 dz3    11    5    2   2   2    1
                cvc4     8    2    1   1   1    2
              z3str3     4    2    1   0   0    0
              z3trau     1    1    0   0   0    0
             ostrich     0    0    0   1  20    0
                  z3     5    1    0   4   2    0

INFO:root:Results successfully saved to results/20210306_234110_handwritten_summary.txt and results/20210306_234110_handwritten_raw.csv.
```

The `./run_all.py` command line options are documented in `--help`.
You are welcome to try different options to the script, for example `-d` to print debug info, `-r n` to not initialize the solvers with random seeds, or `-n 5` to repeat each benchmark 5 times instead of just once.

The rest of this file is structured as follows.
To validate the experimental results / figures reported in the paper, proceed to "Step-by-Step instructions".
If you would like to test the solver (and baselines) on some new or modified input files, see "Running your Own Examples" under "Additional Documentation".

## Step-by-Step Instructions

This section contains instructions to validate the experimental results from the paper.

### Caveats

**Generating the Plots:**
Unfortunately, the Figure 4 plots in the paper were generated with external spreadsheets (Google sheets), and can't be generated using the command-line tool. If the simplest possible evaluation is desired, we recommend that the reader focus on the complete experimental results table in the appendix (Figure 6), rather than on Figure 4. While less visual (and thus a bit more tedious to inspect), this table contains all the same data as in the figures. It has the additional advantage that it includes complete results rather than just summarized, and it is directly comparable with the raw output produced by the command-line tool.

For completeness sake, however, we also provide a link to the Google spreadsheets where generating the plots can be done.
We do not recommend this unless you are familiar with Google spreadsheets and have a bit more time.
First make a copy of the spreadsheets to your own Google Drive.
In each spreadsheet, find the tab(s) with raw CSV data, select-all and delete the data, and paste in the CSV data from the `results/<experiment name>_raw.csv` file that was generated when you ran the relevant experiment.
This should hopefully cause the plots in the other tab to automatically update.
**Important Note:** If you choose to access the following link, please ensure that you are doing so from an anonymous browser or incognito window so as not to risk revealing your identity.
[Google Drive Folder Link](https://drive.google.com/drive/folders/1RaMp1nYRfHU9bu9dFHuiidQj1Dv62d5K?usp=sharing)

**Abridged Benchmark Suites:**
The full benchmark suite is in `../benchmarks/suite_full`, but running all of these takes close to 24 hours. To give something that can be validated on a more reasonable timeframe, we sampled a small subset of the benchmarks in `../benchmarks/suite_small`, and then an even smaller subset in `../benchmarks/suite_tiny`. **An additional word of warning:** not all original benchmark subfolders are represented equally (because some were much larger suites than others, they were thinned more aggressively). As a result of this and general variation in running time, the results you get should **not exactly** match those in the paper. However, you should be able to observe the same rough trends as reported in the paper.

**Timeouts:**
The experiments in the paper were run with a 10 second timeout.
Besides running `../benchmarks/suite_tiny` instead of `../benchmarks/suite_full`, you may use a smaller timeout (e.g., `-t 1` for 1 second) to get faster results, depending on your preference. We will provide specific estimates for the experiment running times below, so you can judge accordingly.

### Experiment 1

The first experiment corresponds to the top 3 groups in Figure 6 (Kaluza, Slog, and Norn).
To run it, make sure you are still in `/home/experiments`, then run `./experiment_1.sh`.
This is a wrapper script providing options to `run_all.py`.
This is configured to run the `suite_small` benchmark set (i.e., after one iteration of thinning the benchmarks).
On our machine, the script takes **up to 20 minutes** to run.
If you want to run a shorter version, edit the timeout (see "If you want different options" below) to 5 seconds or 1 seconds.

Once the script completes, run `ls results`: look for the most recently created files (file names are prefixed by date and time) ending in `_kaluza_raw.csv`, `_slog_raw.csv`, and `_Norn_raw.csv`. Run `cat` on one of these files and compare with the Figure 6 table.
Note that because we ran on a thinned benchmark set, the number of benchmarks is much smaller in each table entry, but the general trend (relative size of benchmarks in each entry) should roughly match up. For example, here is what we get for this table:
```
===== Categories =====
              solver sat unsat other blank unchk unk wrong tmout crash
     cvc4 (baseline)  77    51     0     0     0   0     0     3     0
                 dz3  75    51     0     0     0   0     0     5     0
                  z3  72    51     0     0     0   0     0     8     0
              z3str3  76    51     0     0     0   0     0     4     0
              z3trau  73    51     0     0     0   0     0     7     0
             ostrich  37    49     0     0     0   0     0     1    44
===== Time Buckets =====
              solver 0.041 0.12 0.37 1.1 3.3 10.2
     cvc4 (baseline)   111   14    0   3   0    0
                 dz3   120    3    0   1   2    0
                  z3   118    2    0   0   2    1
              z3str3   109   10    7   1   0    0
              z3trau    86   14   17   4   2    1
             ostrich     0    0    0  37  49    0
```

In the top table, the extra columns `other`, `blank`, `unk` are not reported in the paper figure as they are all zero.
Notice that the trends in the above table match those in Figure 6:
The solvers except ostrich solve most of the sat/unsat benchmarks but timeout on a smaller fraction, and ostrich reports an error on some subset of the benchmarks. In the time buckets, cvc4, dz3, and z3 are concentrated in the lowest buckets, whereas z3trau displays some spread of higher times, and ostrich is concentrated in the 0.37 to 1.1 and 1.1 to 3.3 s buckets.

If you want different options, you can modify the script with `nano experiment_1.sh`. In particular, you can decrease the timeout at the top to 5 or 1 second instead of 10; this roughly cuts the time by up to a factor of 2 or a factor of 10, respectively.
You may modify the script to replace `suite_small` with `suite_full`; this takes up to 12 hours, but can be done in around 1 hour with `TIMEOUT=0.5`.
With a smaller timout, you should expect to see that the time buckets larger than that timeout in the table change into timeouts, and the number of solved benchmarks (sat or unsat) should decrease correspondingly.

### Experiment 2

The second experiment corresponds to the middle 4 groups in Figure 6 (Norn, SyGuS-qgen, and RegExLib).
To run it, make sure you are still in `/home/experiments`, then run `./experiment_2.sh`.
As with experiment 1, this is configured to run the `suite_small` benchmark set (i.e., after one iteration of thinning the benchmarks).
This script should take **about 30-40 minutes** to run.

There should be four new `_summary.txt` output files in `ls results`. The `RegExLib` benchmarks are named as `nbw_bv8`.
As with experiment 1, the benchmark thinning results in smaller entries than in Figure 6; please compare to see if the overall trends and relative sizes of the entries are similar.

For a reference example, here is the output we get for `SyGuS-qgen`:
```
# cat results/20210307_094512_QF_S_sygus_qgen_summary.txt
===== Categories =====
              solver sat unsat other blank unchk unk wrong tmout crash
     cvc4 (baseline)  28     0     0     0     0   0     0     0     0
                 dz3  28     0     0     0     0   0     0     0     0
                  z3   3     0     0     0     0   0     0    25     0
              z3str3  23     0     0     0     0   0     0     3     2
              z3trau   8     0     0     0     0   0     0    18     2
             ostrich   0     0     0     0     0   0     0     0    28
===== Time Buckets =====
              solver 0.041 0.12 0.37 1.1 3.3 10.2
     cvc4 (baseline)     2    2    8   9   5    2
                 dz3     5   16    7   0   0    0
                  z3     0    0    0   0   0    3
              z3str3    23    0    0   0   0    0
              z3trau     0    0    0   2   1    5
             ostrich     0    0    0   0   0    0
```

### Experiment 3

The third experiment corresponds to the bottom group in Figure 6 (Handwritten).
To run it, make sure you are still in `/home/experiments`, then run `./experiment_3.sh`.

Unlike the first two experiments, there are not as many handwritten experiments. So, the script is configured for the artifact to run all of them (the `suite_full` benchmark set), without thinning.
However, we configured it with a 5 second timeout, instead of 10 seconds in the paper.
This script should take **about 15 minutes** to run.

There should be a single new `_handwritten_summary.txt` output file in `ls results`.
Note that `z3str3` and `z3trau` are missing from this table due to lack of support for certain regex constructs.
Because of the lack of thinning, this table should be directly comparable to Figure 6 in the paper.
For reference, here is the output we get on the Docker container:
```
===== Categories =====
              solver sat unsat other blank unchk unk wrong tmout crash
       z3 (baseline)  14    23     0     0     0   0     2    46     4
                 dz3  40    37     0     0     0   0     0    12     0
                cvc4  25    23     0     0     0   0     0    28    13
             ostrich  40    36     0     0     0   0     5     6     2
===== Time Buckets =====
              solver 0.041 0.12 0.37 1.1 3.3 10.2
       z3 (baseline)    20    4    2   7   2    2
                 dz3    37   10   11   9   6    4
                cvc4    26    8    3   2   8    1
             ostrich     0    0    0  45  31    0
```

Note: The fact that `z3` is labeled as `baseline` can be ignored here. The baseline is used to determine a correct answer if a benchmark is not labeled, but all of the handwritten benchmarks are labeled.

## Additional Documentation

### Running Your Own Examples

If you want to try out the regular expression solver on your own examples, first create a new folder: `mkdir new_examples`, which we will now add `.smt2` files to.
For the syntax, it may be helpful to copy over and modify an existing handwritten example: `cp ../benchmarks/suite_tiny/handwritten/boolean_and_loops/unsat/inter_mod3_unsat.smt2 new_examples`.
Then run `nano new_examples/inter_mod3_unsat.smt2`:

```
(declare-const x String)
(assert (str.in_re x
    (re.inter
        (re.* (str.to_re "aaa"))
        (re.++ (str.to_re "a") (re.* (str.to_re "aaa")))
)))
(check-sat)
```

The general recipe is as follows. We first declare a string variable with `(declare-const x String)`.
Then, we assert one or more constraints on the string with `(assert (str.in_re x <REGEX>))`, where `<REGEX>` is a regular expression that we construct, and that may involve various operators, including union, concatenation, star as well as Boolean operations and several others. Above, the regular expression starts out with an intersection, which is denoted `re.inter`.
The first element of the intersection is a star (repetition) `re.*`, and the second is a concatenation `re.++`. The syntax `str.to_re "a"` is used to make a regular expression from a string, and these are the atomic regular expressions that are combined with the other operators.
At the end, after one or more `(assert (str.in_re x <REGEX>))` constraints, we write `(check-sat)` to ask the SMT solver whether this system of constraints is satisfiable.

Reading this semantically, in this case we have asserted that the string `x` is in the intersection of two languages, where the first is all strings made up of a sequence of `aaa`s, and the second is all strings made up of `a` followed by a sequence of `aaa`s. That is, `x` must be a string of `a`s where the length is both a multiple of 3 and also one more than a multiple 3.
Since this is impossible, we should expect a solver to return `unsat`.

To test out the example, we can run `./run_all.py -s dz3 -i new_examples -d`.
The `-s` indicates we are running in standalone mode, just looking at the output of a single solver.
The `-d` indicates we are running in debug mode, and is useful for seeing the actual output of dZ3 on each example, rather than just the final result. If you are editing the SMT2 file and make any syntax errors, this will also detect the crash and pause after the output of dZ3 to show the error and allow you to debug the mistake.

You can add other examples to `new_examples`, in which case `./run_all.py -s dz3 -i new_examples -d` will run all of them as in all the previous experiments. You can also try a different solver than `dz3` to see how they compare, or you can use the normal experiment mode `./run_all.py dz3 cvc4 <...> -i new_examples` to compare all the solvers and generate a table.

The following are the SMT2 syntax that are most common in creating regular expression benchmarks:

- `(str.in_re <string> <regex>)`: the top-level constraint that a string matches a given regular expression.

- `(= <regex> <regex>)`: alternative top-level constraint where we assert two regexes are equal, instead of that a string matches a regex.

- `(re.union <regex> <regex>)`: union of two regular expressions.

- `(re.++ <regex> <regex>)`: concatenation of two regular expressions.

- `(re.inter <regex> <regex>)`: intersection of two regular expressions.

- `(re.* <regex>)`: repetition (star) of zero or more matches of a regular expression.

- `(re.comp <regex>)`: complement of a regular expression -- matches all strings which do NOT match `<regex>`.

- `(str.to_re <string>)`: a regular expression formed from a string constant. This is how you create a regular expression from a character, or the epsilon regular expression by specifying the string to be `""`.

- `(re.range <char> <char>)`: instead of specifying a single character you can also specify a character range. For example, `(re.range "a" "z")` matches a character between `a` and `z`.

- `re.all` is the regular expression which matches any string (universal language).

- `re.none` is the regular expression which matches no strings (empty language).

- `re.allchar` is the regular expression matching all single-character strings.

- Finally, `((_ re.^ <lower> <upper>) <regex>)` is a useful construct for creating a star which must match a fixed number of times between the given lower and upper bounds. For example, `((_ re.^ 1 5) (re.range "a" "z"))` matches a string which is between 1 and 5 characters, where each is between `a` and `z`. The upper bound can also be omitted if desired.

### Extending the Solver

If you would like to modify, contribute to, or extend the regular expression solver in your own research, start from the most up-to-date [Z3 source code](https://github.com/Z3Prover/z3). The regex files can be found in `/src` and the directory structure parallels `/code` here. A brief introduction to the relevant files:

- `ast/seq_decl_plugin.{h,cpp}` contains a description of the AST for sequence and regular expression constraints, and helper functions which are used to create and match on AST terms. This is where the function to create a regex union or regex intersection exists, for example (`mk_union` and `mk_inter`), or to match on one (`is_union`, `is_intersection`). This is what needs to be edited if you want to add a new kind of regex operator or regex constraint to the AST grammar.

- `ast/rewriter/seq_rewriter.{h,cpp}` contains the rewriter for sequence and regular expression terms. This contains a large body of cheap simplifications (e.g., concatenation of an empty langage is empty, or rewriting a regular expression difference to an intersection). More importantly, this is where the regex derivative terms are calculated and normalized: see `mk_re_derivative`, `mk_derivative_rec`, and all the `mk_der_*` functions for the different derivative cases.

- `smt/seq_regex.{h,cpp}` contains the regex solver. The file `seq_regex.h` includes some documentation of tracing that can be turned on for debugging and for a rough analysis of performance issues. The main entrypoint is `seq_regex::propagate_in_re()`, where a constraint of the form `(str.in_re s r)` (string `s` matches regex `r`) is propagated and resolved via asserting new axioms. The solver makes heavy use of two wrappers around functions in the sequence solver: `derivative_wrapper()` which calculates the derivative of a regex, and `is_nullable_wrapper()` which determines if a regex matches the empty string.

- Finally, `util/state_graph.{h,cpp}` contains a utility data structure used by the `seq_regex` solver: it is a graph abstraction for tracking live and dead states in an abstract transition system. It is used by adding regular expressions and their derivatives to the graph; satisfiable regexes can then be identified as live and unsatisfiable regexes can then be identified as dead. It also contains support for outputting the state graph as a `.dot` file for visually viewing the set of regex derivatives as they are explored, which can be very useful for debugging and understanding the behavior of the solver.

### Related Repositories

- [The Z3 SMT Solver](https://github.com/Z3Prover/z3) contains the the most up-to-date code for the regex solver, and is where bug reports and requests should be filed.

- [Boolean Regex SMT Benchmarks](https://github.com/cdstanford/regex-smt-benchmarks) is a repository where the additional benchmarks that were used for this paper are being maintained (in particular, the handwritten benchmarks and the RegExLib benchmarks).

- [SMTLib Benchmarks](https://clc-gitlab.cs.uiowa.edu:2443/SMT-LIB-benchmarks) is where all the standard SMT benchmarks can be found, including Kaluza, Norn, and SyGuS-qgen which were used for this paper.
