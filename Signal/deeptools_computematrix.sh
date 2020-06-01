#!/usr/bin/env bash

pjdir="/nas/homes/benyang/H4K20me1"
#bwdir="$pjdir/SEACR_bw"
bwdir="$pjdir/anna_broadpeak"
overlapdir="$pjdir/Figures/Footprints/sets"
outdir="$pjdir/Figures/Footprints/Profiles"
logfile="$outdir/OldvsYoungCUTTAG_computematrix.log"

[ ! -f $logfile ] && touch $logfile

# echo Old Young overlap
# dt=$(date '+%m/%d/%Y %H:%M:%S');
# echo @@@@@@@@@@@@@@@@@@ "Old Young overlap $dt" >> $logfile

computeMatrix reference-point --samplesLabel "Young" "Aged" \
-p 32 \
-S $bwdir/5p.counts.Young.RPKM.bw $bwdir/5p.counts.Old.RPKM.bw \
-R $pjdir/Figures/Footprints/merged.nearest.tss.filt.bed \
-o $outdir/H4K20me1_merged.mat.gz \
--missingDataAsZero \
--upstream 5000 \
--downstream 5000 \
--averageTypeBins mean \
--binSize 50 2>> $logfile

plotProfile -m $outdir/H4K20me1_merged.mat.gz \
    --legendLocation best \
    --colors red blue \
    --plotTitle "" \
    --averageType "mean" \
    --plotType "se" \
    --plotWidth 10 --plotHeight 10 \
    --perGroup -out $outdir/H4K20me1_merged_profile.svg

computeMatrix reference-point --samplesLabel "Young" "Aged" \
    -p 32 \
    -S $bwdir/5p.counts.Young.RPKM.bw $bwdir/5p.counts.Old.RPKM.bw  \
    -R $pjdir/Figures/Footprints/common.nearest.tss.filt.bed $pjdir/Figures/Footprints/unique.Young.nearest.tss.filt.bed $pjdir/Figures/Footprints/unique.Aged.nearest.tss.filt.bed\
    -o $outdir/h4k20me1.heatmap.mat.gz \
    --upstream 5000 \
    --downstream 5000 \
    --binSize 200 \
    --averageTypeBins mean

plotHeatmap -m $outdir/h4k20me1.heatmap.mat.gz \
    --colorMap RdBu \
    --regionsLabel "" "" "" \
    -out $outdir/h4k20me1.heatmap.svg \
    --heatmapHeight 9 \
    --whatToShow 'heatmap and colorbar' \
    --legendLocation best \
    --xAxisLabel "" \
    --yAxisLabel ""