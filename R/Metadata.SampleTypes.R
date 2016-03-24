#' Return all TCGA sample type codes, both numeric and symbolic.
#' 
#' 
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.SampleTypes = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleTypes")
  ret = download.Data(url, format)

  return(ret)

}
