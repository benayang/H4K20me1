#!/usr/bin/env bash

peakdir="/nas/homes/benyang/H4K20me1/SEACR_peaks/SEACR_collated_peaks"
outdir="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression"
mm10_genome="/nas/homes/benyang/H4K20me1/mm10.chrom.sizes"
tss_dir="/nas/homes/benyang/H4K20me1/get_tss/tss.gencode.vM25.basic.annotation.uniq.bed"

sort -k1,1 -k2,2n $peakdir/Old-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools slop -i stdin -g "$mm10_genome" -b 5000 | \
    bedtools intersect -wa -a "$tss_dir" -b stdin > $outdir/Aged.5kb.tss.bed

sort -k1,1 -k2,2n $peakdir/Young-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools slop -i stdin -g "$mm10_genome" -b 5000 | \
    bedtools intersect -wa -a "$tss_dir" -b stdin > $outdir/Young.5kb.tss.bed
