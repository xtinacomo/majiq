#!/bin/bash
SRC="/data/CARDPB2/users/comocn/scratch/results/star"
DEST="/data/comocn/majiq/LINKS2"
=======
#!/usr/bin/env bash
#SBATCH --job-name=majiq
#SBATCH --nodes 1
#SBATCH --tasks 1
#SBATCH --cpus-per-task 16
#SBATCH --output=./logs/majiq_%j.out
#SBATCH --error=./logs/majiq_%j.err
#SBATCH --time=6:00:00

SRC="/data/NGD/2026_Elise_Organoid/snakemake_out/MAPPED"
DEST="/data/NGD/2026_Elise_Organoid/snakemake_out/MAJIQ/majiq/LINKS"

mkdir -p "$DEST"

for d in "$SRC"/TTUr*; do
    [ -d "$d" ] || continue

    sample=$(basename "$d")
    mkdir -p "$DEST/$sample"

    for f in "$d"/*.sorted.bam "$d"/*.sorted.bam.bai; do
        [ -e "$f" ] || continue
        ln -sfn "$f" "$DEST/$sample/$(basename "$f")"
    done
done
