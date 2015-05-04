## ------------------------------------------------------------------------
require(FirebrowseR)
cohorts = Metadata.Cohorts() # Download all available cohorts
cancer.Type = cohorts[grep("breast", cohorts$description, ignore.case = T), 1]
print(cancer.Type)

## ------------------------------------------------------------------------
brca.Pats = Samples.ClinicalTier1(cohort = cancer.Type)
dim(brca.Pats)

## ------------------------------------------------------------------------
all.Received = F
page.Counter = 1
brca.Pats = list()
while(all.Received == F){
  brca.Pats[[page.Counter]] = Samples.ClinicalTier1(cohort = cancer.Type,
                                                    page = page.Counter)
  if(page.Counter > 1)
    colnames(brca.Pats[[page.Counter]]) = colnames(brca.Pats[[page.Counter-1]])
  
  if(nrow(brca.Pats[[page.Counter]]) < 250){
    all.Received = T
  } else{
    page.Counter = page.Counter + 1
  }
}
brca.Pats = do.call(rbind, brca.Pats)
dim(brca.Pats)

## ------------------------------------------------------------------------
brca.Pats = brca.Pats[ which(brca.Pats$vital_status == 1), ]

## ------------------------------------------------------------------------
diff.Exp.Genes = c("ESR1", "GATA3", "XBP1", "FOXA1", "ERBB2", "GRB7", "EGFR",
                   "FOXC1", "MYC")
all.Found = F
page.Counter = 1
mRNA.Exp = list()
page.Size = 2000 # using a bigger page size is faster
while(all.Found == F){
  mRNA.Exp[[page.Counter]] = Samples.mRNASeq(gene = diff.Exp.Genes,
                                             tcga_participant_barcode =
                                               brca.Pats$tcga_participant_barcode,
                                             page_size = page.Size,
                                             page = page.Counter)
  if(nrow(mRNA.Exp[[page.Counter]]) < page.Size)
    all.Found = T
  else
    page.Counter = page.Counter + 1
}
mRNA.Exp = do.call(rbind, mRNA.Exp)
dim(mRNA.Exp)

## ------------------------------------------------------------------------
# Patients with normal tissue
normal.Tissue.Pats = which(mRNA.Exp$sample_type == "NT")
# get the patients barcodes
patient.Barcodes = mRNA.Exp$tcga_participant_barcode[normal.Tissue.Pats] 
# Subset the mRNA.Exp data frame, keeping only the pre-selected barcodes AND
# having a sample type of NT or TP
mRNA.Exp = mRNA.Exp[which(mRNA.Exp$tcga_participant_barcode %in% patient.Barcodes &
                            mRNA.Exp$sample_type %in% c("NT", "TP")), ]

## ----, fig.width = 7, fig.height = 7-------------------------------------
require(ggplot2)
p = ggplot(mRNA.Exp, aes(factor(gene), z.score))
p +
  geom_boxplot(aes(fill = factor(sample_type))) +
  # we drop some outlier, so plot looks nicer, this also causes the warning
  scale_y_continuous(limits = c(-1, 5)) +
  scale_fill_discrete(name = "Tissue")

