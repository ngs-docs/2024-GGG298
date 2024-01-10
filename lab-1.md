---
tags: ggg, ggg2024, ggg298
---

[![hackmd-github-sync-badge](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew/badge)](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew)


[toc] 

# GGG 298 WQ 2024 - Lab, Day 1 - Running RStudio and FastQC

Lab for Wed, Jan 10th, 2023.

OK, today we're going to get started with something absolutely necessary for most data-intensive work: logging into a remote computer!

We're going to log into the 'farm' high performance compute system here at UC Davis. 'farm' provides compute services to researchers on campus for large-scale processing, and it's one of the systems that you might actually use as a researcher. Other systems include the Genome Center.

Once we log into farm, we next have to reserve a certain amount of compute resources for our own use. This is important because certain kinds of compute resources can't easily be "shared" when you're doing large-scale computing! In particular, we're going to ask for a slice of a computer's processing and memory, for 3 hours.

Then we're going to set up an RStudio Server interface. This is a Web site running on farm that will let you edit files, run programs, and run R code. It is one of several different ways that you can interact with compute resources, and I've chosen to teach this approach because it is a relatively simple and effective way to access farm. But there are other ways!

Last but not least, we're going to run a simple analysis - we're going to do a FastQC analysis of a sequencing data set. This is one of the common ways to look at sequencing data, and it's immediately useful for people. To do that, though, we'll have to install FastQC for our own use.

At the end of the day, you'll have learned:
* how to connect to farm from a Windows or Mac computer
* how to reserve a specific set of compute resources on farm for your own use
* how to set up RStudio Server as an interface for working on farm.
* how to install and run FastQC on a sequencing data set, and look at the results.

We'll be building on these approaches throughout the course, and digging deeper into many of the details; today is just a first cut!

## Log into farm via ssh

* retrieve the username (datalab-XX) and password that you received in e-mail; you'll need them in order to log in
* use ssh (Mac OS X, Windows Subsystem for Linux, or Linux) or MobaXTerm to connect
* where you should be at the end of this section: at a prompt that says `datalab-XX@farm:~$`
* log out and log back in a few times. You can log out by typing `exit`.
* log in simultaneously a few times by using a new window or windows. That's totally ok!

## Request compute resources with `srun`

When you connect to farm, what you're really doing is connecting to what's called the "head node". This is a remote computer that serves as the gateway or access point to the rest of farm.

To actually do anything on farm, we need to ask for a specific set of compute resources. We'll cover that in more detail later in the class, during the Slurm section. For now, we'll do that via the `srun` command.

Copy & paste the following command:
```
srun -p high2 --time=3:00:00 --nodes=1 --cpus-per-task 1 --mem 5GB --pty /bin/bash
```
This asks for three hours of access to one computer and one CPU, reserving 5 GB of memory for your use. The `-p high2` says to ask for it with high priority, while the `--pty /bin/bash` asks for an interactive terminal as opposed to running a specific program.

You should see output that looks like this:
>srun: job 9312054 queued and waiting for resources
srun: job 9312054 has been allocated resources

but with different numbers ;).

And you should end up at a prompt that looks something like this:
>`datalab-02@cpu-3-64:~$ `

but again, with different numbers.

What you've done here is **reserve** a specific chunk of compute time for your sole private use on farm. After 3 hours, your reservation will be cancelled and whatever you're running will be stopped. You can also give up your reservation early by logging out.

## Run RStudio Server on your reserved node

Now run:
```
module load rstudio-server
```
followed by:
```
module load R
```
followed by:
```
rstudio-launch 
```

The first command sets up your account to use the RStudio Server software.

The second command sets up your account to use a specific version of R.

The third command _runs_ RStudio Server at the 


You should see output that looks like this;

>Run the following command in a new terminal on your computer:
> 
>     ssh -L50700:cpu-3-64:50700 datalab-02@farm.hpc.ucdavis.edu
> 
> Then, on your computer, navigate your browser to:
> 
>     URL: http://localhost:50700
>     Username: datalab-02
>     Password: attention-plausible-overripe-sliceable-vacant-imprint
> 
> NOTE: Using R at /share/apps/conda/environments/r-4.2.3/bin/R.


Questions:
* what version of R are we using?
* where is RStudio Server running?

Notice that you can enter any more commands at the terminal that RStudio Server is running in. Why? Because that terminal is 100% devoted to running RStudio Server until we tell it otherwise!

We can stop RStudio Server by hitting CTRL-C. Then we can run it again by running `rstudio-launch`

## Connect to RStudio from your laptop

Find the ssh command above that starts with `ssh -L`. We'll need to run that on your laptop, so, copy it into your copy/paste buffer.

If you're on Mac OS X, Linux, or WSL: open a new terminal prompt and paste in the command. You may need to enter your datalab password again.

