# dZ3

This is the artifact for the paper: *Symbolic Boolean Derivatives for Efficiently Solving Extended Regular Expression Constraints.*

## Artifact Overview

dZ3 is an SMT solver for regular expression constraints. It is built on top of the SMT solver Z3, and has since been included with the [latest release of Z3](https://github.com/Z3Prover/z3).

Because Z3 is its own open source code base, this artifact does not attempt to be a packaged copy of Z3, but rather focuses on the dZ3-specific code and experimental scripting. In particular, this artifact contains:

- A snapshot of the dZ3 code (i.e. only the files modified for dZ3) at the time that the artifact was built and evaluated (`/code`);

- Executables for Z3 and the other SMT solvers that were used as baselines (`/solvers`);

- A set of SMT benchmarks that were used for evaluation in the paper (`/benchmarks`);

- Scripting that can be used to compare SMT solver outputs on a set of benchmarks, and in particular to generate the experiment results in the paper (`/experiments`)

- Additional documentation about the solver, how to use it, and how to replicate the experiments (this file).

### Claims Supported

This artifact supports all of the experimental claims made in Section 6 of the paper. Namely:

- Figure 6 in `paper-appendix.pdf`: the full table of experimental results;

- Figure 4(a), showing the average time, median time, and number of benchmarks solved for dZ3 and the various baselines; and

- Figure 4(b), showing the cumulative number of benchmarks solved in each amount of time or less.

### 

## Getting Started Guide

## Step-by-Step Instructions
