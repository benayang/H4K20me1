#!/usr/bin/env bash
sourcedir="/nas/homes/benyang/H4K20me1"
sinkdir="/nas/homes/benyang/H4K20me1/CUTTAG_peaks"
suffix="CUTTAG_optimal_peak.narrowPeak.gz"

cp "$sourcedir/Young_encode_pipeline_output/chip/fdd3fcba-c19f-4222-9458-8462c645110b/call-reproducibility_overlap/execution/overlap.optimal_peak.narrowPeak.gz" "$sinkdir/Young.$suffix"
cp "$sourcedir/Old_encode_pipeline_output/chip/5cb6732e-451e-45bf-bfc5-06f142c4a1d9/call-reproducibility_overlap/execution/overlap.optimal_peak.narrowPeak.gz" "$sinkdir/Old.$suffix"



gunzip $sinkdir/*.gz