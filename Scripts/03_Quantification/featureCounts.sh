#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the table of counts with featurecounts


#======MODULES======#

module purge
module load Subread/2.0.3

#============##======FEATURE COUNTS======##============#

#======NEEDED FILES======#
DIR=/path/to/your/directory
BAMDIR=/path/to/BAM_files

OUTDIR=/path/to/output/directory

ANNOTGENE_GTF=/path/yo/your/annotation

#======INPUT======#

INPUT=`ls $BAMDIR/*.bam | paste -sd " " -`

#======COMMAND======#

featureCounts -T $SLURM_CPUS_PER_TASK -p --countReadPairs -t exon --largestOverlap -g gene_name -a $ANNOTGENE_GTF \
	-o $OUTDIR/CountsTable.txt $INPUT
