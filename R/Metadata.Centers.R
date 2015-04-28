#' Retrieve map of center name(s) to display name(s).
#'
#' By default this function returns a table of all consortium members in TCGA,
#' aka centers; it provides both the HTTP domain and full organizational name of
#' each center. A subset of this table may be obtained by explicitly specifying
#' one or more domain names.
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

  ret = download.Data(url, format, NULL)

  return(ret)
}
