#!/usr/bin/env bash

pjdir="/nas/homes/benyang/H4K20me1"
#bwdir="$pjdir/SEACR_bw"
bwdir="$pjdir/anna_broadpeak"
overlapdir="$pjdir/Figures/Footprints/sets"
outdir="$pjdir/Figures/Footprints/Profiles"
logfile="$outdir/OldvsYoungCUTTAG_computematrix.log"

[ ! -f $logfile ] && touch $logfile

#########################
# Common peaks

# echo Old Young overlap
# dt=$(date '+%m/%d/%Y %H:%M:%S');
# echo @@@@@@@@@@@@@@@@@@ "Old Young overlap $dt" >> $logfile

# computeMatrix reference-point --samplesLabel "Young-CUTTAG" "Aged-CUTTAG" \
# -p 32 \
# -S $pjdir/anna_broadpeak/5p.counts.Young.bw $pjdir/anna_broadpeak/5p.counts.Old.bw \
# -R $overlapdir/11_Old_Young.bed \
# --referencePoint center \
# -o $outdir/OldvsYoungCUTTAG_common.mat.gz \
# --missingDataAsZero \
# --binSize 200 \
# --averageTypeBins mean \
# --upstream 5000 \
# --downstream 5000 \
# --binSize=10 2>> $logfile

#plotHeatmap --colorMap RdBu --regionsLabel "Shared" "Young Only" "Aged Only"  -m h4k20me1.mat.gz -out h4k20me1.seacr.svg  --heatmapHeight 10 --legendLocation best

# plotHeatmap -m $outdir/OldvsYoungCUTTAG_common.mat.gz \
# --plotTitle "Young & Aged CUTTAG" \
# --colorMap bwr \
# -out $outdir/AgedvsYoungCUTTAG_common.png

##########################
# Unique peaks

# for s in Aged-CUTTAG Young-CUTTAG
# do

# echo $s unique
# dt=$(date '+%m/%d/%Y %H:%M:%S');
# echo @@@@@@@@@@@@@@@@@@ "$s unique $dt" >> $logfile

# if grep -q Young <<< $s
# then ref="01_Young.bed";
# else
# ref="10_Old.bed";
# fi

# computeMatrix reference-point --samplesLabel "Young-CUTTAG" "Aged-CUTTAG" \
# -p 32 \
# -S $bwdir/5p.counts.Young.RPKM.bw $bwdir/5p.counts.Old.RPKM.bw \
# -R $overlapdir/10_Old.bed $overlapdir/01_Young.bed $overlapdir/11_Old_Young.bed \
# -o $outdir/${s}_unique.mat.gz \
# --missingDataAsZero \
# --upstream 5000 \
# --downstream 5000 \
# --averageTypeBins mean \
# --binSize 100 2>> $logfile

# plotProfile -m $outdir/${s}_unique.mat.gz --perGroup --plotTitle "$s Unique" -out $outdir/${s}_unique_profile.png

# plotHeatmap -m $outdir/${s}_unique.mat.gz \
# --plotTitle "$s Unique" \
# --colorMap bwr \
# -out $outdir/${s}_unique.png

#done

computeMatrix reference-point --samplesLabel "Young" "Aged" \
-p 32 \
-S $bwdir/5p.counts.Young.RPKM.bw $bwdir/5p.counts.Old.RPKM.bw \
-R $pjdir/Figures/Footprints/merged.tss.near.peaks.bed \
-o $outdir/H4K20me1_merged.mat.gz \
--missingDataAsZero \
--upstream 5000 \
--downstream 5000 \
--averageTypeBins mean \
--binSize 50 2>> $logfile

plotProfile -m $outdir/H4K20me1_merged.mat.gz \
    --legendLocation best \
    --colors red blue \
    --plotWidth 10 --plotHeight 10 \
    --perGroup -out $outdir/H4K20me1_merged_profile.svg