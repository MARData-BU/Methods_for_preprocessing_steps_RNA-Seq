#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the table of counts with Kallisto

#======MODULES======#

module purge
module load kallisto/0.45.0

ñ

#======NEEDED FILES======#
FASTQDIR=/path/to/fastqfiles

OUTDIR=/path/to/output/directory

INDEX=/path/to/index # You have to previously run the function to create the index for Kallisto


#======LOOP AND COMMAND======#

for i in $(ls $FASTQDIR/*_1.fastq.gz) 
	do
	echo $i
	iname=$(echo $(basename $i))
	mkdir $OUTDIR/$iname
	j=$(echo $i | sed "s/_1.fastq.gz/_2.fastq.gz/")
	kallisto quant -i $INDEX -o $OUTDIR/$iname $i $j
done


 