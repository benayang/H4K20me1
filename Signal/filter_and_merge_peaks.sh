#!/usr/bin/env bash

outdir="/nas/homes/benyang/H4K20me1/Figures/Footprints"
old_tss="$outdir/unique.Aged.nearest.tss.bed"
young_tss="$outdir/unique.Young.nearest.tss.bed"
common_tss="$outdir/common.nearest.tss.bed"
blacklist="/nas/homes/benyang/H4K20me1/mm10-blacklist.v2.bed"

sed '/.\t-1\t-1/d' $old_tss | bedtools intersect -v -a stdin -b $blacklist | sort | uniq > \
    "$outdir/unique.Aged.nearest.tss.filt.bed"
sed '/.\t-1\t-1/d' $young_tss | bedtools intersect -v -a stdin -b $blacklist | sort | uniq > \
    "$outdir/unique.Young.nearest.tss.filt.bed"
sed '/.\t-1\t-1/d' $common_tss | bedtools intersect -v -a stdin -b $blacklist | sort | uniq > \
    "$outdir/common.nearest.tss.filt.bed"

#cat "$outdir/Old.tss.near.peaks.filt.bed" "$outdir/Young.tss.near.peaks.filt.bed" | sort | uniq > "$outdir/merged.tss.near.peaks.filt.bed"
cat "$outdir/unique.Aged.nearest.tss.filt.bed" \
    "$outdir/unique.Young.nearest.tss.filt.bed" \
    "$outdir/common.nearest.tss.filt.bed" | sort -k1,1 -k2,2n | uniq > "$outdir/merged.nearest.tss.filt.bed"