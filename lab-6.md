---
tags: ggg, ggg2024, ggg298
---

[![hackmd-github-sync-badge](https://hackmd.io/Sksqf7jXTHqbq0BC4oEJzQ/badge)](https://hackmd.io/Sksqf7jXTHqbq0BC4oEJzQ)


[toc]

# Shell scripting, automation, and parallelization - Lab 6, Week 6 - GGG 298 WQ 2024

Foo!

## Revisiting last week - sourmash mini-project

[Lab 5 notes for miniproject](https://hackmd.io/TENCqj_ASpuIvMArTuGrPw?view)

Looking at your results; walk through of my approach.

### Tips and tricks for writing docs and tutorials

Avoid making people think the first time - "just get it working". "Quickstarts"

A skeleton of working commands is more important than detailed docs, because approximately no one reads the details (including you) until AFTER they get the thing running.

Copy/paste to/from the command line is pretty easy, and then you know the commands work! Also, you can use `history`.

Quickstarts and READMEs are really great ways to document things for future you, as well as other people.

(Note implications for automation: the shell is easy to automate things in, in part b/c of ease of copy/paste vs graphical interfaces.)

## Shell scripts

### (Connect into farm)

Use [the instructions](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Request-compute-resources-with-srun) here. It will be helpful to have an editor available, so RStudio Server is recommended.

For the srun command, use:
```
srun -p high2 --time=3:00:00 --nodes=1 --cpus-per-task 4 \
    --mem 5GB --pty /bin/bash
```
which asks for 4 CPUs. We'll use these later!

### (Installing stuff)

Let's create a new conda environment that has fastqc, sourmash, _and_ snakemake in it. (We might not use snakemake today but it's nice to have it available.)

```
module load mamba
mamba create -y -n automation \
    snakemake-minimal fastqc sourmash 
```

then activate:
```
mamba activate automation
```

and let's work in the `ggg298-lab-5` subdirectory:
```
mkdir -p ~/ggg298-lab-5
cd ~/ggg298-lab-5
```

### Digression: Revisiting environments, directories, etc.

We've seen so many different things that all look kind of similar:

* current working directory (`cd`) - this is where your files reside, and lets you work with relative file paths. UNIX-like systems generally.
* module system (`module load`) - this enables pre-installed software, usually on HPCs.
* mamba environment (`mamba activate`) - this dictates what software is available, using the conda/mamba software ecosystem.
* Slurm (`srun`) - this reserves compute resources (usually on HPCs).

We will also soon see `git` repositories. But I think that's the end :)

### Running the sourmash stuff

Set things up:
```
cd ~/ggg298-lab-5
cp ~ctbrown/data/sulfo/* .
```

Then run the sourmash commands:
```
sourmash sketch dna a.fa.gz --name 'Sulfurihydrogenibium' -o a.sig.zip
sourmash sketch dna b.fa.gz --name 'Sulfitobacter sp. EE-36' -o b.sig.zip
sourmash sketch dna c.fa.gz --name 'Sulfitobacter sp. NAS-14.1' -o c.sig.zip

sourmash compare *.sig.zip -o sulfo.cmp

sourmash plot sulfo.cmp
```
and let's take a look at the output.

(Digression: What is sourmash doing? Is anyone curious? :)

### Putting the commands in a file

First, clean up the directory so it's only got the fa.gz files in it:
```
rm *.sig.zip
rm sulfo.cmp*
```

Now, let's create a text file in the `~/ggg298-lab5` subdirectory named `run-sourmash.sh` and paste the commands in there:
```
sourmash sketch dna a.fa.gz --name 'Sulfurihydrogenibium' -o a.sig.zip
sourmash sketch dna b.fa.gz --name 'Sulfitobacter sp. EE-36' -o b.sig.zip
sourmash sketch dna c.fa.gz --name 'Sulfitobacter sp. NAS-14.1' -o c.sig.zip

sourmash compare *.sig.zip -o sulfo.cmp

sourmash plot sulfo.cmp
```

Now, save it, and type at the command line:
```
bash run-sourmash.sh
```

What happens??

Welcome to your first shell script!!!

### Add some debugging commands at the beginning:

At the top of `run-sourmash.sh`, put:
```
set -e
set -x
```
and run it again:
```
bash run-sourmash.sh
```

### For loops

Clean up again:
```
rm *.sig.zip sulfo.cmp*
```

Now make a new file `run-sourmash-2.sh` with the following in it:
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

What's going on?

And how does the output differ now?

### Thoughts on shell scripts

What happens when you rerun the shell script? Does it do unnecessary things - things that are already done?

What advantages are there to shell scripts?

* automated / "batch" running
* documentation, sort of! (better than documentation?)

## Running things in serial vs running in parallel

### Dependency graphs

### Using `parallel`

## A brief introduction to snakemake
