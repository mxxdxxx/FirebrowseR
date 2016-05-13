#' Retrieve mRNASeq data.
#' 
#' This service returns sample-level log2 mRNASeq expression values. Results may be filtered by gene, cohort, barcode, sample type or characterization protocol, but at least one gene must be supplied.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param gene Comma separated list of gene name(s). Multiple values are allowed .
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param tcga_participant_barcode Comma separated list of TCGA participant barcodes (e.g. TCGA-GF-A4EO). Multiple values are allowed .
#' @param sample_type Narrow search to one or more TCGA sample types from the scrollable list. Multiple values are allowed NB,NBC,NBM,NT,TAM,TAP,TB,TM,TP,TR.
#' @param protocol Narrow search to one or more sample characterization protocols from the scrollable list. Multiple values are allowed RPKM,RSEM. Default value is RSEM.  
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While tcga_participant_barcode,cohort,gene,protocol,sample_type are available. 
#' 
#' @export
Samples.mRNASeq = function(format = "json",
                             gene = "",
                             cohort = "",
                             tcga_participant_barcode = "",
                             sample_type = "",
                             protocol = "RSEM",
                             page = "1",
                             page_size = "250",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    sample_type = sample_type,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("gene")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Samples",
                    method = "mRNASeq")
  ret = download.Data(url, format, page)

  return(ret)

}
