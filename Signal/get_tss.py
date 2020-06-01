
import pandas as pd
#gtf file source: ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_mouse/release_M25/gencode.vM25.basic.annotation.gtf.gz
data=pd.read_csv("gencode.vM25.basic.annotation.gtf",header=None,sep='\t',skiprows=5)
gene_names=[] 
for index,row in data.iterrows():
    cur_gene_name=None
    gene_info=row[8].split(';')
    for entry in gene_info:
        entry=entry.strip()
        if entry.startswith('gene_name'):
            cur_gene_name=entry.split('"')[1]
            break
    gene_names.append(cur_gene_name)
data['gene']=gene_names 
data=data[data[2]=="gene"]
plus_strand=data[data[6]=="+"]
minus_strand=data[data[6]=='-']
plus_strand['chrom']=plus_strand[0]
plus_strand['start']=plus_strand[3]
plus_strand['end']=plus_strand[3]+1
minus_strand['chrom']=minus_strand[0]
minus_strand['end']=minus_strand[4]
minus_strand['start']=minus_strand[4]-1
plus_subset=plus_strand[['chrom','start','end','gene']]
minus_subset=minus_strand[['chrom','start','end','gene']]
merged=pd.concat((plus_subset,minus_subset),axis=0)
merged.to_csv("tss.gencode.vM25.basic.annotation.bed",sep='\t',header=False,index=False)




