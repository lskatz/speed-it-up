# speed-it-up

This is a repository to contain computational challenges. Who can write the fastest fastq parser? Average phred qualities?

This is not necessarily limited to just speed and so challenges could include other computational metrics like memory.

## Results!

Results can be found in [RESULTS.md](/RESULTS.md).

## Challenges

```bash
bash bin/run-challenges.sh
```

This script will run all challenges.
Results of `time` (and any future benchmarks) will be in `times/*.time/`.
Sets of challenges will be defined as having the same categories.

```bash
bash bin/compare-challenges.sh

Challenge     Contestant      reps  time(s)
countgc.time  countGC-perl    10    .01
countgc.time  countGC-python  10    .03
perl.time     countGC-perl    10    .01
python.time   countGC-python  10    .02
```

In this example, someone could compare `countGC-perl` and `countGC-python`
to compare the `countgc.time` challenge.

## Developing challenges

Each challenge is in its own folder and needs to have standard naming.
Some files are listed as reserved names so that you do not create it yourself.

Files you need to make

| file | description |
| ---- | ----------- |
| run.sh | The shell script to run the test |
| input | The input file for the test. It can be in any format needed. It can be generated on the fly by run.sh. |
| categories.txt | A list of categories. Other tests with the same categories will be compared. Categories will be in all lowercase. |
| method | A folder containing all files pertaining to the actual method (optional) |

Files that have reserved names that you should not make.

| file | description |
| ---- | ----------- |
| out | All output files and logs go to this directory, if they exist. If this directory does not exist, it will be created for you. |
| time.txt | This file will be created at the time of the test. |
