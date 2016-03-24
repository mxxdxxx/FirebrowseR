#' Retrieve names of CDEs normalized by Firehose and selected for analyses.
#' 
#' This service returns the names of patient-level clinical data elements (CDEs) that have been normalized by Firehose for use in analyses, unioned across all disease cohorts. For more information on how these CDEs are processed, see our <a href="https://confluence.broadinstitute.org/display/GDAC/Documentation">pipeline documentation</a>.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.ClinicalNames_FH = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "ClinicalNames_FH")
  ret = download.Data(url, format)

  return(ret)

}
