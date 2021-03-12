#!/bin/sh
set -u
set -e
TIMEOUT=10
SCRIPT="python3 run_all.py"
SOLVERS="dz3 z3 z3str3 z3trau ostrich"
BASELINE="cvc4"
CMD="$SCRIPT $SOLVERS -b $BASELINE -t $TIMEOUT -i"
PROGRESSFILE="progress.txt"
BASEFOLDER="../benchmarks/suite_small/standard/"
FOLDERS="QF_SLIA_kaluza QF_S_slog"

rm $PROGRESSFILE || true

for folder in $FOLDERS
do
    echo "Running: $BASEFOLDER$folder" >> $PROGRESSFILE
    $CMD $BASEFOLDER$folder
    echo "Done" >> $PROGRESSFILE
done

# use Ostrich baseline for Norn benchmarks
folder="QF_SLIA_Norn"
SOLVERS="dz3 z3 z3str3 z3trau cvc4"
BASELINE="ostrich"
CMD="$SCRIPT $SOLVERS -b $BASELINE -t $TIMEOUT -i"
echo "Running: $BASEFOLDER$folder" >> $PROGRESSFILE
$CMD $BASEFOLDER$folder
echo "Done" >> $PROGRESSFILE

echo "Script Complete" >> $PROGRESSFILE
