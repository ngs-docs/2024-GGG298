---
tags: ggg2024, ggg298, ggg
---

# Quarto & Literate Programming; Slurm and HPC - Week 9, GGG 298 WQ 2024.

[![hackmd-github-sync-badge](https://hackmd.io/dfxIdhpTSd6Gfb3pj1p8dQ/badge)](https://hackmd.io/dfxIdhpTSd6Gfb3pj1p8dQ)


Announcements -

* Week 10 (next week!) will be an open practice class, with both more and less-guided options. Please come in person if you can!

## Quarto

### FIRST, install R & Quarto in a conda environment

ssh into your farm account (no RStudio needed), and then create a mamba environment, `run_quarto`:

```
module load mamba
mamba create -n run_quarto -y quarto r-base r-rmarkdown openssh
```

### Start up RStudio, but differently.

Per [instructions](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Log-into-farm-via-ssh), but <span style="color:red">**instead of doing**</span>:

```
XX module load R
XX module load rstudio-server
XX rstudio-launch
```
as [those instructions suggest](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Run-RStudio-Server-on-your-reserved-node),

<span style="color:green">**run this instead**</span>:
```
module load mamba
mamba activate run_quarto
module load rstudio-server
rstudio-launch
```

This launches rstudio-server in your newly created `run_quarto` conda environment.

Once in RStudio, check a few things:

In the Console, you should be running:
`R version 4.3.3 (2024-02-29) -- "Angel Food Cake"`

If you run `.libPaths()` in the Console, you should see something like: `"/home/datalab-05/.conda/envs/run_quarto/lib/R/library"`.

These indicate that you're using R from the `run_quarto` environment!

### Create a new GitHub project

Next, go to https://github.com/new and create a new GitHub project named `2024-ggg-298-quarto`. Please check the "add a README file" box before creating.

The project will need to be public this time, I'm afraid.

### Clone the GitHub project

Back in Terminal... run:

```
module load mamba
mamba activate run_quarto
```

and then:
```
cd ~/
git clone git@github.com:YOUR_USERNAME/2024-ggg-298-quarto/
```

### Create new Markdown file

In RStudio, create a new Markdown file, and then save it as `an-r-example.qmd` in your repository directory.

Then paste the following into that file and save it:

~~~
---
title: "An R example"
---
# an example of running / plotting R

```{R}    
# Sample data
x <- seq(1, 10, by = 0.5)
y <- 2 * x^2 - 3 * x + 1  # Example polynomial function

# Add some random noise to the data
set.seed(123)
y_noise <- y + rnorm(length(y), mean = 0, sd = 5)

# Fit a polynomial model
degree <- 2  # degree of the polynomial
model <- lm(y_noise ~ poly(x, degree, raw = TRUE))

# Generate points for smoother curve
x_smooth <- seq(min(x), max(x), length.out = 100)

# Predicted values using the model
y_smooth <- predict(model, newdata = list(x = x_smooth))

# Plot original data and the fitted curve
plot(x, y_noise, pch = 16, col = "blue", xlab = "X", ylab = "Y", main = "Polynomial Fit")
lines(x_smooth, y_smooth, col = "red", lwd = 2)
legend("topright", legend = "Fitted Curve", col = "red", lty = 1, lwd = 2)
```

~~~

### Render via RStudio

Click "Render" in RStudio (in the editor). What do you see? How does it differ from what's in the .qmd file?

### Render via command line

You can also render this via the command line -
```
cd ~/2024-ggg-298-quarto
quarto render
```
what does this produce?

### Publish to github pages

Wouldn't it be nice to make this available to others?? :)

There are many places to host static Web sites, but [GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages) is a particularly nice one and it's free.

To publish this to github pages, run:

```
quarto publish gh-pages
```

and it will tell you where it's posting it!

Note, I think that GitHub pages only works on public repositories, but there are [many other places where you can host the published Web sites privately](https://quarto.org/docs/publishing/).

### Digression - why do this??

Quarto is one example of "literate programming", which is a very nice combination of showing results along with the computational approaches.

the key points here are:
* the results you see are always exactly produced by the commands that are also in the document;
* this is a completely transparent report, in that there is nothing hidden about the parameters or statistical approaches used.

See this grant proposal for more exploration of this idea! [Project Jupyter: Computational Narratives as the Engine of Collaborative Data Science](https://blog.jupyter.org/project-jupyter-computational-narratives-as-the-engine-of-collaborative-data-science-2b5fb94c3c58)

### So... can we use Python?

### Closing thoughts around Quarto

Quarto is one example of literate programming for data science - you can also use things like [Jupyter Notebooks](https://jupyter.org/), or [Observable Notebooks](https://observablehq.com/).

Quarto is what I would personally recommend since it's open source, supports multiple languages, and has many output options.

Jupyter and other notebook platforms are really great for working interactively with data but have some drawbacks for both teaching and scientific reproducibility, in my experience.

## Slurm and HPC

[Tutorial: Executing large analyses on HPC clusters with slurm!](https://hackmd.io/p_d88X7HTFSXLmjB0fvuug?view)