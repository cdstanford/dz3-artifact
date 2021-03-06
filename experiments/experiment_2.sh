#!/bin/sh
set -u
set -e
TIMEOUT=10
SCRIPT="python3 run_all.py"
SOLVERS="dz3 z3 z3str3 z3trau cvc4"
BASELINE="ostrich"
CMD="$SCRIPT $SOLVERS -b $BASELINE -t $TIMEOUT -i"
PROGRESSFILE="progress.txt"
BASEFOLDER="../benchmarks/suite_small/boolean/"
FOLDERS="nbw_bv8_intersection nbw_bv8_subset QF_SLIA_Norn"

rm $PROGRESSFILE || true

for folder in $FOLDERS
do
   echo "Running: $BASEFOLDER$folder" >> $PROGRESSFILE
   $CMD $BASEFOLDER$folder
   echo "Done" >> $PROGRESSFILE
done

# use CVC4 baseline for sygus-qgen benchmarks
folder="QF_S_sygus_qgen"
SOLVERS="dz3 z3 z3str3 z3trau ostrich"
BASELINE="cvc4"
CMD="$SCRIPT $SOLVERS -b $BASELINE -t $TIMEOUT -i"
echo "Running: $BASEFOLDER$folder" >> $PROGRESSFILE
$CMD $BASEFOLDER$folder
echo "Done" >> $PROGRESSFILE

echo "Script Complete" >> $PROGRESSFILE
