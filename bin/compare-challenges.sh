#!/bin/bash

thisDir=$(dirname "$0")
resultsDir=$(realpath "$thisDir/../times")

categories=$(find $thisDir/../challenges -name "categories" -type f -exec cat {} \; | sort | uniq)

# Start off with the header
echo -ne "Challenge\tContestant\treps\ttime(s)\n"

for challenge in $resultsDir/*.time; do
    # Skip any files like README.md.
    # Challenges are represented in directories.
    if [ ! -d "$challenge" ]; then
        continue
    fi

    times=$challenge/*.time.txt
    for contestant in $times; do
        echo -ne "$(basename $challenge)\t$(basename $contestant .time.txt)"
        # Parse times into an array so that we can calculate averages. Times are given in the format:
        # 0.01user 0.03system 0:00.04elapsed 89%CPU (0avgtext+0avgdata 5224maxresident)k
        # 0inputs+8outputs (0major+1527minor)pagefaults 0swaps
        total_user_time=0
        num_reps=0
        while read -r line; do
            user_time=$(echo $line | awk '{print $1}' | sed 's/user//')
            # Skip lines without times like 0 + 0inputs+8outputs
            if [[ "$user_time" =~ inputs ]]; then
                continue
            fi
            total_user_time=$(echo "$total_user_time + $user_time" | bc)
            num_reps=$((num_reps + 1))
        done < "$contestant"
        average_user_time=$(echo "scale=2; $total_user_time / $num_reps" | bc)
        echo -ne "\t$num_reps\t$average_user_time"
        echo ""
    done
done