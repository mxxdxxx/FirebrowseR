#' Retrieve list of all TCGA patients.
#' 
#' This service returns a list of all TCGA patient barcodes in FireBrowse, optionally filtered by disease cohort.  The barcodes are obtained directy from the clinical data.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While cohort are available. 
#' 
#' @export
Metadata.Patients = function(format = "json",
                             cohort = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Patients")
  ret = download.Data(url, format, page)

  return(ret)

}
