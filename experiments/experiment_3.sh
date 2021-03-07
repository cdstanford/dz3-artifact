#!/bin/sh
set -u
set -e
TIMEOUT=10
# NOTE: may need to replace python3.7 with python3.
SCRIPT="python3 run_all.py"
SOLVERS="dz3 z3str3 z3trau cvc4 ostrich"
BASELINE="z3"
CMD="$SCRIPT $SOLVERS -b $BASELINE -t $TIMEOUT -i"
PROGRESSFILE="progress.txt"
BASEFOLDER="../benchmarks/suite_full/"
FOLDERS="handwritten"

rm $PROGRESSFILE || true

for folder in $FOLDERS
do
    echo "Running: $BASEFOLDER$folder" >> $PROGRESSFILE
    $CMD $BASEFOLDER$folder
    echo "Done" >> $PROGRESSFILE
done
echo "Script Complete" >> $PROGRESSFILE
