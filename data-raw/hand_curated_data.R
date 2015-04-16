# This function persits the possible arguments for functions using the
# \code{data_type} and \code{tool} parameter. This is necersarry, since the API
# does not provide a way to get all available data types.


# data_types --------------------------------------------------------------

all_types = c("Clinical",
               "CopyNumber",
               "LowPass",
               "MAF",
               "Methylation",
               "miR",
               "miRSeq",
               "mRNA",
               "mRANSeq",
               "RPPA",
               "WIG",
               "bcr",
               "clinical",
               "cn",
               "lowp",
               "methylation",
               "mrna",
               "mrnaseq",
               "me",
               "mirseq",
               "rppa",
               "maf")

archives_standard_data = c(rep(T,11), rep(F,11))
metadata_counts = c(rep(F,11), rep(T,11))

data_types = cbind(archives_standard_data, metadata_counts)
rownames(data_types) = all_types


# tools -------------------------------------------------------------------

all_tools = c("miRseq_Mature_Preprocess", #Samples.miRSeq
              "miRseq_Preprocess", #Samples.miRSeq
              "MutSig1.5", #Analyses.Mutation.MAF
              "MutSig2.0", #Analyses.Mutation.MAF
              "MutSig2CV", #Analyses.Mutation.MAF
              "MutSigCV", #Analyses.Mutation.MAF
              "MutSig1.5", #Analyses.Mutation.SMG
              "MutSig2.0", #Analyses.Mutation.SMG
              "MutSig2CV", #Analyses.Mutation.SMG
              "MutSigCV", #Analyses.Mutation.SMG
              "Clinical_Pick_Tier1", #Archives.StandardData
              "Merge_Clinical", #Archives.StandardData
              "Merge_cna__cgh_1x1m_g4447a__mskcc_org__Level_3__segmentation_data_computation__seg", #Archives.StandardData
              "Merge_cna__hg_cgh_244a__hms_harvard_edu__Level_3__segmentation__seg", #Archives.StandardData
              "Merge_cna__hg_cgh_244a__mskcc_org__Level_3__segmentation_data_computation__seg", #Archives.StandardData
              "Merge_cna__hg_cgh_415k_g4124a__hms_harvard_edu__Level_3__segmentation__seg", #Archives.StandardData
              "Merge_cna__illuminahiseq_dnaseqc__hms_harvard_edu__Level_3__segmentation__seg", #Archives.StandardData
              "Merge_exon__huex_1_0_st_v2__lbl_gov__Level_2__quantile_normalization_exon__data", #Archives.StandardData
              "Merge_exon__huex_1_0_st_v2__lbl_gov__Level_3__quantile_normalization_gene__data", #Archives.StandardData
              "Merge_exon__huex_1_0_st_v2__lbl_gov__Level_3__segmented_as_firma__data", #Archives.StandardData
              "Merge_methylation__humanmethylation27__jhu_usc_edu__Level_3__within_bioassay_data_set_function__data", #Archives.StandardData
              "Merge_methylation__humanmethylation450__jhu_usc_edu__Level_3__within_bioassay_data_set_function__data", #Archives.StandardData
              "Merge_mirna__h_mirna_8x15k__unc_edu__Level_3__unc_DWD_Batch_adjusted__data", #Archives.StandardData
              "Merge_mirna__h_mirna_8x15kv2__unc_edu__Level_3__unc_DWD_Batch_adjusted__data", #Archives.StandardData
              "Merge_mirnaseq__illuminaga_mirnaseq__bcgsc_ca__Level_3__miR_gene_expression__data", #Archives.StandardData
              "Merge_mirnaseq__illuminaga_mirnaseq__bcgsc_ca__Level_3__miR_isoform_expression__data", #Archives.StandardData
              "Merge_mirnaseq__illuminahiseq_mirnaseq__bcgsc_ca__Level_3__miR_gene_expression__data", #Archives.StandardData
              "Merge_mirnaseq__illuminahiseq_mirnaseq__bcgsc_ca__Level_3__miR_isoform_expression__data", #Archives.StandardData
              "Merge_protein_exp__mda_rppa_core__mdanderson_org__Level_3__protein_normalization__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__bcgsc_ca__Level_3__exon_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__bcgsc_ca__Level_3__gene_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__bcgsc_ca__Level_3__splice_junction_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__unc_edu__Level_3__exon_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__unc_edu__Level_3__gene_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminaga_rnaseq__unc_edu__Level_3__splice_junction_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__bcgsc_ca__Level_3__exon_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__bcgsc_ca__Level_3__gene_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__bcgsc_ca__Level_3__splice_junction_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__unc_edu__Level_3__exon_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__unc_edu__Level_3__gene_expression__data", #Archives.StandardData
              "Merge_rnaseq__illuminahiseq_rnaseq__unc_edu__Level_3__splice_junction_expression__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminaga_rnaseqv2__unc_edu__Level_3__exon_quantification__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminaga_rnaseqv2__unc_edu__Level_3__junction_quantification__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminaga_rnaseqv2__unc_edu__Level_3__RSEM_genes__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminaga_rnaseqv2__unc_edu__Level_3__RSEM_genes_normalized__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminaga_rnaseqv2__unc_edu__Level_3__RSEM_isoforms_normalized__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__exon_quantification__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__junction_quantification__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_genes__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_genes_normalized__data", #Archives.StandardData
              "Merge_rnaseqv2__illuminahiseq_rnaseqv2__unc_edu__Level_3__RSEM_isoforms_normalized__data", #Archives.StandardData
              "Merge_snp__genome_wide_snp_6__broad_mit_edu__Level_2__birdseed_genotype__birdseed", #Archives.StandardData
              "Merge_snp__genome_wide_snp_6__broad_mit_edu__Level_3__segmented_scna_hg18__seg", #Archives.StandardData
              "Merge_snp__genome_wide_snp_6__broad_mit_edu__Level_3__segmented_scna_hg19__seg", #Archives.StandardData
              "Merge_snp__genome_wide_snp_6__broad_mit_edu__Level_3__segmented_scna_minus_germline_cnv_hg18__seg", #Archives.StandardData
              "Merge_snp__genome_wide_snp_6__broad_mit_edu__Level_3__segmented_scna_minus_germline_cnv_hg19__seg", #Archives.StandardData
              "Merge_snp__human1mduo__hudsonalpha_org__Level_3__segmented_cna__seg", #Archives.StandardData
              "Merge_snp__human1mduo__hudsonalpha_org__Level_3__segmented_cnv__seg", #Archives.StandardData
              "Merge_snp__human1mduo__hudsonalpha_org__Level_3__segmented_loh__seg", #Archives.StandardData
              "Merge_snp__humanhap550__hudsonalpha_org__Level_3__segmented_cna__seg", #Archives.StandardData
              "Merge_snp__humanhap550__hudsonalpha_org__Level_3__segmented_cnv__seg", #Archives.StandardData
              "Merge_snp__humanhap550__hudsonalpha_org__Level_3__segmented_loh__seg", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_1__unc_edu__Level_2__unc_lowess_normalization_probe_level__data", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_1__unc_edu__Level_3__unc_lowess_normalization_gene_level__data", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_2__unc_edu__Level_2__unc_lowess_normalization_probe_level__data", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_2__unc_edu__Level_3__unc_lowess_normalization_gene_level__data", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_3__unc_edu__Level_2__unc_lowess_normalization_probe_level__data", #Archives.StandardData
              "Merge_transcriptome__agilentg4502a_07_3__unc_edu__Level_3__unc_lowess_normalization_gene_level__data", #Archives.StandardData
              "Merge_transcriptome__ht_hg_u133a__broad_mit_edu__Level_2__probeset_rma__data", #Archives.StandardData
              "Merge_transcriptome__ht_hg_u133a__broad_mit_edu__Level_3__gene_rma__data", #Archives.StandardData
              "Methylation_Preprocess", #Archives.StandardData
              "miRseq_Mature_Preprocess", #Archives.StandardData
              "miRseq_Preprocess", #Archives.StandardData
              "mRNA_Preprocess_Median", #Archives.StandardData
              "mRNAseq_Preprocess", #Archives.StandardData
              "Mutation_Packager_Calls", #Archives.StandardData
              "Mutation_Packager_Coverage", #Archives.StandardData
              "RPPA_AnnotateWithGene" #Archives.StandardData
              )

