#!/bin/bash
#SBATCH -p normal    # Partition to submit to
#SBATCH --cpus-per-task=3
#SBATCH --mem-per-cpu 30Gb       # Memory in MB
#SBATCH -J counts                # job name
#SBATCH -o logs/counts.%j.out    # File to which standard out will be written
#SBATCH -e logs/counts.%j.err    # File to which standard err will be written


#Ariadna A. Terrades
#Generate the table of counts with Salmon

#======MODULES======#

module purge
module load Salmon/1.5.2-linux_x86_64

#============##======SALMON======##============#

#======NEEDED FILES======#
lane=$1
OUTDIR=$2
suffix=$3
name=`basename $lane`

R1=$suffix
R2=`echo $suffix | sed "s/1/2/"`

INDEX=/path/to/index # You have to previously run the function to create the index for Salmon

#======COMMAND======#
salmon quant -i $INDEX -l A -1 $lane$R1 -2 $lane$R2 --validateMappings -o $OUTDIR/$name
