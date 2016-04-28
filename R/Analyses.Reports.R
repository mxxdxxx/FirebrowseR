#' Retrieve links to summary reports from Firehose analysis runs.
#' 
#' This service returns URLs to the analysis result reports for runs of the Broad Institute GDAC Firehose analysis pipeline. At least one year of run reports are maintained in the database, but the reports from the latest run will be returned by default. The set of <a href="https://confluence.broadinstitute.org/display/GDAC/Nozzle">Nozzle</a> reports returned may be filtered by disease cohort, report type and report name.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param date Select one or more date stamps. Multiple values are allowed 2016_01_28,2015_08_21,2015_04_02,2014_10_17,2014_07_15,2014_04_16,2014_01_15,2013_09_23,2013_05_23,2013_04_21. Default value is 2016_01_28.  
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param name Narrow search to one or more report names. Multiple values are allowed Aggregate_AnalysisFeatures,CopyNumber_Clustering_CNMF,CopyNumber_Clustering_CNMF_thresholded,CopyNumber_Gistic2,CopyNumberLowPass_Gistic2,Correlate_Clinical_vs_CopyNumber_Arm,Correlate_Clinical_vs_CopyNumber_Focal,Correlate_Clinical_vs_Methylation,Correlate_Clinical_vs_miR,Correlate_Clinical_vs_miRseq,Correlate_Clinical_vs_Molecular_Subtypes,Correlate_Clinical_vs_mRNA,Correlate_Clinical_vs_mRNAseq,Correlate_Clinical_vs_Mutation,Correlate_Clinical_vs_Mutation_APOBEC_Categorical,Correlate_Clinical_vs_Mutation_APOBEC_Continuous,Correlate_Clinical_vs_MutationRate,Correlate_Clinical_vs_RPPA,Correlate_CopyNumber_vs_miR,Correlate_CopyNumber_vs_mRNA,Correlate_CopyNumber_vs_mRNAseq,Correlate_Methylation_vs_mRNA,Correlate_molecularSubtype_vs_CopyNumber_Arm,Correlate_molecularSubtype_vs_CopyNumber_Focal,Correlate_molecularSubtype_vs_Mutation,Correlate_mRNAseq_vs_Mutation_APOBEC,Methylation_Clustering_CNMF,miR_Clustering_CNMF,miR_Clustering_Consensus,miR_Clustering_Consensus_Plus,miR_FindDirectTargets,miRseq_Clustering_CNMF,miRseq_Clustering_Consensus,miRseq_Clustering_Consensus_Plus,miRseq_FindDirectTargets,miRseq_Mature_Clustering_CNMF,miRseq_Mature_Clustering_Consensus,miRseq_Mature_Clustering_Consensus_Plus,mRNA_Clustering_CNMF,mRNA_Clustering_Consensus,mRNA_Clustering_Consensus_Plus,mRNAseq_Clustering_CNMF,mRNAseq_Clustering_Consensus,mRNAseq_Clustering_Consensus_Plus,Mutation_APOBEC,Mutation_Assessor,Mutation_CHASM,MutSig2.0,MutSig2CV,MutSigCV,MutSigNozzleReport1.5,MutSigNozzleReport2.0,MutSigNozzleReport2CV,MutSigNozzleReportCV,MutSigNozzleReportMerged,Pathway_FindEnrichedGenes,Pathway_GSEA_mRNAseq,Pathway_Hotnet,Pathway_Overlaps_MSigDB_MutSig2CV,Pathway_Paradigm_mRNA,Pathway_Paradigm_mRNA_And_Copy_Number,Pathway_Paradigm_RNASeq,Pathway_Paradigm_RNASeq_And_Copy_Number,RPPA_Clustering_CNMF,RPPA_Clustering_Consensus,RPPA_Clustering_Consensus_Plus.
#' @param type Narrow search to one or more report types. Multiple values are allowed Aggregate,Clustering,CopyNumber,Correlations,Expression,Mutation,Pathway.
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is date. While date,cohort,type,name are available. 
#' 
#' @export
Analyses.Reports = function(format = "json",
                             date = "2016_01_28",
                             cohort = "",
                             name = "",
                             type = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "date"
                             ){
                             
  parameters = list(format = format,
                    date = date,
                    cohort = cohort,
                    name = name,
                    type = type,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Analyses",
                    method = "Reports")
  ret = download.Data(url, format, page)

  return(ret)

}
