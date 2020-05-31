#!/bin/bash
prefix=/nas/homes/annashch/H4K20me1/
outdir=/nas/homes/benyang/H4K20me1/anna_broadpeak

samtools merge -@ 40 \
    $outdir/merged.Old.bam \
    $prefix/caper_out/chip/7aab8e70-c16d-481f-ab6d-ebd0e3683fae/call-align/shard-0/execution/Old-H4K20me1-1_R1_001_val_1.bam \
    $prefix/caper_out/chip/7aab8e70-c16d-481f-ab6d-ebd0e3683fae/call-align/shard-1/execution/Old-H4K20me1-2_R1_001_val_1.bam \
    $prefix/caper_out/chip/7aab8e70-c16d-481f-ab6d-ebd0e3683fae/call-align/shard-2/execution/Old-H4K20me1-3_R1_001_val_1.bam

samtools index -@ 40 $outdir/merged.Old.bam

bamCoverage -p16 -v \
    --normalizeUsing RPKM \
    --binSize 1 \
    --samFlagExclude 780 \
    --Offset 1 2 \
    --minMappingQuality 30 \
    -b $outdir/merged.Old.bam \
    -o $outdir/5p.counts.Old.RPKM.bw 

samtools merge -@ 40 \
    $outdir/merged.Young.bam \
    $prefix/caper_out/chip/72cab657-4520-4eee-b95a-d87eac1cecbf/call-filter/shard-1/execution/Young-H4K20me1-2_R1_001_val_1.nodup.bam \
    $prefix/caper_out/chip/72cab657-4520-4eee-b95a-d87eac1cecbf/call-filter/shard-2/execution/Young-H4K20me1-3_R1_001_val_1.nodup.bam \
    $prefix/caper_out/chip/72cab657-4520-4eee-b95a-d87eac1cecbf/call-filter/shard-0/execution/Young-H4K20me1-1_R1_001_val_1.nodup.bam

samtools index -@ 40 $outdir/merged.Young.bam

bamCoverage -p16 -v \
    --normalizeUsing RPKM \
    --binSize 1 \
    --samFlagExclude 780 \
    --Offset 1 2 \
    --minMappingQuality 30 \
    -b $outdir/merged.Young.bam \
    -o $outdir/5p.counts.Young.RPKM.bw 
