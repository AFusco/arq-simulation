#!/bin/bash
set -e

OUT_EXT=".err"
BP_FILE="BranchPredictor"
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
OUT_DIR=$ROOT_DIR/out
RUNS_DIR=$ROOT_DIR/runs

for run_path in $RUNS_DIR/*/; do
    run_id=$(basename $run_path)
    sim_id=$(cat $run_path/data)

    echo $run_path
    echo $run_id
    echo $sim_id

    #Build output files



    for simulation in $run_path/*$OUT_EXT; do
        exec_name=$(basename ${simulation%%.*})
        out_file="$OUT_DIR/$sim_id-$exec_name.ini"
        echo $out_file
        cat "$run_path/$BP_FILE" > $out_file
        cat "$simulation" >> $out_file

    done

    echo " "
done

