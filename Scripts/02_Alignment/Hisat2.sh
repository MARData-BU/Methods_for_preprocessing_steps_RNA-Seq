#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the BAM files (aligned reads) using Hisat2

#======MODULES======#

module purge
module load HISAT2/2.2.1
module load Python/3.8.6-GCCcore-10.2.0

#============##======HISAT2======##============#

#======NEEDED FILES======#

FASTQDIR=/path/to/fastqfiles

OUTDIR=/path/to/output/directory

ANNOTGENE_GTF=/path/yo/your/annotation

#======LOOP======#
suffix="_1.fastq.gz"

FASTQFILES=($(ls -1 $FASTQDIR/*${suffix} | sed "s/$suffix//"))

i=$(($SLURM_ARRAY_TASK_ID - 1))

THISFASTQFILE=${FASTQFILES[i]}

R1=$suffix
R2=`echo $suffix | sed "s/1/2/"`

name=`basename $THISFASTQFILE`

#====== HISAT2 PAIRED======#

# for paired-end FASTQ reads alignment
hisat2 -x $ANNOTGENE_GTF -1 $THISFASTQFILE$R1 -2 $THISFASTQFILE$R2 -S $OUTDIR/$name.sam
