

FASTQDIR=/bicoh/ariadna/data/Bladder/GSE179440/rawData


#============#
#   FASTQC   #
#============#

outdir=/bicoh/ariadna/data/Bladder/GSE179440/QC/FastQC

for i in $(ls $FASTQDIR/*fastq.gz) 
	do
	echo $i
	sbatch /bicoh/ariadna/data/Bladder/GSE179440/QC/fastqc.sh $i $outdir
	sleep 1
done
