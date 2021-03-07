# dZ3

This is the artifact for the paper: *Symbolic Boolean Derivatives for Efficiently Solving Extended Regular Expression Constraints.* This repository is for the artifact evaluation for PLDI 2021.

## Artifact Overview

dZ3 is an SMT solver for regular expression constraints. It is built on top of the SMT solver Z3, and has since been included with the [latest release of Z3](https://github.com/Z3Prover/z3).

Because Z3 is its own open source code base, this artifact does not attempt to be a packaged copy of Z3, but rather focuses on the dZ3-specific code and experimental scripting. In particular, this artifact contains:

- A snapshot of the dZ3 code (i.e. only the files modified for dZ3) at the time that the artifact was built and evaluated (`/code`).

- Executables for dZ3, Z3 and the other SMT solvers that were used as baselines (`/solvers`).

- The suite of SMT benchmarks that were used for evaluation in the paper (`/benchmarks`).

- Scripting that can be used to compare SMT solver outputs on a set of benchmarks, and in particular to generate the experiment results in the paper (`/experiments`).

- A copy of the PLDI paper and supplementary material (`/paper.pdf` and `/paper-appendix.pdf`).

- Additional documentation about the solver, how to use it, and how to replicate the experiments (this file).

Of these, the main script is `experiments/run_all.py`, which is a command-line tool for comparing a set of SMT solvers on a given directory of benchmark files.

### Claims Supported

This artifact supports all of the experimental claims made in Section 6 of the paper. Namely:

- Figure 6 in `paper-appendix.pdf`: the full table of experimental results;

- Figure 4(a), showing the average time, median time, and number of benchmarks solved for dZ3 and the various baselines; and

- Figure 4(b), showing the cumulative number of benchmarks solved in each amount of time or less.

## Getting Started Guide

<!-- TODO: Instructions to download/open/run the docker container -->

Once the docker container is running, if you `ls home` you should be able to view the contents of the artifact: this `README.md`, the paper `.pdf` files, as well as the folders mentioned in the overview (`benchmarks`, `code`, `experiments`, and `solvers`) if you would like to poke around.

To get started, run `cd home/experiments`, then `./run_all.py --help`. You should see information about the command-line options to run various experiments like the following:

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

If that works, you can run the following full experiment, which should take no more than `10` minutes. Run `./run_all.py dz3 cvc4 z3str3 z3trau ostrich z3 -i ../benchmarks/suite_tiny/handwritten -t 10`. You will get one warning which can safely be ignored (`WARNING:root:Solver ostrich: 'randomize=true' ignored because solver does not support random seeds`).
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
The full benchmark suite is in `../benchmarks/suite_full`, but running all of these takes over 24 hours. To give something that can be validated on a more reasonable timeframe, we culled the benchmarks in `../benchmarks/suite_small` and then even further in `../benchmarks/suite_tiny`. A word of warning though: not all benchmark subfolders are culled equally (because some are much larger suites than others). As a result of this and general variation in running time, the results you get should **NOT** exactly match those in the paper. However, you should be able to observe the same general shape and rough trends as reported in the paper.

<!-- TODO -->

## Additional Documentation

### Running Your Own Examples

<!-- TODO -->

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
