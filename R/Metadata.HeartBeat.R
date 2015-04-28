#' Simple way to discern whether API server is up and running
#'
#' Returns a message to indicate that API (server) is up and running, or times
#' out if not.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' obj = Metadata.HeartBeat(format = format)
#'
#' @export
Metadata.HeartBeat = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "HeartBeat")

  ret = download.Data(url, format, NULL)

  return(ret)
}
