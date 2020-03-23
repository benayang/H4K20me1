#!/usr/bin/env bash
CUTTAGdir="/nas/homes/benyang/H4K20me1/CUTTAG_peaks"
ATACdir="/nas/homes/benyang/H4K20me1/ATAC_peaks"
sinkdir="/nas/homes/benyang/H4K20me1/intersect_CUTTAG_ATAC"
suffix="optimal_peak_overlap.bed"
none_suffix="optimal_peak_no_overlap.bed"

# Peaks that overlap
bedtools intersect -a "$CUTTAGdir/Young.CUTTAG_optimal_peak.narrowPeak" -b "$ATACdir/d0_Young.ATAC_optimal_peak.narrowPeak" > "$sinkdir/d0_Young.$suffix"
bedtools intersect -a "$CUTTAGdir/Old.CUTTAG_optimal_peak.narrowPeak" -b "$ATACdir/d0_Aged.ATAC_optimal_peak.narrowPeak"  > "$sinkdir/d0_Aged.$suffix"

# Peaks that don't overlap
### Unique in CUTTAG
bedtools intersect -a "$CUTTAGdir/Young.CUTTAG_optimal_peak.narrowPeak" -b "$ATACdir/d0_Young.ATAC_optimal_peak.narrowPeak" -v  > "$sinkdir/Young.CUTTAG.$none_suffix"
bedtools intersect -a "$CUTTAGdir/Old.CUTTAG_optimal_peak.narrowPeak" -b "$ATACdir/d0_Aged.ATAC_optimal_peak.narrowPeak" -v  > "$sinkdir/Old.CUTTAG.$none_suffix"

#### Unique in ATAC
bedtools intersect -b "$CUTTAGdir/Young.CUTTAG_optimal_peak.narrowPeak" -a "$ATACdir/d0_Young.ATAC_optimal_peak.narrowPeak" -v  > "$sinkdir/d0_Young.$none_suffix"
bedtools intersect -b "$CUTTAGdir/Old.CUTTAG_optimal_peak.narrowPeak" -a "$ATACdir/d0_Aged.ATAC_optimal_peak.narrowPeak" -v  > "$sinkdir/d0_Aged.$none_suffix"