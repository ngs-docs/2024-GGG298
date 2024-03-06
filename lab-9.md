---
tags: ggg2024, ggg298, ggg
---

# Quarto & Literate Programming; Slurm and HPC - Week 9, GGG 298 WQ 2024.

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

Per [instructions](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Log-into-farm-via-ssh), but **instead of doing**:

```
module load R
module load rstudio-server
rstudio-launch
```
as [those instructions suggest](https://hackmd.io/KuZZCPzJQZCjytSnVSnJew?view#Run-RStudio-Server-on-your-reserved-node),

run:
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

### Render

Click "Render" in RStudio. What do you see?

### Publish to github pages

@@ what is github pages

what is github pages
only on public repos, I think

## Python?

## Slurm and HPC

[Tutorial: Executing large analyses on HPC clusters with slurm!](https://hackmd.io/p_d88X7HTFSXLmjB0fvuug?view)