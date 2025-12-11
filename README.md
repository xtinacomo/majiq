**Cryptic Exon Analysis using [Majiq 2.5](https://majiq.biociphers.org)** 

This repository contains simple, command-line scripts that wrap commonly used MAJIQ operations. These scripts are intended for researchers who already have aligned RNA-seq BAM files and want a quick, reproducible way to run:
MAJIQ build (splice graph construction)
MAJIQ psi (PSI quantification)
MAJIQ deltapsi (differential splicing between conditions)

Requires a plain-text file containing absolute paths to BAM files:

```
/path/to/sample1.bam
/path/to/sample2.bam
/path/to/sample3.bam
```

Requires annotation GFF3: gencode.v43.annotation.gff3

1. Edit config file to include files and directories. All sample files must be in the same directory.
2. Run the majiq.sh script and edit output results folder 
3. Run the majiq_psi script. Deltapsi will calculate between two groups in a different folder named diff.
   
**To launch Voila visualizer on Biowulf:**
1. Open a Graphical session using HPC OnDemand.
2. In the terminal, navigate to where the .tsv and .voila file exista
3. Launch voila using

```
voila view /path/to/results/file.voila.voila /path/to/results/build/splicegraph.sql
``` 
