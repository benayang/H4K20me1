#!/usr/bin/env bash
peakdir="/nas/homes/benyang/H4K20me1/intersect_CUTTAG_ATAC"
outdir="/nas/homes/benyang/H4K20me1/homer"
overlap="optimal_peak_overlap"
unique="optimal_peak_no_overlap"

if [[ ! -e $outdir/no_overlap/homer_output.log ]]; then
    touch $outdir/no_overlap/homer_output.log
fi

for file in d0_Aged.$overlap d0_Aged.$unique d0_Young.$overlap d0_Young.$unique Old.CUTTAG.$unique Young.CUTTAG.$unique; do
    mkdir -p $outdir/$file
    echo "@@@@@@@@@@@@ Analyzing $file" >> $outdir/homer_output.log
    findMotifsGenome.pl $peakdir/$file.bed mm10 $outdir/$file -p 32 >> $outdir/homer_output.log
done
