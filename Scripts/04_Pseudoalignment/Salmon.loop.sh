#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the loop for Salmon

#============##======LOOP FOR SALMON======##============#

#======NEEDED FILES======#
suffix=_1.fastq.gz # it is an example, you have to put the suffix that you have in your data

FASTQDIR=/path/to/fastqfiles
OUTDIR=/path/to/output/directory

#======LOOP AND COMMAND======#
for i in $(ls $FASTQDIR/*${suffix} | sed "s/$suffix//")
	do
	echo $i
	sbatch salmon.sh $i $OUTDIR $suffix
	sleep 1
done