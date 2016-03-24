#' Translate TCGA cohort abbreviations to full disease names.
#' 
#' By default this function returns a table containing all TCGA cohort abbreviations and their corresponding disease names.  A subset of that table may be obtained by explicitly specifying one or more cohort abbreviations.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' 
#' @export
Metadata.Cohorts = function(format = "json",
                             cohort = ""
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Cohorts")
  ret = download.Data(url, format)

  return(ret)

}
