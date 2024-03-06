---
tags: ggg2024, ggg298, ggg
---

# Quarto & Literate Programming; Slurm and HPC - Week 9, GGG 298 WQ 2024.

[![hackmd-github-sync-badge](https://hackmd.io/dfxIdhpTSd6Gfb3pj1p8dQ/badge)](https://hackmd.io/dfxIdhpTSd6Gfb3pj1p8dQ)


Announcements -

* Week 10 (next week!) will be an open practice class, with both more and less-guided options. Please come in person if you can!

## Quarto

Today, I'm going to start by showing you all [the Quarto publishing system](https://quarto.org/) for literate programming in data science.

(YES, you can write your thesis in Quarto. Hint. Hint.)

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
as [those instructions suggest](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Run-RStudio-Server-on-your-reserved-node), <span style="color:green">**run this instead**</span>:
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

These indicate that you're using R from the `run_quarto` conda environment!

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
<span style="color:red">**Remember to replace `YOUR_USERNAME` with your actual GitHub username**</span>

### Create new Markdown file

In RStudio, create a new Markdown file, and then save it as `an-r-example.qmd` in your repository directory.

Then paste the following into that file and save it (based on [asking ChatGPT for some code](https://chat.openai.com/share/e24927f7-0eaf-4016-95ce-364160404207)):

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

### Digression - why do this?

Quarto is one example of "literate programming", which is a very nice combination of showing results along with the computational approaches.

the key points here are:
* the results you see are always exactly produced by the commands that are also in the document;
* this is a completely transparent report, in that there is nothing hidden about the parameters or statistical approaches used.

See this grant proposal for more exploration of this idea! [Project Jupyter: Computational Narratives as the Engine of Collaborative Data Science](https://blog.jupyter.org/project-jupyter-computational-narratives-as-the-engine-of-collaborative-data-science-2b5fb94c3c58)

### So... R is great... but can we use Python too??

Yes, yes we can!

Create a new file, `a-python-example.qmd`, based on [asking ChatGPT for an example](https://chat.openai.com/share/3c8d5a89-edd3-41cd-8876-94ecd1a507e6) -
~~~
# a python example

```{python}
import numpy as np
import matplotlib.pyplot as plt

# Generating sample data
np.random.seed(0)
x = np.linspace(0, 10, 100)
y = 2 * x**3 - 5 * x**2 + 3 * x + np.random.normal(0, 50, 100)

# Fit a polynomial of degree 3 to the data
fit_coefficients = np.polyfit(x, y, 3)
fit_polynomial = np.poly1d(fit_coefficients)

# Generate y values for the fitted polynomial
y_fit = fit_polynomial(x)

# Plotting
plt.figure(figsize=(8, 6))
plt.scatter(x, y, label='Original data')
plt.plot(x, y_fit, color='red', label='Polynomial fit (degree 3)')
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Polynomial Fit')
plt.legend()
plt.grid(True)
plt.show()
```
~~~

and then run:
```
quarto render a-python-example.qmd 
```

Oh no! It fails! What's going on!?

What does the error message say? A few problems -
* it's running Python out of a different place!
* it's not finding the right packages, either.

What do we do? We have two options:

1. Install a bunch of Python packages in _this_ conda environment. That would Just Work.
2. Use a _different_ conda environment, [install your own Python kernel](https://hackmd.io/fe3y_SISS7C95WnJkcnCcw?view), and use that Python kernel here.

The latter one involves more work, so I'll just say that you need to configure things at the top of your qmd file.

:::spoiler Digression: configuring Python kernel

You would put something like this in the yaml header of the qmd file:
```
jupyter:
  kernelspec:
    name: "py310"
    language: "python"
    display_name: "py310"
```

and that would use the `py310` kernel (in its own conda environment).

:::

Instead of doing that, let's just install Python + necessary commands in this environment:
```
mamba install -y jupyter notebook matplotlib numpy r-reticulate
```

### Closing thoughts around Quarto

Quarto is one example of literate programming for data science - you can also use things like [Jupyter Notebooks](https://jupyter.org/), or [Observable Notebooks](https://observablehq.com/).

Quarto is what I would personally recommend since it's open source, supports multiple languages, and has many output options.

Jupyter and other notebook platforms are really great for working interactively with data but have some drawbacks for both teaching and scientific reproducibility, in my experience.

## Slurm and HPC

[Tutorial: Executing large analyses on HPC clusters with slurm!](https://hackmd.io/p_d88X7HTFSXLmjB0fvuug?view)