#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the table of counts with StringTie

#======MODULES======#

module purge
module load stringtie/2.2.0


#============##======STRINGTIE======##============#

#======NEEDED FILES======#
DIR=/path/to/your/directory
BAMDIR=/path/to/BAM_files

OUTDIR=/path/to/output/directory

ANNOTGENE_GTF=/path/yo/your/annotation

#======LOOP======#

BAMFILES=($(ls -1 $BAMDIR/*.bam))

i=$(($SLURM_ARRAY_TASK_ID - 1))

THISBAMFILE=${BAMFILES[i]}

name=$(basename $THISBAMFILE .bam)

#======COMMAND======#

stringtie -e -G $ANNOTGENE_GTF -o $OUTDIR/${name}.gtf $THISBAMFILE

