# iMapPESTS

This repository contains an organised metabarcoding pipeline based around the DADA2 algorithm and workflow, as used for analysing metabarcoding data from the iMapPESTS project.
This repostiory has a predeterined directories structure so you can clone the repository and use it as the backbone for your project

The pipeline is divided into 4 major steps:
QC of reads and run Data
Trimming and quality filtering of reads, and DADA2 algorithm
Chimera removal, pseudogene filterign and taxonomy addition
Interactive analysis using seqscope

However, there are 2 seperate workflows and vignettes available:
* [Local version for analysis on windows/linux PC](https://alexpiper.github.io/iMapPESTS/local_metabarcoding.html)
* Slurm cluster version for analysis on Agriculture Victoria BASC server *TBC*

Before starting, i recommend learning about the individual componenets of the workflow:
* The dada2 algorithm 
* Taxonomic assignment

Some other helpful tutorials include:

* [DADA2 pipeline official tutorial](https://benjjneb.github.io/dada2/tutorial.html) By Benjamin Callahan.
* [DADA2 example workflow](https://astrobiomike.github.io/amplicon/dada2_workflow_ex) by Mike Lee.
