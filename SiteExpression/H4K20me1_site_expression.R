library(limma)

vals = read.table("/nas/homes/benyang/H4K20me1/Figures/homer/CUTTAG_ATAC_homer/TF_RNASeq/differential_rna_expression/diff_d0_Y_vs_A.tsv", sep="\t", header=T)
vals$gene=sapply(rownames(vals), function(x) unlist(strsplit(x, split="_", fixed=T))[2])
vals$pscaled = -10*log10(vals$adj.P.Val)
vals$sig = ifelse(abs(vals$logFC)>1 & vals$adj.P.Val<0.05, "Sig", "Not Sig")

unique.aged.genes = read.table("/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique.Aged.genenames.txt")
unique.young.genes = read.table("/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique.Young.genenames.txt")

unique.aged.genes.expr = data.frame(gene=vals$gene[vals$gene %in% unlist(unique.aged.genes)])
unique.young.genes.expr = data.frame(gene=vals$gene[vals$gene %in% unlist(unique.young.genes)])

unique.aged.genes.expr$logFC = vals$logFC[vals$gene %in% unique.aged.genes.expr$gene]
unique.young.genes.expr$logFC = vals$logFC[vals$gene %in% unique.young.genes.expr$gene]
unique.aged.genes.expr$FDR = vals$adj.P.Val[vals$gene %in% unique.aged.genes.expr$gene]
unique.young.genes.expr$FDR = vals$adj.P.Val[vals$gene %in% unique.young.genes.expr$gene]

write.table(unique.young.genes.expr[order(unique.young.genes.expr$FDR),], file="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique_young_genes_expr.txt",
            sep="\t", quote=F, row.names = F)
write.table(unique.aged.genes.expr[order(unique.aged.genes.expr$FDR),], file="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique_aged_genes_expr.txt",
            sep="\t", quote=F, row.names = F)

write.table(subset(unique.young.genes.expr, subset=abs(logFC)>1 & FDR<0.05), 
            file="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique_young_genes_expr_sig.txt",
            sep="\t", quote=F, row.names = F)
write.table(subset(unique.aged.genes.expr, subset=abs(logFC)>1 & FDR<0.05), 
            file="/nas/homes/benyang/H4K20me1/Figures/H4K20me1_site_expression/unique_aged_genes_expr_sig.txt",
            sep="\t", quote=F, row.names = F)
