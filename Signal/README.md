1) Get 5' read counts of H4K20me1 signals from BAM files in RPKM 
```
get_5p_RPKM_counts.sh
```

2) Retrieve TSS from gencode (ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.basic.annotation.gtf.gz)
```
get_and_process_tss.sh
```
4) Find TSS near peaks (+/- 5kb) in Aged and Young
```
get_nearest_tss.sh
```

5) Find unique Aged and Young TSS
```
get_unique_aged_young_nearest_tss.sh
```

6) Blacklist filter and merge TSS (https://github.com/Boyle-Lab/Blacklist/blob/master/lists/mm10-blacklist.v2.bed.gz)
```
filter_and_merge_TSS.sh
```
7) Plot profile and heatmap
```
deeptools_computematrix.sh
```
