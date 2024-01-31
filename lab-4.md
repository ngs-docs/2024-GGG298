---
tags: ggg, ggg2024, ggg298
---

[![hackmd-github-sync-badge](https://hackmd.io/-xtUiHdkRFmvUUCFeBOZ5A/badge)](https://hackmd.io/-xtUiHdkRFmvUUCFeBOZ5A)


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
* think about how you can use HackMD yourself.

## Introduction to Markdown

## Writing your first Markdown document on HackMD

### Logging into HackMD

Connect to hackmd.io.

Click on "sign in".

Sign in via GitHub and follow through.

Click on "New note."

### A quick tour of the HackMD interface

Top bar!

Edit mode, split screen mode, view mode.

### Writing some Markdown

* basic markup - *italic*, **bold**
* numbered lists & bullet points
* `verbatim` words and sections (triple backquotes)
* quotes with > at the beginning of the line
* checklists with `- [ ]`
* headings with #, ##, and so on
* links to other pages with ``[link text](link URL)``
* links to headings - I'll show you how
* tables - use the hackmd tool bar here!
* section breaks with `---`
* HackMD specific features:
    * using `[toc]`
    * `:::` blocks
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

1. Create a new HackMD document
2. Find or write some text (e.g. take an excerpt from Wikipedia)
3. add the below checklist to your document and then add examples of each item - check each off after you're done!

- [ ] bold and italicize some words
- [ ] add a numbered list & a bullet point list
- [ ] use both `verbatim` words and sections
- [ ] add a quote with > at the beginning of the sentennce
- [ ] add two different headings headings
- [ ] add a link to another page
- [ ] add a link to an internal heading
- [ ] add a small tables
- [ ] add a section break with `---`
- [ ] add a table of contents with `[toc]`
- [ ] add a `:::` block
- [ ] use `:` to create an emoji!
- [ ] drag/drop an image or chart in from your computer
- [ ] add a tag at the beginning of the document
- [ ] add a title and update the document metadata

### Sharing HackMD documents

EDITME

Sharing in live edit mode:

* if you give someone the direct link, they can see live updates!
    * view vs edit vs split screen modes, and which way to share
* sharing settings
    * unpublished hackmd documents are private until you give someone the URL, or post the URL
    * I'm an advocate for not worrying too much about just making things world editable :)
    * I haven't figured out exactly how hackmd's user/group sharing works :shrug: 
* **YES YOU CAN COLLABORATIVELY EDIT** - [TRY HERE](https://hackmd.io/S8oW5SNET463A6gMTJKesA)
    * (example on a new hackmd document)
* title your documents appropriately
* use YAML tags

YAML tags let you set categories at the beginning of your document!

```
---
tags: foo, bar, baz
---
```

Sharing in Web site mode:
* Under 'Share', the first option at the top will share your document but NOT in edit mode. You have to click "Publish" to make it public, & it will then be public for everyone.
* The document will no longer be live updated when you edit it.

Compare:

* [the live view of this page in edit mode](https://hackmd.io/-xtUiHdkRFmvUUCFeBOZ5A?view)
* [the published page](https://hackmd.io/@ctb/S13zhRD9T)

Note: I don't like the commenting feature that hackmd provides, and I don't recommend using it.

## Discussion time: how do you see yourself using this (if at all)?

[Do you have thoughts about where hackmd fits in your research toolkit?](https://docs.google.com/forms/d/e/1FAIpQLSfTVppbt__OynnwQxHNOtsaaEsjTLG2h-5sUYLt-3Kj4kNk3g/viewform)

Alternative tools and approaches:
* RMarkdown (but not good collab)
* Google Docs
* Notion
* Obsidian (HackMD-like collections of Markdown, but self-hosted)
* Benchling (find me)
* ...?

## Editing Markdown files on GitHub

Go to GitHub and create a repository with a default README.md file. (You can use [this link, github.com/new](https://github.com/new), to get started.)

Titus's repo is: https://github.com/ctb/2024-ggg298-example-repo-fascinating-stuff-in-here

Then click on Edit. Look ma, Markdown!

Type or paste in some Markdown (yes, straight from hackmd will work).

Note: preview mode.

Saving uses a staged "version control" model - edit, commit, edit again. More on this in 2-3 weeks ;).

## Using GitHub Issues

You can also use the issue tracker to write Markdown!

Example of new issue;
pasting in Markdown.

Nopte: you can interlink between issues, even between different repositories!

## Using Markdown in Slack

Slack _also_ supports Markdown formatting!

You can experiment with it by chatting with yourself :)

I find this most useful for simple stuff (italics/bold) as well as triple backquotes for pasting commands.

## Linking HackMD to GitHub

You can link hackmd notes directly to a GitHub repository. You only get a limited number of "push"es tho, unless you pay $$.

This is how I store all my teaching notes. See https://github.com/ngs-docs/2024-GGG298 for example!

Note badges!

Advantages:
* can share the hackmd link (with live updating/editing/corrections) but also have it stored in a more structured way
* version control is good!

Disadvantages:
* $$
* requires manual syncing, which I sometimes forget to do

(Titus demo of doing this on a new HackMD document.)

## Titus's four main uses for hackmd

1. Quick notes/results to share with others.

This is particularly useful for computational commands, especially if they may end up in a GitHub issue or Markdown document.

I will often copy/paste from command line into HackMD and vice versa. Editing command lines in HackMD is actually kinda nice :laughing: 

2. Collaborative note taking.

I split evenly between HackMD and Google Docs for note taking.

Google Docs suggest/comment mode is nicer! But Markdown is nicer than Word!

3. First few drafts of tutorials and documentation.

I really like the ability to quickly rough things out in a Web page-based editor.

I will often provide a link to the hackmd version of something when working on stuff on GitHub, because it's just a much nicer editor and it lets other people view, comment, and edit. [Example](https://github.com/sourmash-bio/sourmash/issues/2812)

4. Teaching.

Live views/edits are golden!
