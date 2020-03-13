#!/usr/bin/env bash

pjdir="/nas/homes/benyang/H4K20me1"
fastqdir="$pjdir/raw_fastq"
outdir="$pjdir/trim_fastq"
btdir="/nas/homes/benyang/mm10_bowtie"

for i in `ls $fastqdir | sed 's/_001.fastq.gz//' | sort | cut -d'_' -f 1 | uniq`
do
echo @@@@@@@@@@@@@ Processing $i
filename="$(echo $i | cut -d'_' -f 1)"
#echo "filename $fastqdir/${filename}_R1_001.fastq.gz"
flexbar \
-r $fastqdir/${filename}_R1_001.fastq.gz \
-p $fastqdir/${filename}_R2_001.fastq.gz \
-t $outdir/$i-trimmed \
--adapter-preset Nextera \
-n 32 \
-m 36 \
--adapter-trim-end RIGHT \
--adapter-min-overlap 7 \
--min-read-length 60 \
--zip-output GZ
done