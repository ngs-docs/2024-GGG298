---
tags: ggg, ggg2024, ggg298
---

[![hackmd-github-sync-badge](https://hackmd.io/CRKtp-TvSHmsWn7RYUACQQ/badge)](https://hackmd.io/CRKtp-TvSHmsWn7RYUACQQ)


[toc]

# snakemake and git/GitHub - Lab 8 - GGG 298 WQ 2024

## Introduction

Today we're going to talk about one sort of "endpoint" for what this class teaches: automation combined with change tracking.

The goal here is to introduce you to the process that software engineers use to track changes to software, and combine it with further development & automation of an analysis pipeline.

If you follow this approach when working on actual data analysis pipelines for research, you will have something that is **highly reproducible** as well as efficient and (relatively) debuggable. These are all good things!

For some background, here is a really good video worth watching: [Science as amateur software development](https://www.youtube.com/watch?v=8qzVV7eEiaI)

## Setup

### Connect into farm

Use [the instructions](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Request-compute-resources-with-srun) here. It will be helpful to have an editor available, so RStudio Server is recommended.

For the srun command, use:
```
srun -p high2 --time=3:00:00 --nodes=1 --cpus-per-task 4 \
    --mem 5GB --pty /bin/bash
```
which asks for 4 CPUs. We'll use these later!

### Load software environment

Load an environment with sourmash and snakemake in it.

Open up a terminal, and do the following:
```
module load mamba
mamba activate automation
```
(Creation instructions for `automation` [here](https://hackmd.io/Sksqf7jXTHqbq0BC4oEJzQ?view#Installing-stuff) in case you need them.)

### Install openssh

This overcomes an annoying bug on farm and probably won't be needed in six weeks, but is today:

```
mamba install -y openssh
```

### Set up your github account ssh key

The below will enable git cloning of private github repositories, and writing to repositories on github.

Print out your account's public ssh key:
```
cat ~/.ssh/id_rsa.pub
```
it should look something like this:
>ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0wAAhC+GfPI6En9bimIQ/w7lBxNa5eGx3pWz62c2HY762nStbRr8uh4sSBwx5yEjtHkdGahvnCbCCAlR7uJe8EXwuqDjQvHJF2Jup6ZR7hvGNwwlM1a5ePiNXAXVl7TpG+kK+ZiVssJF3Jj373BrYzdzdC2qjgBhiQr0BDLjLwHVLFPlZt1hNV/kjTFIFsEfC3TYkptuyXovKtOHImvs9EXS417vzLogIGkvMVH5mp+Tf8WcOV8ldjEo1cVsExPIpp+DPrD8QIUtqbhPT6aMk2/sYuMpMbrhZ8lekPpQmIQTBv1PBcKsB7VvgZxHlrgsFTtBYbx6A/CErsy5hsGxpa8t+wT+CWJNJRIuoQRlkMcbTYJ8OdsQyoEvdlOe3fTN6S datalab-XX

Select and copy the text that `cat` prints out.

Then go to your GitHub account SSH keys page at https://github.com/settings/keys, and select "New SSH key" (top right).

Paste in the public key.

## Round 1: make our Snakefile from week 7 available on github

### Create a GitHub repository

Go to https://github.com/new and create a repository named `2024-ggg-298-lab7`.

Leaving it public is easiest but not necessary.

DO select "Add a README file."

Then click "Create Repository"

### Clone it locally to farm

Select Code and then the ssh tab. Copy that URL.

At the terminal prompt, run:
```
cd ~/
```
and then
```
git clone git@github.com:YOUR_USERNAME/2024-ggg-298-lab7.git
```
but **be sure to replace YOUR_USERNAME with your GitHub username!**

This will create a directory `2024-ggg-298-lab7`. Change to it:
```
cd ~/2024-ggg-298-lab7
```

### Create `Snakefile`

Using an editor (e.g. RStudio), make a text file in the git repository with the following content in a file named `Snakefile`:

```python
rule rule_1:
  input: "a.fa.gz"
  output: "a.sig.zip"
  shell: "sourmash sketch dna a.fa.gz --name 'Sulfurihydrogenibium' -o a.sig.zip"
  
rule rule_2:
  input: "b.fa.gz"
  output: "b.sig.zip"
  shell: "sourmash sketch dna b.fa.gz --name 'Sulfitobacter sp. EE-36' -o b.sig.zip"

  
rule rule_3:
  input: "c.fa.gz"
  output: "c.sig.zip"
  shell: "sourmash sketch dna c.fa.gz --name 'Sulfitobacter sp. NAS-14.1' -o c.sig.zip"
  
rule rule_4:
  input: "a.sig.zip", "b.sig.zip", "c.sig.zip"
  output: "sulfo.cmp", "sulfo.cmp.labels.txt"
  shell: "sourmash compare *.sig.zip -o sulfo.cmp"
  
rule rule_5:
  input: "sulfo.cmp", "sulfo.cmp.labels.txt"
  output: "sulfo.cmp.matrix.png"
  shell: "sourmash plot sulfo.cmp"
```

### Run snakemake

Now try running `snakemake`:

```
cd ~/2024-ggg-298-lab7
snakemake -j 4 -p sulfo.cmp.matrix.png
```
what happens??

Oh, right:
```
cp ~ctbrown/data/sulfo/* .
snakemake -j 4 -p sulfo.cmp.matrix.png
```

### Add, commit, and push

Now let's get this on github:
```
git add Snakefile
git commit -am "initial commit"
git push
```

### Test it locally by making another copy

```
cd ~/
git clone git@github.com:YOUR_USERNAME/2024-ggg-298-lab7 lab7-test/
cd ~/lab7-test/
```
and run snakemake. Does it work??

## Round 2: default rules

Change back to your primary working repo:
```
cd ~/2024-ggg-298-lab7
```

Now let's add a default rule at the top of the Snakefile 
```
rule all:
   input:
      "sulfo.cmp.matrix.png"
```

Now run:
```
snakemake -j 4 -p
```

does it work?

### commit and push

Check changes:
```
git status
```

then commit it and push it to GitHub:
```
git commit -am "make wildcard rule"
git push
```

### test it in your second copy:

Update:
```
cd ~/lab7-test/
git pull
cat Snakefile
```

and run:
```
snakemake -j 4 -p
```

does it work?

To show:
* git log
* git status

## Round 3: use snakemake wildcards to condense rules

Next, let's condense the three sketching rules. Replace `rule_1`, `rule_2`, and `rule_3` with:
```
rule sketch:
   input: "{name}.fa.gz"
   output: "{name}.sig.zip"
   shell: """
       sourmash sketch dna {input} -o {output} --name {wildcards.name}
   """
```

To test it, remember to:
```
cd ~/2024-ggg-298-lab7
rm *.sig.zip *.png *.cmp
```

## Round 4: use snakemake `glob_wildcards` to import file lists

Will do in class ;).

## References

[Snakemake lesson from 2023](https://hackmd.io/kkosFQV5RhiMAzKNFxA2Mw)

[Git/GitHub lesson from 2023](https://hackmd.io/BqSBVmTARGqCRpiTzRrB5A?view)

[Snakemake book draft](https://ngs-docs.github.io/2023-snakemake-book-draft/)
