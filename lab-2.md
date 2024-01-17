---
tags: ggg, ggg2024, ggg298, chatgpt
---

[![hackmd-github-sync-badge](https://hackmd.io/exTL3WXTRPC8-S3eLyOk6g/badge)](https://hackmd.io/exTL3WXTRPC8-S3eLyOk6g)


[toc]

# Lab 2, Day 2 - GGG 298 WQ 2024

Today we're going to talk through running programs via the UNIX shell, and discuss directories and organization, current working directories, and relative and absolute paths. The goal is to make sure you're comfortable with (or at least exposed to) ways to organize files for UNIX-y approaches to computing.

There are two reasons to do this:

first, organizing files (scripts, inputs, and outputs) is really central to scientific computing, especially when you're working with dozens, hundreds, or thousands of files!

second, it's foundational to everything else we're going to talk about in this course. In particular,
* running commands properly requires knowing where files are & how to refer to them
* git/github is all about managing file history
* automating and scripting commands (with shell scripts and/or snakemake) is all about managing file creation and deletion
* visualizing data requires lots of file manipulation

So I figured we'd start here ;).

## Side note: some UNIX resources

In addition to the resources at the end of [Lab 1](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#More-resources):

If you want to gain more hands-on familiarity with some of the commands and concepts from today, please see [Two UNIX tutorials](https://hackmd.io/5EfBWjCmTbWLgdC4rg8GZw?view). They're worth looking through and familiarizing yourself with the contents!

## First: Connect to a UNIX prompt!

You can either start up RStudio Server as per [lab 1](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Log-into-farm-via-ssh) - end with a Terminal prompt in the Console window - or you can just log in via ssh. You won't need to edit files today, although the visualization of directory structure may help. And we may run a little bit of R, too, but it won't be critical.

## Running programs!

Mostly what we do at the shell prompt, one way or another, is *run programs*. What do I mean by that? It's both simple, and complicated...

Last week we installed and ran FastQC like this (don't run it again unless you really want to):
```
module load mamba
mamba activate fqc

mkdir lab-1
cd lab-1

fastqc ~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz -o .
```

and saw that this created two files:
>ERR458493_fastqc.html
>ERR458493_fastqc.zip

What is actually going on here?

Let's focus on the `fastqc` command. The `fastqc` command is running a program that someone else wrote, and that we installed with mamba. We actually don't know much about this program, although if you read up on it you can find out that it's written in Java (which is yet another programming language like Python or R).

The important thing is this: FastQC is just a collection of files, and when you run `fastqc`, you are pointing the computer at the collection of files and telling it to execute them in a particular way, and then FastQC is taking over and doing what it thinks you want it to do.

(We can dig more into the details of how this is done in a few weeks, when we talk about sourmash.)

So then there are two immediate questions:
1. where is fastqc & the FastQC collection of files located?
2. when you run `fastqc`, how does it know what data sets to analyze and where to locate them?

The first question we touched on last week, and will go into more detail on next week, but a short answer is that the *entry point* for `fastqc` can be discovered by typing `type fastqc` or `which fastqc`.

The second question is what we'll focus on today!

### Breaking down the `fastqc` command

The command we ran was:
```
fastqc ~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz -o .
```

How did I know what to put here?? What does all this mean??

The UNIX world is ruled by conventions, which basically just means that back in the '60s a particular style of doing things was adopted and now lots of us programmers just follow that style.

In this case, you can guess two things based on those conventions
* The first argument on the command line, `~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz`, is an _input_ file.
* The second thing on the command line, `-o`, is an _option_.
* The third thing on the command line, `.`, is a parameter to that option.
* Probably (again, by convention), `-o .` means "put the output here". `.` as output means "the current working directory" (or cwd).

Note that these are guesses. But they're pretty good ones (well, and they're accurate, based on running the program).

I wrote this command based on two things:
* a convention is that data analysis and/or file manipulation programs at the command line will typically take at least one input file as an argument.
* I used `fastqc -h` to figure out what the other options were - and, in particular, I looked for output file options.

Try running:
```
module load mamba
mamba load fqc
fastqc -h
```

Questions to cover:
* can fastqc analyze multiple data files?
* what other parameters does `fastqc` have?
* why does `-o` take a directory parameter, and not a filename?
* what happens if you run `fastqc` without a `-o` option?

### Running fastqc again

Above, we ran fastqc on a file located somewhere else: `~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz`, which means:
* the filename `ERR458493.fastq.gz`
* located in the directory `ggg-rnaseq`
* located in the directory `data`
* located in the home directory of the account `ctbrown` (which is my normal user account)

We'll talk a bit more about directories in ...a bit, but first:

Let's run fastqc again, but this time we'll copy the input file into your own directory:
```
cd ~/
mkdir lab-2
cd lab-2
cp ~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz .
fastqc ERR458493.fastq.gz
```

Note that we are not telling fastqc where to put things with `-o`, so it's just putting them in the directory where the file is located - which happens to be the current working directory, `~/lab-2/`, based on the `cd` commands and also the prompt.

You should see the same two output files when you run:
```
ls
```
and if you're in RStudio, you'll see them in the `lab-2` folder, too.

### A summary thus far

We're running the program `fastqc`, installed by mamba in the conda environment `fqc`.

The program is running in the current working directory, as always. (That's what "current" means :).

This directory is the folder `lab-2` in the home directory of our farm account.

We created it by going to our home directory (with `cd ~/`), then running `mkdir lab-2`.

We then changed to it with `cd lab-2`.

We then made a copy of the data from my other account using `cp`, asking `cp` to copy the data from an _absolute path_ (`~ctbrown/data/...`) to a relative path (`.`) that indicated the current working directory.

Finally, we ran `fastqc` on this file without giving it an output location. FastQC ran and output the files into the same directory the data was in, because that is what FastQC does when you don't tell it where to put files. This is not actually the typical convention for UNIX, which is to put stuff in the current working directory.

### Running `fastqc` from our home directory

Try:
```
cd ~/
fastqc lab-2/ERR458493.fastq.gz
```

Where do the files end up?

Answer: in the `lab-2/` directory. Because that's where fastqc found the data files.

### Relative vs absolute paths

Here, `lab-2/` is a relative path, because it does not start with a `/` or a `~`.

You could make it an absolute path by using `~/lab-2/` instead. This means "the directory `lab-2` under my home directory.

Absolute paths are like GPS coordinates: they specify the same place independent of where you are.

Relative paths are like instructions to find a location: they are _relative_ to your current working directory/your current location.

Let's explore all of this with a different program - on where we can _see_ what's going on, because "we" "wrote" it.

## ChatGPT pls write me a script

Transcript: [link](https://chat.openai.com/share/bc54b2c3-fe19-46b6-b81e-b80fc6eaa2c4)

Prompt:

>Please write me a script in base R that loads in a text file of floating point numbers from a path specified on the command line, calculates the mean of the numbers, and outputs them to a path specified on the command line.

Code:

```R
# Check if command line arguments are provided
if (length(commandArgs(trailingOnly = TRUE)) != 2) {
  cat("Usage: Rscript calculate_mean.R input_file output_file\n")
  quit(status = 1)
}

# Get input and output file paths from command line arguments
input_file <- commandArgs(trailingOnly = TRUE)[1]
output_file <- commandArgs(trailingOnly = TRUE)[2]

# Load data from the input file
data <- scan(input_file, what = numeric(), na.strings = "", quiet = TRUE)

# Check if data is non-empty
if (length(data) == 0) {
  cat("Error: No valid numeric data found in the input file.\n")
  quit(status = 1)
}

# Calculate the mean of the numbers
mean_value <- mean(data)

# Output the mean to the specified output file
writeLines(paste("Mean:", mean_value), output_file)

cat("Mean calculation completed. Result written to", output_file, "\n")
```

Prompt:

>Could you also give me the same script to run as code in RStudio, as a function and without command line arguments?

```R
calculate_mean <- function(input_file, output_file) {
  # Load data from the input file
  data <- scan(input_file, what = numeric(), na.strings = "", quiet = TRUE)

  # Check if data is non-empty
  if (length(data) == 0) {
    cat("Error: No valid numeric data found in the input file.\n")
    return(invisible())
  }

  # Calculate the mean of the numbers
  mean_value <- mean(data)

  # Output the mean to the specified output file
  writeLines(paste("Mean:", mean_value), output_file)

  cat("Mean calculation completed. Result written to", output_file, "\n")
}

# Example usage:
# Replace 'input_file.txt' and 'output_file.txt' with your actual file paths
calculate_mean("input_file.txt", "output_file.txt")
```

Questions:
* why did I specify base R? What does that mean?
* what is the difference between running a script with `Rscript` and running a script in `R`?
    * the former is at the command-line, the latter is interactive
    * it is ~easier to debug and modify interactive scripts
    * it is easier to automate and run command-line scripts at large scale

## Let's download and run this script!

I've placed the script and an input file here: https://github.com/ngs-docs/2024-GGG298/tree/main/lab-2 - we'll show you how to do this when we talk about git and github :).

At the terminal, retrieve the files by running:
```
cd ~/lab-2
curl -L -O https://raw.githubusercontent.com/ngs-docs/2024-GGG298/main/lab-2/calculate_mean.R
curl -L -O https://raw.githubusercontent.com/ngs-docs/2024-GGG298/main/lab-2/inp.txt
```

(Check out [explainshell](https://explainshell.com/explain?cmd=curl+-L+-O+https%3A%2F%2Fraw.githubusercontent.com%2Fngs-docs%2F2024-GGG298%2Fmain%2Flab-2%2Fcalculate_mean.R) if you want to know what the curl command is doing!)

`ls` should show that these two files are in the current directory, and/or you should be able to see them in the RStudio file browser.

Now run the script:
```
Rscript calculate_mean.R inp.txt out.txt
```
and look at the result:
```
cat out.txt
```

Questions to address:
* how did I know what to run?
* how did I know what arguments to give it?
* Does `-h` work with `calculate_mean.R`? why or why not?

### Digression: what happens if we run the R function instead?

(demo)

Notes:
* unless you open an R project, RStudio's default cwd is in your home directory!

### Back to the command-line script

Points to make:
* this is a program! that we ran ourselves!
* it's kind of like a nested doll tho - we are using the program `Rscript` to run the script `calculate_mean.R`. Which one is the program?!
* (Don't worry about it, embrace the inception.)
* In this case, `calculate_mean.R` does no more and no less than what we asked it to do. So, no `-h`.

### Organizing your input and output files

Let's make the directory `lab-2`  a little bit less messy.

Right now it's got the script, the input, and the output all in the same directory. This is fine when you have 5 files - but what if you have 50!? Ugh.

First, let's make a directory for both inputs and outputs:
```
cd ~/lab-2
mkdir data
mkdir outputs
```

Now let's move the input files there and trash the output files:
```
mv inp.txt data/
rm *.txt
```

And now let's run things again:
```
Rscript calculate_mean.R data/inp.txt outputs/outp.txt
```
and that's a pretty typical approach.

Notes:
* if you want to "refresh" your outputs (make sure they are generated from the latest script and inputs) you can just `rm outputs/*` and rerun all your code. We'll show you ways of automating this!
* The "separation of concerns" here is good:
    * script is in cwd (we can also put it in `scripts/`)
    * input data, "do not modify", is in `inputs/` where w can keep track of it
    * outputs are in `outputs/` where we can track it and delete it and ...
* This will make more sense when we get to git and snakemake, but honestly it's also just ...easier than having everything in one directory!

### Relative vs absolute paths

`data/inp.txt` and `outputs/outp.txt` are just relative paths.

We could actually run this a bunch of different ways.

Running it from home directory:
```
cd ~/
Rscript lab-2/calculate_mean.R lab-2/inputs/inp.txt lab-2/outputs/outp.txt
```

Running it from the outputs directory:
```
cd lab-2/outputs
Rscript ../calculate_mean.R ../inputs.txt outp.txt
```
and so on.

Notes:
* `Rscript` is in the shell path, which means that it's a program that the shell can find automatically when you give it the name. `type Rscript` and `which Rscript` can give you its actual location, but (generally) this is managed by module and/or mamba and is not useful except for debugging. More on this next week!
* input and output files are always relative or absolute paths!
* Relative paths don't start with `/`. Absolute paths do.
* `../` means next up. `./` means current directory and underneath. Directories may or may not end in `/`.

## Some questions to answer (if time)



## A brief exploration of a common Big Data workflow with Jupyter Notebook (if time)

As an antidote to all this RStudio stuff, I want to show you how I work on a regular basis with Python, and how some of what I taught you today (and will teach you in the future ;) fits together. For inspiration! Or at least to get you thinking.

* making a big CSV file
* bringing it to an interactive viz app (Jupyter Notebook, in this case; running on my computer)
* running stuff there & visualizing
    * where is stuff installed? oh right in my conda environment :grin: 

## End matter

This week we covered:
* scripts, files, and directories
* current working directory
* relative paths, absolute paths
* directory organization

Circling back around: you, too, could write something like FastQC. It's not that hard to get started - you just write some analysis scripts that do something interesting! And then you have to package them for other people to use, which is ...a whole 'nother topic :sob:. Talk to me if interested...

---

Next week we'll do more of a deep dive into conda and mamba, my preferred approach to installing software on computers (including, but not limited to, the HPC). We'll cover:

* what installing software entails
* how the software to install is found and where the software is installed
* installing collections of software in environments
* installing scripting languages (Python and R) and libraries and packages for those languages using conda
* the Matroshka Doll approach to Python and R installations - nesting libraries and packages within conda installs :exploding_head: 
* how to organize and manage conda software environments for fun and profit