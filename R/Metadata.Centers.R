#' Retrieve map of center name(s) to display name(s).
#'
#' To return a map of all available centers to display names, exclude the center
#' parameter. Otherwise, choose only the centers you wish to be included in the
#' result.
#'
#' @param center A center name.
#' @inheritParams Archives.StandardData
#'
#' @examples
#' format = "csv"
#' center = c("intgen.org", "jhu-usc.edu")
#' obj = Metadata.Centers(format = format, center = center)
#'
#' @export
Metadata.Centers = function(format = "csv",
                          center = ""){

  parameters = list(format = format,
                    center = center)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Centers")

  ret = download.Data(url, format)

  return(ret)
}
