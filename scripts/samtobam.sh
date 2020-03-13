#!/usr/bin/env bash

##########################################
# https://github.com/ParkerLab/bioinf545 #
##########################################

#pjdir="/nas/homes/benyang/H4K20me1"
pjdir="/nas/homes/benyang/H4K20me1"
samdir="$pjdir/align_sam"
picard="/home/labuser/tools/picard.jar"
bamdir="$pjdir/align_bam"
mdbamdir="$pjdir/align_md_bam"
prunebamdir="$pjdir/align_md_pruned_bam"

for i in `ls -p $samdir | grep -v / | sed 's/.sam//'`
do
echo @@@@@@@@@@@@@ Processing $i
#echo "filename $fastqdir/${filename}_R1_001.fastq.gz"

# Create the BAM file (sorted by genomic coordinates?)
samtools sort -@ 32 -O bam -T $i.tmp -o $bamdir/$i.bam $samdir/$i.sam

# Mark duplicate alignments from original DNA fragment, PCR/optical artifacts, sequencing, etc
java -Xmx32g -jar $picard MarkDuplicates \
I=$bamdir/$i.bam \
O=$mdbamdir/$i.md.bam \
ASSUME_SORTED=true \
METRICS_FILE=$mdbamdir/$i.markdup.metrics \
VALIDATION_STRINGENCY=LENIENT

# Index BAM file with duplicates marked
samtools index $mdbamdir/$i.md.bam

# Sift out good alignments -- reads that map uniquely, with good quality, to autosomal references
# Creates an environment variable CHROMOSOMES to hold a list of autosomal references 
# obtained from the header of the BAM file:
export CHROMOSOMES=$(samtools view -H $mdbamdir/$i.md.bam | \
grep '^@SQ' | \
cut -f 2 | \
grep -v -e _ -e chrM -e chrX -e chrY -e 'VN:' | \
sed 's/SN://' | \
xargs echo)
# only retrieve reads that align to references in CHROMOSOMES
samtools view -b -h -f 3 -F 4 -F 8 -F 256 -F 1024 -F 2048 -q 30 \
$mdbamdir/$i.md.bam $CHROMOSOMES > $prunebamdir/$i.pruned.bam

done