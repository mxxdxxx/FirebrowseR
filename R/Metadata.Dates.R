#' Retrieve datestamps of all GDAC Firehose standard data and analyses runs that have been ingested into FireBrowse.
#' 
#' 
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.Dates = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Dates")
  ret = download.Data(url, format)

  return(ret)

}
