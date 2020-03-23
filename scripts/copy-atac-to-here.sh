#!/usr/bin/env bash
sourcedir="/nas/homes/annashch/Age_ATAC"
sinkdir="/nas/homes/benyang/H4K20me1/ATAC_peaks"
suffix="ATAC_optimal_peak.narrowPeak.gz"

cp "$sourcedir/outputs/d0_Aged/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d0_Aged.$suffix"
cp "$sourcedir/outputs/d0_Young/cromwell-executions/atac/e373e737-4927-458b-b2cb-023ed08dd76e/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d0_Young.$suffix"
cp "$sourcedir/outputs/d0_Young_Pax7/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d0_Young_Pax7.$suffix"
cp "$sourcedir/outputs/d1_Aged/cromwell-executions/atac/4eab35c7-3cb6-4836-834a-52aaf44300ce/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d1_Aged.$suffix"
cp "$sourcedir/outputs/d1_Young/cromwell-executions/atac/ae7e0583-b599-4f9d-b576-2d894bf69b5f/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d1_Young.$suffix"
cp "$sourcedir/outputs/d3_Aged/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d3_Aged.$suffix"
cp "$sourcedir/outputs/d3_Young/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d3_Young.$suffix"
cp "$sourcedir/outputs/d5_Aged/cromwell-executions/atac/cd51b1d5-c953-45a0-84e2-7c98de55808b/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d5_Aged.$suffix"
cp "$sourcedir/outputs/d5_Young/cromwell-executions/atac/13ba4ec6-4586-4521-bbb8-a9f5cca58858/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d5_Young.$suffix"
cp "$sourcedir/outputs/d7_Aged/cromwell-executions/atac/472be64d-266c-4668-a7fc-3d66a18257f7/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d7_Aged.$suffix"
cp "$sourcedir/outputs/d7_Young/cromwell-executions/atac/e3042974-4252-4c53-85a4-e2f8a3af880d/call-reproducibility_overlap/execution/optimal_peak.narrowPeak.gz" "$sinkdir/d7_Young.$suffix"
cp "$sourcedir/croo/21d_aged/peak/overlap_reproducibility/overlap.optimal_peak.narrowPeak.gz" "$sinkdir/d21_Aged.$suffix"
cp "$sourcedir/croo/21d_young/peak/overlap_reproducibility/overlap.optimal_peak.narrowPeak.gz" "$sinkdir/d21_Young.$suffix"

gunzip $sinkdir/*.gz