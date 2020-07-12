#!/usr/bin/env bash

pjdir="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression"

cut -f 4 $pjdir/Aged.nearest.tss.bed | sort | uniq > $pjdir/Aged.genenames.txt

cut -f 4 $pjdir/Young.nearest.tss.bed | sort | uniq > $pjdir/Young.genenames.txt

grep -w -f $pjdir/Aged.genenames.txt $pjdir/Young.genenames.txt > $pjdir/common.genenames.txt
grep -v -w -f $pjdir/Aged.genenames.txt $pjdir/Young.genenames.txt > $pjdir/unique.Young.genenames.txt 
grep -v -w -f $pjdir/Young.genenames.txt $pjdir/Aged.genenames.txt > $pjdir/unique.Aged.genenames.txt
