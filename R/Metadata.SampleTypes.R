#' Return a sample type code to short letter code mapping.
#'
#' Return a sample type code to short letter code mapping.
#'
#' @inheritParams Archives.StandardData
#'
#' @examples
#' format = "csv"
#' obj = Metadata.SampleTypes(format = format)
#'
#' format = "tsv"
#' obj = Metadata.SampleTypes(format = format)
#'
#' @export
Metadata.SampleTypes = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(params = parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "SampleTypes")

  ret = download.Data(url, format, NULL)

  return(ret)
}