If you're on MobaXterm, open a shell window, and paste in the command. You shouldn't need a password this time.

Leaving that all running, open a browser and paste in the URL from your ssh window. It should start with `http://localhost...`. You'll need to enter your account name and the password output by RStudio.

If all goes well... you should see an RStudio window!

Now let's take a brief tour of RStudio!

* console window - where you type commands
* file browser window - where you can look at files in your account
* editor window - where you can create and/or edit text files

## Start a Terminal in RStudio

At the top of the Console window (on the left) you'll see a "Terminal" tab. Select that.

You should see a new window with
>`datalab-02@cpu-3-64:~$ `

in it.

## Install FastQC using conda

At the `$` prompt, type:
```
module load conda
```
to load the conda software management  system. (We'll spend a whole lab on conda!)

Now, ask conda to install software named `fastqc` in a newly-created conda environment named `fqc`:
```
mamba create -n fqc -y fastqc
```

Here `fqc` is the name of the mamba environment you're creating, while fastqc is (one) piece of software you're installing into that environment.

You should see output that ends like this:
> Downloading and Extracting Packages
> 
> Preparing transaction: done
> Verifying transaction: done
> Executing transaction: done
> 
> To activate this environment, use
> 
>      $ mamba activate fqc
> 
> To deactivate an active environment, use
> 
>      $ mamba deactivate

Now, let's **activate** the conda/mamba environment. This lets use the software we just installed - in this case, fastqc.

```
mamba activate fqc
```

Your prompt should now look something like this:
>`(fqc) datalab-02@cpu-3-64:~$ `

This indicates that you are now in the `fqc` software environment and can run FastQC!

## Run FastQC

[See the FastQC docs here.](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)

Now we're actually going to run an analysis.

Let's create a new directory or folder to put the files in:

```
mkdir lab-1
cd lab-1
```

Your prompt should now look something like this:
>`(fqc) datalab-02@cpu-3-64:~/lab-1$  `

This indicates that you are now in the `lab-1` subdirectory of your account.

Take a look at the file browser on your RStudio window. Do you see lab-1 there?

---

Now let's run fastqc on a sequencing data set that I've provided:
```
fastqc ~ctbrown/data/ggg-rnaseq/ERR458493.fastq.gz -o .
```

If you type
```
ls
```
you should see that two files were created:
```
>ERR458493_fastqc.html
>ERR458493_fastqc.zip
```

Questions:
* what software are we running? what do the different parts of the command line mean?
* where does the `ERR458493.fastq.gz` file live?
* where does the `ERR458493_fastqc.html` live?

## Look at the results of FastQC

In your RStudio file browser window, click on the `ERR458493_fastqc.html` file, and select "view in Web browser". This should open up a window showing the results of the FastQC analysis.

Depending on time, I'll dig into this today or (more likely) next week.

The important thing, though, is that you (a) ran an analysis and (b) looked at the results! Hurray!

## Close things out

Let's close things out for the day!

First, close your RStudio window/tab in your Web browser. (As you'll see next week, all the files and things are still there. You're just closing down your Web browser connecton to RStudio.

Second, go to the window running the `ssh -L...` command. Exit, either by typing `exit` or just closing the window. This closes down your ssh tunnel connection.

Third, go to the window running your RStudio Server connection and hit CTRL-C. This will stop RStudio Server from running.

Fourth, exit the `srun` session in that window by typing `exit`. This will end your  reservation and place you back at the `farm` prompt.

And fifth, exit your connection to farm by typing `exit`.

(Note that you can actually just close all your relevant windows/applications and things will be fine. I'm just showing you how to unwind everything by doing it step by step!)

## Summing things up

OK, I showed you a lot of commands! But also we did some stuff!

We'll actually spend quite a few weeks digging into various aspects of this, and also talking a lot about remote computing concepts in general!

Next week we'll do all of this again, and go into a bit more detail about the different parts of what's going on - files, remote computers, srun, conda, and FastQC.

## More resources!

You might be interested in workshops 1 through 5 of [Intro to Remote Computing](https://ngs-docs.github.io/2021-august-remote-computing/). Warning, this was written mostly by Titus ;). There are video recordings available.

You might also be interested in the Grad Pathways Microcredentialing in Research Computing - [(link)](https://gradpathways.ucdavis.edu/research-computing-pathway). Hit me up by e-mail if you're interested!

DataLab runs a bunch of [workshops](https://datalab.ucdavis.edu/workshops/) that you might be interested in, as does the [Genome Center Bioinformatics Core](https://bioinformatics.ucdavis.edu/training). The DataLab workshops are free, the GC ones are not. This course will prepare you well, and/or complement, these workshops!

The book [Bioinformatics Data Skills](https://vincebuffalo.com/book/) is an excellent reference.
