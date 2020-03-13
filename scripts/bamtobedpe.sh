#!/usr/bin/env bash

#pjdir="/nas/homes/benyang/H4K20me1"
pjdir="/nas/homes/benyang/H4K20me1"
bamdir="$pjdir/align_md_pruned_bam"
outdir="$pjdir/align_bedpe"

for i in `ls -p $bamdir | grep -v / | sed 's/.bam//'`
do
echo @@@@@@@@@@@@@ Processing $i
#echo "filename $fastqdir/${filename}_R1_001.fastq.gz"
# sort by chromosome and start position (sort -k1,1 -k2,2n)
bedtools bamtobed -bedpe -i $bamdir/$i.bam | sort -k1,1 -k2,2n > $outdir/$i.bedpe
done