#!/usr/bin/env bash
young="/nas/homes/benyang/H4K20me1/Figures/Footprints/Young.nearest.tss.bed"
aged="/nas/homes/benyang/H4K20me1/Figures/Footprints/Aged.nearest.tss.bed"

grep -w -f "$aged"  "$young" > common.nearest.tss.bed
grep -v -w -f "$aged" "$young" > unique.Young.nearest.tss.bed
grep -v -w -f "$young" "$aged" > unique.Aged.nearest.tss.bed 