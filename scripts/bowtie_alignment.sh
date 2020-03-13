#!/usr/bin/env bash

#pjdir="/nas/homes/benyang/H4K20me1"
pjdir="/nas/homes/benyang"
fastqdir="$pjdir/H4K20me1/trim_fastq"
outdir="$pjdir/H4K20me1/align_sam"

for i in `ls -p $fastqdir | grep -v / | sed 's/.fastq.gz//' | sort | cut -d'_' -f 1 | uniq`
do
filename="$(echo $i | cut -d'_' -f 1)"
echo @@@@@@@@@@@@@ Processing $filename
#echo "filename $fastqdir/${filename}_R1_001.fastq.gz"
bowtie2 \
-x mm10 \
--local \
--very-sensitive-local \
--no-unal \
--no-mixed \
--no-discordant \
--phred33 \
--threads 32 \
--time \
-I 10 \
-X 700 \
-1 $fastqdir/${filename}_1.fastq.gz \
-2 $fastqdir/${filename}_2.fastq.gz \
-S $outdir/${filename}.sam
done