#!/bin/bash

replicates=10

thisDir=$(dirname "$0")

function run_challenge {
    challenge_dir=$1
    category=$2
    outdir=$(realpath "$thisDir/../times/$category.time")
    mkdir -pv "$outdir"
    outfile="$outdir/$(basename $challenge_dir).time.txt"
    (
        cd "$challenge_dir"
        echo -n "" > "$outfile"
        for rep in $(seq 1 $replicates); do 
            \time bash run.sh --output=devnull.txt >> "$outfile" 2>&1;
        done
    )
}

for challenge in challenges/*; do
  if [[ ! -f "$challenge/run.sh" ]] || [[ ! -f "$challenge/categories" ]]; then
    continue
  fi
    categories=$(cat "$challenge/categories")
    for i in $categories; do
        run_challenge "$challenge" "$i"
    done
done

