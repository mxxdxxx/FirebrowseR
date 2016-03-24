#' Retrieve names of all TCGA clinical data elements (CDEs).
#' 
#' Retrieve names of all patient-level clinical data elements (CDES) available in TCGA, unioned across all disease cohorts. A CDE will be listed here only when it has a value other than NA for at least 1 patient case in any disease cohort. For more information on how these CDEs are processed see our <a href="https://confluence.broadinstitute.org/display/GDAC/Documentation">pipeline documentation</a>.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.ClinicalNames = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "ClinicalNames")
  ret = download.Data(url, format)

  return(ret)

}
