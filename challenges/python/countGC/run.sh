#! /bin/bash

python3 << 'EOF'
import sys

for line in sys.stdin:
  line = line.strip()
  gc_count = line.upper().count('G') + line.upper().count('C')
  length = len(line)
  if length > 0:
    print(f"{gc_count/length:.6f}")
EOF
  < input > out/result.txt
