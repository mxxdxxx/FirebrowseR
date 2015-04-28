#' Retrieve map of platform code(s) to platform name(s).
#'
#' By default this function returns a table of all of the technology platforms
#' used to sequence or characterize samples in TCGA--both their short platform
#' codes and full names. A subset of this table may be obtained by explicitly
#' specifying one or more platform codes.
#'
#' @param platform A platforms name.
#' @inheritParams Archives.StandardData
#'
#' @examples
#' format = "csv"
#' obj = Metadata.Platforms(format = format)
#'
#' format = "tsv"
#' obj = Metadata.Platforms(format = format)

#' platform = c("454", "ABI", "biotab")
#' obj = Metadata.Platforms(format = format,
#'                          platform = platform)
#'
#' @export
Metadata.Platforms = function(format = "csv",
                              platform = ""){

  parameters = list(format = format,
                    platform = platform)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Platforms")

  ret = download.Data(url, format, NULL)

  return(ret)
}
