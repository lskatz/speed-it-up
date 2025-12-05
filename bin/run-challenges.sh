#!/bin/bash

thisDir=$(dirname "$0")

categories=$(find $thisDir/../challenges -type f -name categories | \
  xargs cat | sort -u)

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
