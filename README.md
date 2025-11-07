**Cryptic Exon Analysis using [Majiq 2.5]((https://majiq.biociphers.org))** 

1. Edit config file to include files and directories. All sample files must be in the same directory.
2. Run the majiq.sh script and edit output results folder 
3. Run the majiq_psi script. Deltapsi will calculate between two groups in a different folder named diff.
   
**To launch Voila visualizer on Biowulf:**
1. Open a Graphical session using HPC OnDemand.
2. In the terminal, navigate to where the .tsv and .voila file exista
3. Launch voila using

```
voila tsv -f /path/to/results/file.voila.tsv /path/to/results/build/splicegraph.sql /path/to/results/dpsi/deltapsi.voila
``` 
