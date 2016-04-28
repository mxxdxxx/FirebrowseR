#' Retrieve aggregated analysis features table.
#' 
#' This service returns part or all of the so-called <strong>feature table</strong>; which aggregates the most important findings across ALL pipelines in the GDAC Firehose analysis workflow into a single table for simple access.  One feature table is created per disease cohort.  Results may be filtered by date or cohort, but at least 1 cohort must be specified here. For more details please visit the <a href=https://confluence.broadinstitute.org/display/GDAC/Documentation\#Documentation-FeatureTable>online documentation</a>.  Please note that the service is still undergoing experimental evaluation and does not return JSON format.
#'
#' @param format Format of result. Default value is tsv. While tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param date Select one or more date stamps. Multiple values are allowed 2016_01_28,2015_08_21,2015_04_02,2014_10_17. Default value is 2016_01_28.  
#' @param column Comma separated list of which data columns/fields to return. Multiple values are allowed .
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' 
#' @export
Analyses.FeatureTable = function(format = "tsv",
                             cohort = "",
                             date = "2016_01_28",
                             column = "",
                             page = "1",
                             page_size = "250"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    date = date,
                    column = column,
                    page = page,
                    page_size = page_size)
  to.Validate = c("cohort")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Analyses",
                    method = "FeatureTable")
  ret = download.Data(url, format, page)

  return(ret)

}