tools = cbind(replicate(4, rep(F, length(all_tools))))
tools[1:2, 1] = T
tools[3:6, 2] = T
tools[7:10, 3] = T
tools[11:78, 4] = T
rownames(tools) = all_tools
colnames(tools) = c("Samples.miRSeq",
                    "Analyses.Mutation.MAF",
                    "Analyses.Mutation.SMG",
                    "Archives.StandardData")


# protocols ---------------------------------------------------------------

all_protocols = c("RPKM", #Samples.mRNASeq
                  "RSEM", #Samples.mRNASeq
                  "birdseed_genotype", #Archives.StandardData
                  "exon_expression", #Archives.StandardData
                  "exon_quantification", #Archives.StandardData
                  "gene_expression", #Archives.StandardData
                  "gene_rma", #Archives.StandardData
                  "junction_quantification", #Archives.StandardData
                  "miR_gene_expression", #Archives.StandardData
                  "miR_isoform_expression", #Archives.StandardData
                  "probeset_rma", #Archives.StandardData
                  "protein_normalization", #Archives.StandardData
                  "quantile_normalization_exon", #Archives.StandardData
                  "quantile_normalization_gene", #Archives.StandardData
                  "RSEM_genes", #Archives.StandardData
                  "RSEM_genes_normalized", #Archives.StandardData
                  "RSEM_isoforms_normalized", #Archives.StandardData
                  "segmentation", #Archives.StandardData
                  "segmentation_data_computation", #Archives.StandardData
                  "segmented_as_firma", #Archives.StandardData
                  "segmented_cna", #Archives.StandardData
                  "segmented_cnv", #Archives.StandardData
                  "segmented_loh", #Archives.StandardData
                  "segmented_scna_hg18", #Archives.StandardData
                  "segmented_scna_hg19", #Archives.StandardData
                  "segmented_scna_minus_germline_cnv_hg18", #Archives.StandardData
                  "segmented_scna_minus_germline_cnv_hg19", #Archives.StandardData
                  "splice_junction_expression", #Archives.StandardData
                  "unc_DWD_Batch_adjusted", #Archives.StandardData
                  "unc_lowess_normalization_gene_level", #Archives.StandardData
                  "unc_lowess_normalization_probe_level", #Archives.StandardData
                  "within_bioassay_data_set_function"#Archives.StandardData
                  )

