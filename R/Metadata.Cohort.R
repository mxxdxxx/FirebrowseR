#' Retrieve formal disease name(s) for cohort abbreviation(s).
#' 
#' 
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' 
#' @export
Metadata.Cohort = function(format = "json",
                             cohort = ""
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Cohort",
                    mass = T)
  ret = download.Data(url, format)

  return(ret)

}
