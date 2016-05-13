#' Retrieve names of all columns in the mutation annotation files (MAFs) served by FireBrowse.
#' 
#' Retrieve the names of all columns in the mutation annotation files (MAFs) hosted by FireBrowse.  For more information on the mutation data, and how it is processed by Firehose, please consult the <a href="https://confluence.broadinstitute.org/display/GDAC/Documentation#Documentation-MutationPipelines">pipeline documentation</a>.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' 
#' @export
Metadata.MAFColNames = function(format = "json"
                             ){
                             
  parameters = list(format = format)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "MAFColNames")
  ret = download.Data(url, format)

  return(ret)

}
