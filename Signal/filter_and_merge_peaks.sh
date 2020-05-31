#!/usr/bin/env bash

outdir="/nas/homes/benyang/H4K20me1/Figures/Footprints"
oldpeak="$outdir/Old.tss.near.peaks.bed"
youngpeak="$outdir/Young.tss.near.peaks.bed"
blacklist="/nas/homes/benyang/H4K20me1/mm10-blacklist.v2.bed"

sed '/.\t-1\t-1/d' $oldpeak | bedtools intersect -v -a stdin -b $blacklist | sort | uniq > "$outdir/Old.tss.near.peaks.filt.bed"
sed '/.\t-1\t-1/d' $youngpeak | bedtools intersect -v -a stdin -b $blacklist | sort | uniq > "$outdir/Young.tss.near.peaks.filt.bed"

cat "$outdir/Old.tss.near.peaks.filt.bed" "$outdir/Young.tss.near.peaks.filt.bed" | sort | uniq > "$outdir/merged.tss.near.peaks.filt.bed"