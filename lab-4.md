---
tags: ggg, ggg2024, ggg298
---

[toc] 

# Markdown, HackMD, and GitHub for note taking - Lab 4, Week 4 - GGG 298 WQ 2024

## Announcements

Next week we're going to work in small groups; in person attendance is strongly suggested (but not required - I'll still be on zoom).

## Learning objectives

Today you will:

* learn about Markdown, a simple text-based "markup" language;
* learn to use HackMD to write, share, and collaboratively edit Markdown documents;
* learn to edit Markdown on GitHub repositories;
* see how to "dump" Markdown into GitHub issues;
* learn about linking between GitHub issues;
* see how you can use Markdown tricks in Slack, too.
* think about how you can use HackMD for lab notebooks, sharing results, and writing tutorials and documentation;

## Introduction to Markdown

## Writing your first Markdown document on HackMD

### Logging into HackMD

Connect to hackmd.io.

Click on "sign in".

Sign in via GitHub and follow through.

Click on "New note."

### A quick tour of the HacMD interface

### Writing some Markdown

* basic markup - *italic*, **bold**
* numbered lists & bullet points
* `verbatim` words and sections
* quotes with >
* checklists with `- [ ]`
* headings
* links to other pages
* links to headings
* tables
* section breaks with `---`
* HackMD specific features:
    * using `[toc]`
    * `::::` blocks
    * emojis!
    * drag/drop images
    * titles, tags, and document metadata
    * more HackMD specific features: see [tutorials](https://hackmd.io/c/tutorials/%2Fs%2Ftutorials)
        * slide mode

### Generic advanced Markdown examples


While each Markdown platform supports different features, many Markdown features are broadly supported.

Verbatim sections enclosed in triple back quotes:
```
are fantastic for logging commands
```
and also support syntax highlighting:
```R
# Check if command line arguments are provided
if (length(commandArgs(trailingOnly = TRUE)) != 2) {
  cat("Usage: Rscript calculate_mean.R input_file output_file\n")
  quit(status = 1)
}
```

### HackMD specific features

Emojis are easy: `:+1:` =>  :+1:

:::warning
you can put in various blocks with `:::`
:::

:::spoiler Spoiler alert!
Put hidden text in here.
:::

## Live practice

* Create a new HackMD document
* Find or write some text (e.g. take an excerpt from Wikipedia)
* add the below checklist to your document and do the tasks!

- [ ] bold and italicize some words
- [ ] 

### Sharing HackMD documents

Sharing in live edit mode:

* if you give someone the direct link, they can see live updates!
    * view vs edit vs split screen modes, and which way to share
* sharing settings
    * unpublished hackmd documents are private until you give someone the URL, or post the URL
    * I'm an advocate for not worrying too much about just making things world editable :)
    * I haven't figured out exactly how hackmd's user/group sharing works :shrug: 
* title your documents appropriately
* use YAML tags

YAML tags let you set categories at the beginning of your document!

```
---
tags: foo, bar, baz
---
```

Sharing in Web site mode:
* Under 'Share', the first option at the top will share your document but NOT in edit mode. You have to click "Publish" to make it public, & for everyone.

Collaborative editing, and why not to use the commenting feature

## Editing Markdown files on GitHub

Go to GitHub and create a repository with a default README.md file.

Then click on Edit. Look ma, Markdown!

Type or paste in some Markdown (yes, straight from hackmd will work).

## Appendix: saving HackMD to GitHub