#!/usr/bin/env bash
#SBATCH --job-name=majiq
#SBATCH --nodes 1
#SBATCH --tasks 1
#SBATCH --cpus-per-task 16
#SBATCH --output=./logs/majiq_%j.out
#SBATCH --error=./logs/majiq_%j.err
#SBATCH --time=6:00:00

mkdir -p ./logs

module load majiq/2.5

majiq build /data/CARD_ARDIS/users/comocn/2025_KolfBoyden_RBP_R1/majiq/gencode.v44.annotation.gff3 \
	-o results/build/ \
	-c mini.cfg \
	--minreads 1
