---
tags: ggg, ggg2024, ggg298
---

# Syllabus for Tools for Data Intensive Research, GGG 298, WQ 2023-2024

[![hackmd-github-sync-badge](https://hackmd.io/TFAT4xgcTl641rhsCCnsfA/badge)](https://hackmd.io/TFAT4xgcTl641rhsCCnsfA)


[toc]


Winter Quarter, 2023-2024
GGG 298 section 88
2 credits (lab + discussion)

Instructor: Titus Brown, ctbrown@ucdavis.edu

WHERE/WHEN: 
* Lab: Wed **12:30-3pm**, Shields 360 (DataLab)
* Discussion: Thursday 1:10-2pm, Viehmeyer 116.

The lab section of this class will be hybrid friendly; the zoom links are on the course Canvas.

(Note that class starts at 12:30pm on Wednesday, not at 12:10; the registrar does not appear to allow nontraditional start times ;).

See bottom of this document for CRN and PTA information.

## Class description

Tools for Data Intensive Research teaches a set of tools for working on remote computing systems with large amounts of data and long-running processes - UNIX shell, snakemake, git/github, conda, R and RMarkdown, etc. The  focus is on bioinformatics use cases, but I do not spend too much time talking about biology and rather focus on how to work with the tools. 

The course is two credits, and consists of one 2.5 hour computational lab and a single 1 hour discussion section per week; weekly homework involves reading that week's paper, answering a question, and (for one of the weeks) doing a small-group mini-presentation on the paper & your answers to the question.

Past attendees have told me that both parts of the course are interesting and that the papers and discussion section is particularly so ;).

The course will be S/U because it is a temporary course. However, in the past most students have been able to get an exception in order to satisfy an elective requirement. Please let Titus know if you need additional information to do so.

## Course description

Here's the course description from the syllabus:

This course will provide a practical introduction to common tools used in data-intensive research, including the UNIX shell, version control with git, RMarkdown, JupyterLab, and workflows with snakemake. The associated discussion section will connect the lab practicals to foundational concepts in data science, including repeatability/reproducibility, statistics, and publication ethics.

This course is open to all graduate students. No prior computational experience is required or assumed. There will be some minimal overlap with GGG 201(b) topics. All materials will be open to the community and freely available online.

## Code of Conduct

Please abide by [my lab's Code of Conduct](http://ivory.idyll.org/lab/coc.html) in this course.

In particular, this is not an intellectual contest, and please realize that we _all_ have plenty of things to learn.

## Homework

There will be 10 paragraph-length homeworks due on the weekly reading, one each week; they'll be assigned a week in advance and due on Thursday at midnight.

Each week several (2-3) students will be asked to take a lead in preparing for the paper discussion on Fridays. Each student will only be asked to do this once.

## Grading

The course is S/U, and only graded on homework; you need to hand in 7 of the 10 homeworks to pass.

## Office hours

Office hours will be by arrangement. Mondays and Tuesday afternoons I will be in DataLab; Wed and Thursday mornings I will be in VetMed.

Please contact Titus via e-mail at ctbrown@ucdavis.edu at least a day in advance if you want to come to office hours.

## Attendance and recordings

Lab sessions (on Wednesday) will be broadcast on zoom, as well as recorded. The recordings will be saved for a month, in Canvas. Please ask if you can't find one!

Discussion sessions (on Thursday) will not be broadcast or recorded.

Attendance is expected for both Wednesday and Thursday. Please let Dr. Brown know if you can't attend, at ctbrown@ucdavis.edu.

Wed class will be hybrid friendly and you can attend remotely. Recordings will be available, as well. Zoom links are on the lab Canvas.

## Lab topics

Wednesdays, 12:30-3pm.

These will be lab practicals where we take a solid look at a given piece of technology and work through using it together.

All materials will be available indefinitely at both their original hackmd links, and also at https://github.com/ngs-docs/2024-GGG298.

### Lab topics

1. 1/10 - Intro and logging in to farm; RStudio; FastQC
1. 1/17 - farm, remote computers, shell, FastQC
1. 1/24 - conda for software installation
1. 1/31 - Project Day 1: sourmash 1 (**in person better**)
1. 2/7 - snakemake
1. 2/14 - git
1. 2/21 - project organization
1. 2/28 - quarto for visualization and data analysis
1. 3/6 - Project Day 2: sourmash 2 (**in person better**)
1. 3/13 - slurm for computing

## Paper discussions

Thursday, 1:10-2pm.

These will be discussion periods where we explore the concepts and questions introduced by various papers, articles, and blog posts. The topics will be relevant to data science and the practice of science.

## Questions and Answers

### Q: The course is currently S/U, but I need it to be graded so it can satisfy an elective in my graduate program. Help!

Unfortunately GGG 298 is a "temporary" course and cannot be turned into a graded course.

If you need it to satisfy an elective (eg for IGG), you can request an exception; these have been granted in previous years and I am happy to provide supporting material and arguments as needed.

### Q: Can I audit the course?

Yes! You may attend just the lab, or the lab and the discussion section, or just the discussion section. Just e-mail me to be added to the canvas group.

If you audit, I expect you to attend all sessions, however - e.g. all labs, or all discussions. Thanks!

### Q: Is this course in-person or hybrid?

I'd like to request that most people attend the course in person.

We will be hybrid friendly for the lab section. If you need to attend remotely for one or more sessions due to illness or travel, that is fine!

If you need to attend completely remotely, I am more than happy to accomodate this! Please contact me to arrange it if you haven't already.

### Q: Should I take this, or GGG 201(b), or both?

GGG 201(b) is Introduction to Bioinformatics. It is a required course for IGG students.

I teach both GGG 298 (this course) and the lab section for GGG 201(b). Students sometimes want to know which they should take; read on for my answer!

The 201(b) lectures focus on genome and transcriptome sequencing and genomic interpretation, with an emphasis on large genomes; they do not cover microbial genomes or microbiome topics. In 2023-2024, the lectures are given by Prof. Megan Dennis, Dr. Tamer Mansour, and Dr. Daniela Soto.

The labs are taught by me, and focus on  workflows for (1) bacterial genome variant calling, (2) de novo genome assembly, and (3) RNAseq differential expression analysis. The data sets are all microbial because the data sets are small enough to work with the interactively, but the principles generalize to human and plant domains.

You are welcome to audit 201(b) lab only, although I request that you attend all classes and submit all homeworks.

Taking them together is not a bad idea, although you will get a very concentrated dose of me if you do so ;).

There is a lot of shallow overlap between the two classes, but the in depth topics are quite different. GGG 201(b) is much more biologically focused, while GGG 298 is much more about the tooling.

If you can only take one, I suggest taking/auditing GGG 201(b) _before_ taking GGG 298. GGG 201(b) motivates GGG 298, while GGG 298 is a much lighter-weight class with minimal homework, and it might fit better into a second- or third-year research schedule because of that.

### Q: How do I add this course?

The CRN is 27142.

You may need a "permission to add" (PTA) number. If so, please e-mail your student ID number to Najwa Marrush, nmmarrush@ucdavis.edu, asking for a PTA number to enroll in GGG 298 section 88.

### Q: Where the heck is Shields 360?

Shields 360 is the DataLab classroom.

It is not easy to find the first time! So plan to take a few extra minutes to get there!

You can find it by going into the Shields Library, then climbing up the two flights of stairs and going to the right (or taking an elevator up to the 3rd floor). It is all the way in the back of the library on the 3rd floor, in the southeast corner. You should see a big "DataLab" sign on the wall in front of you as you walk back from the stairs in front.
