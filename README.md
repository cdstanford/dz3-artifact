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

### Claims Supported

This artifact supports all of the experimental claims made in Section 6 of the paper. Namely:

- Figure 6 in `paper-appendix.pdf`: the full table of experimental results;

- Figure 4(a), showing the average time, median time, and number of benchmarks solved for dZ3 and the various baselines; and

- Figure 4(b), showing the cumulative number of benchmarks solved in each amount of time or less.

## Getting Started Guide

<!-- TODO -->

## Step-by-Step Instructions

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
