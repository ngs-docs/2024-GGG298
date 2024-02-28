---
tags: ggg, ggg2024, ggg298
---

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