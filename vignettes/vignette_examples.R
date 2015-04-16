require(FireBrowseR)

# We want to analyse Breast cancer. So we are designing our cohort first.
# We download the names of all available cohorts and look them up for breast
# cancer.
cohorts = Metadata.Cohorts() # Download all available cohorts
#BRCA is the identifier for Breast cancer.
cohorts[grep("breast", cohorts$description, ignore.case = T), ]
cancer.Type = cohorts[grep("breast", cohorts$description, ignore.case = T), 1]

# Now we can query for the patients wich are in the BRCA cohort
brca.Pats = Samples.ClinicalTier1(cohort = cancer.Type)
dim(brca) # there should be more then 250 patients

# By default we get a maximum of 250 entries per page. We can increase the page
# size, or (if this is not enough) we iterate over the page until we received
# everything.

all.Received = F
page.Counter = 1
brca.Pats = list()
while(all.Received == F){

  brca.Pats[[page.Counter]] = Samples.ClinicalTier1(cohort = cancer.Type,
                                                    page = page.Counter)
  if(nrow(brca.Pats[[page.Counter]]) < 250)
    all.Received = T
  else
    page.Counter = page.Counter + 1
}
brca.Pats = do.call(rbind, brca.Pats)
dim(brca.Pats)
foo = brca.Pats

# We reduce the number of patients, so we don't need to download so much data.
brca.Pats = brca.Pats[ which(brca.Pats$vital_status == 1), ]

# We now received all clinical informations from breast cancer patients,
# 1070 in total

# Now we look at some genes which are known to be differentially expressed in
# breast cancer
diff.Exp.Genes = c("ESR1","GATA3","XBP1","FOXA1","ERBB2","GRB7","EGFR",
                   "FOXC1","MYC")

# We just assume the list above as given, to keep the ampount as small as
# possible in this tutorial, so you can run through it quickly
# Next we retrieve the mRNA expression data

all.Found = F
page.Counter = 1
mRNA.Exp = list()
page.Size = 2000 # this is the maximum allowed
while(all.Found == F){
  mRNA.Exp[[page.Counter]] = Samples.mRNASeq(gene = diff.Exp.Genes,
                                             tcga_participant_barcode = brca.Pats$tcga_participant_barcode,
                                             page_size = page.Size)
  if(nrow(mRNA.Exp[[page.Counter]]) < page.Size)
    all.Found = T
  else
    page.Counter = page.Counter + 1
}
mRNA.Exp = do.call(rbind, mRNA.Exp)

#foo = mRNA.Exp

# We only keep the samples having a primary tumor and corrosponding normals
# tissue

normal.Tissue.Pats = which(mRNA.Exp$sample_type == "NT") # which patients have normal tissue available
patient.Barcodes = mRNA.Exp$tcga_participant_barcode[normal.Tissue.Pats]
mRNA.Exp = mRNA.Exp[which(mRNA.Exp$tcga_participant_barcode %in% patient.Barcodes &
                            mRNA.Exp$sample_type %in% c("NT", "TP")), ]

require(ggplot2)
p = ggplot(mRNA.Exp, aes(factor(gene), z.score))
p +
  geom_boxplot(aes(fill = factor(sample_type))) +
  scale_y_continuous(limits = c(-1, 5)) # we drop some outlier, so plot looks nicer
