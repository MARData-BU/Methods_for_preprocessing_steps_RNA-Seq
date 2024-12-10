#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the BAM files (aligned reads) using STAR


#======MODULES======#

module purge
module load STAR/2.7.8a-GCC-10.2.0

#============##======STAR======##============#

#======NEEDED FILES======#
FASTQDIR=/path/to/fastqfiles
OUTDIR=/path/to/output/directory

ANNOTGENE_GTF=/path/yo/your/annotation

GNMIDX=/path/to/index # You have to previously run the function to create the index for Kallisto

#======LOOP======#
suffix="_1.fastq.gz"

FASTQFILES=($(ls -1 $FASTQDIR/*${suffix} | sed "s/$suffix//"))

i=$(($SLURM_ARRAY_TASK_ID - 1))

THISFASTQFILE=${FASTQFILES[i]}

R1=$suffix
R2=`echo $suffix | sed "s/1/2/"`

name=`basename $THISFASTQFILE`

#======COMMAND======#

STAR --runThreadN $SLURM_CPUS_PER_TASK\
 --genomeDir $GNMIDX --readFilesIn $THISFASTQFILE$R1 $THISFASTQFILE$R2 --readFilesCommand zcat --outFileNamePrefix\
 $OUTDIR/$name --outSAMattributes All --outSAMtype BAM SortedByCoordinate --outFilterType BySJout\
 --sjdbGTFfile $ANNOTGENE_GTF
