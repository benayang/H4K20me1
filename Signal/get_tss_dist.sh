peakdir="/nas/homes/benyang/H4K20me1/SEACR_peaks/SEACR_collated_peaks"
outdir="/nas/homes/benyang/H4K20me1/Figures/Footprints"
genome_dir="/nas/homes/benyang/Genome_References"

sort -k1,1 -k2,2n \
    $peakdir/Old-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools closest \
    -a - \
    -b "$genome_dir/mm10_gencode_tss_unique.bed.gz" -d > $outdir/Old.distance.bed

sort -k1,1 -k2,2n $peakdir/Young-H4K20me1-trimmed-pooled_005.stringent.collated.bed | \
    bedtools closest \
    -a - \
    -b "$genome_dir/mm10_gencode_tss_unique.bed.gz" -d > $outdir/Young.distance.bed