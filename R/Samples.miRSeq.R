#' Retrieve miRSeq data.
#' 
#' This service returns sample-level log2 miRSeq expression values. Results may be filtered by miR, cohort, barcode, sample type or Firehose preprocessing tool, but at least one miR must be supplied.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param mir Comma separated list of miR names (e.g. hsa-let-7b-5p,hsa-let-7a-1). Multiple values are allowed .
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param tcga_participant_barcode Comma separated list of TCGA participant barcodes (e.g. TCGA-GF-A4EO). Multiple values are allowed .
#' @param tool Narrow search to include only data/results produced by the selected Firehose tool. Multiple values are allowed miRseq_Mature_Preprocess,miRseq_Preprocess. Default value is miRseq_Mature_Preprocess.  
#' @param sample_type Narrow search to one or more TCGA sample types from the scrollable list. Multiple values are allowed NB,NBC,NBM,NT,TAM,TAP,TB,TM,TP,TR.
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While tcga_participant_barcode,cohort,tool,mir,sample_type are available. 
#' 
#' @export
Samples.miRSeq = function(format = "json",
                             mir = "",
                             cohort = "",
                             tcga_participant_barcode = "",
                             tool = "miRseq_Mature_Preprocess",
                             sample_type = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    mir = mir,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    tool = tool,
                    sample_type = sample_type,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("mir")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Samples",
                    method = "miRSeq")
  ret = download.Data(url, format, page)

  return(ret)

}
