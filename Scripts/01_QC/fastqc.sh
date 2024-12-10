#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Run QC using FastQC program

#======MODULES======#

module purge 
module load FastQC/0.11.7-Java-1.8.0_162

#============##======FASTQC======##============#

#======NEEDED FILES======#

INFILE=$1
OUTDIR=$2

#======COMMAND======#

fastqc --outdir $OUTDIR --threads $SLURM_CPUS_PER_TASK $INFILE

