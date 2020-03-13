#!/usr/bin/env bash

#pjdir="/nas/homes/benyang/H4K20me1"
pjdir="/nas/homes/benyang/H4K20me1"
bedpedir="$pjdir/align_bedpe"
outdir="$pjdir/align_macs2"

for i in `ls -p $bedpedir | grep -v / | sed 's/.bedpe//'`
do
echo @@@@@@@@@@@@@ Processing $i
#echo "filename $fastqdir/${filename}_R1_001.fastq.gz"

# Call peaks on aligned reads
macs2 callpeak \
-t $bedpedir/$i.bedpe \
-q 0.05 \
-f BEDPE \
-g mm \
--keep-dup all \
-n $i \
-B \
--outdir $outdir

# Create browser track for UCSC genome browser


done