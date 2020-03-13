#!/usr/bin/env bash

pjdir="/nas/homes/benyang/H4K20me1"
fastqdir="$pjdir/raw_fastq"
tooldir="~/tools/FastQC/fastqc"
outdir="$pjdir/fastqc/raw_fastq"

for i in `ls -1 $fastqdir | sed 's/.fastq.gz//'`
do
echo @@@@@@@@@@@@@ Processing $i
[ -f $fastqdir/$i.fastq.gz ] && { $tooldir $fastqdir/$i.fastq.gz --output $outdir }
#$tooldir $fastqdir/$i.fastq.gz \
#-o $outdir
done