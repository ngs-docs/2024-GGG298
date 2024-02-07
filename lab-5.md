---
tags: ggg, ggg2024, ggg298
---

[toc]

# Lab miniproject on sourmash, first cut - GGG 298 WQ 2024 - Lab 5, Week 5

## Your mission for today

Work in groups (encouraged) or individually to:

1. Run the sourmash commands below to produce one or more comparison plots of 3 genomes.
2. Document and explain how to do this from start to finish in a HackMD tutorial; test the HackMD starting from scratch. (This document can start from _after_ you log into farm.)
3. Individually or collectively explore ways to zhuzh up the tutorial or the output.

Additional options here:
* do the comparison with containment or ANI in addition to Jaccard;
* write some descriptions of what you think the comparisons mean;
* add links to the relevant parts of the documentation;
* use the NCBI Taxonomy browser to find and download more/different genomes that you might add to the comparison, e.g. [E. coli](https://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=413997)

### sourmash commands

You'll need the three genome files in `~ctbrown/data/sulfo`.

```
sourmash sketch dna a.fa.gz --name 'Sulfurihydrogenibium' -o a.sig.zip
sourmash sketch dna b.fa.gz --name 'Sulfitobacter sp. EE-36' -o b.sig.zip
sourmash sketch dna c.fa.gz --name 'Sulfitobacter sp. NAS-14.1' -o c.sig.zip

sourmash compare *.sig.zip -o sulfo.cmp

sourmash plot sulfo.cmp
```

This will produce a file `sulfo.cmp.matrix.png`.

## Additional & optional mission: try starting an RStudio Server via the Open On Demand Web interface.

**This will take 2-3 hours to set up.**

Note: you'll need an ssh public key of your very own in order to do this; see [these two answers in the FAQ for some help](https://hpc.ucdavis.edu/faq#ssh-key).

Sign up for a farm account of your very own by going to https://hippo.ucdavis.edu/Farm/create. Use 'datalabgrp'.

Wait 2-3 hours.

Then, go to https://ondemand.farm.hpc.ucdavis.edu/ and see if you can start up an RStudio Server of your very own.
