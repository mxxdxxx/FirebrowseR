#' Retrieve list of Firehose standard data and analyses dates.
#'
#' Retrieve list of Firehose standard data and analyses dates.
#'
#' @inheritParams Archives.StandardData
#'
#' @examples
#' format = "csv"
#' obj = Metadata.Dates(format = format)
#'
#' format = "tsv"
#' obj = Metadata.Dates(format = format)
#'
#' @export
Metadata.Dates = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Dates")

  ret = download.Data(url, format)

  return(ret)
}
