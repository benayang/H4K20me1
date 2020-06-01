python get_tss.py

cat tss.gencode.vM25.basic.annotation.bed | \
    awk -F"\t" 'BEGIN{OFS="\t";} {print $1,$2,$3;}' | \
    sort -k1,1 -k2,2n | uniq > tss.gencode.vM25.basic.annotation.nogenename.bed
