#!/bin/bash

thisDir=$(dirname "$0")

for challenge in challenges/*/*; do
  if [ -f "$challenge/run.sh" ]; then
    mkdir -p "$challenge/out"
    echo "Running challenge: $challenge"
    (
        cd "$challenge"
        \time bash run.sh --output=devnull.txt > time.txt 2>&1
    )
  fi
done
