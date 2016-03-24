#' Retrieve Gistic2 significantly amplified genes results.
#' 
#' This service provides access to the Gistic2 amp_genes.conf_99.txt output data.  At least 1 gene or cohort must be supplied.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param gene Comma separated list of gene name(s). Multiple values are allowed .
#' @param q Only return results with Q-value &lt;= given threshold.
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While q,cohort,gene are available. 
#' 
#' @export
Analyses.CopyNumber.Genes.Amplified = function(format = "json",
                             cohort = "",
                             gene = "",
                             q = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    gene = gene,
                    q = q,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("cohort","gene")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Analyses",
                    method = "CopyNumber/Genes/Amplified")
  ret = download.Data(url, format, page)

  return(ret)

}
