---
tags: ggg, ggg2024, ggg298
---

[toc]

# Automation, parallelization, and snakemake - Lab 7 - GGG 298 WQ 2024

### Connect into farm

Use [the instructions](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Request-compute-resources-with-srun) here. It will be helpful to have an editor available, so RStudio Server is recommended.

For the srun command, use:
```
srun -p high2 --time=3:00:00 --nodes=1 --cpus-per-task 4 \
    --mem 5GB --pty /bin/bash
```
which asks for 4 CPUs. We'll use these later!

## Revisiting a shell script

Set things up:
```
cd ~/ggg298-lab-6
cp ~ctbrown/data/sulfo/* .
```

Load software:
```
module load mamba
mamba activate automation
```
(you may need to [create the mamba environment first](https://hackmd.io/Sksqf7jXTHqbq0BC4oEJzQ?view#Installing-stuff))

and put the following in a file in that directory named `run-sourmash.sh`:
```
set -e
set -x

for genome in *.fa.gz
do
   name=$(basename $genome .fa.gz)
   sourmash sketch dna $genome --name $name -o $name.sig.zip
done

sourmash compare *.sig.zip -o sulfo.cmp

sourmash plot sulfo.cmp
```

Let's go through this line by line.

The `set -x` says, print out each line as it's executed.

The `set -e` says, if any command fails, exit from the shell script.

The for loop says, run the command between `do` and `done` on every .fa.gz file in the directory.

The `name=` line removes the .fa.gz from the genome filename.
The `sourmash sketch` line runs sourmash to sketch the genome into a file it can use for later comparisons.

The `sourmash compare` command runs on all of the .sig.zip files and produces a comparison matrix.

The `sourmash plot` command generates a plot from the comparison.

## Listing input/output dependencies

What input files need to exist for each command? Let's start from the end.

What output file do we want at the very end?

What file(s) does `sourmash plot` need exist, in order to run?

What file(s) does `sourmash compare` need to exist, in order to run?

What file(s) does `sourmash sketch` need to exist, in order to run?

## Drawing a dependency _diagram_

(whiteboarding)

## Writing this into a snakemake file

## Thuoghts on snakemake

input and output here are _annotations_ that snakemake uses. They provide information _about_ what the shell command is doing. They do not tell the shell command what to do!

