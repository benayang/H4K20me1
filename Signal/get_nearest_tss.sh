#!/usr/bin/env bash

peakdir="/nas/homes/benyang/H4K20me1/SEACR_peaks/SEACR_collated_peaks"
outdir="/nas/homes/benyang/H4K20me1/Figures/Footprints"
tss_dir="/nas/homes/benyang/H4K20me1/get_tss/tss.gencode.vM25.basic.annotation.nogenename.bed"

sort -k1,1 -k2,2n $peakdir/Old-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools closest -d -a stdin -b "$tss_dir" | \
    awk -F'\t' 'BEGIN{OFS="\t"} { if($7<5000) { print $4,$5,$6 } }' > $outdir/Aged.nearest.tss.bed

sort -k1,1 -k2,2n $peakdir/Young-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools closest -d -a stdin -b "$tss_dir" | \
    awk -F'\t' 'BEGIN{OFS="\t"} { if($7<5000) { print $4,$5,$6 } }' > $outdir/Young.nearest.tss.bed