protocols = cbind(replicate(2, rep(F, length(all_protocols))))
tools[1:2, 1] = T
tools[3:32, 2] = T
rownames(protocols) = all_protocols
colnames(protocols) = c("Samples.mRNASeq",
                        "Archives.StandardData")


# Sample Types ------------------------------------------------------------

sample.Type = matrix(c("01", "Primary solid Tumor", "TP",
                       "02", "Recurrent Solid Tumor", "TR",
                       "03", "Primary Blood Derived Cancer - Peripheral Blood", "TB",
                       "04", "Recurrent Blood Derived Cancer - Bone Marrow", "TRBM",
                       "05", "Additional - New Primary", "TAP",
                       "06", "Metastatic", "TM",
                       "07", "Additional Metastatic", "TAM",
                       "08", "Human Tumor Original Cells", "THOC",
                       "09", "Primary Blood Derived Cancer - Bone Marrow", "TBM",
                       "10", "Blood Derived Normal", "NB",
                       "11", "Solid Tissue Normal", "NT",
                       "12", "Buccal Cell Normal", "NBC",
                       "13", "EBV Immortalized Normal", "NEBV",
                       "14", "Bone Marrow Normal", "NBM",
                       "20", "Control Analyte", "CELLC",
                       "40", "Recurrent Blood Derived Cancer - Peripheral Blood", "TRB",
                       "50", "Cell Lines", "CELL",
                       "60", "Primary Xenograft Tissue", "XP",
                       "61", "Cell Line Derived Xenograft Tissue", "XCL"),
                     ncol = 3, byrow = T)
colnames(sample.Type) = c("Code", "Definition", "Short.Letter.Code")
head(sample.Type)

# persist everything ------------------------------------------------------

devtools::use_data(sample.Type, data_types, tools, protocols, internal = F, overwrite = T)
