#' Simple way to discern whether API server is up and running
#' 
#' Returns a message to indicate that API (server) is up and running, or times out if not.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.HeartBeat = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "HeartBeat")
  ret = download.Data(url, format)

  return(ret)

}
