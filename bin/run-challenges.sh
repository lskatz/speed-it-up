#!/bin/bash

replicates=10

thisDir=$(dirname "$0")

for challenge in challenges/*/*; do
  if [ -f "$challenge/run.sh" ]; then
    mkdir -p "$challenge/out"
    echo "Running challenge: $challenge"
    (
        cd "$challenge"
        echo -n "" > time.txt
        for rep in $(seq 1 $replicates); do 
            \time bash run.sh --output=devnull.txt >> time.txt 2>&1;
        done
    )
  fi
done
