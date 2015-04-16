#' Retrieve map of platform code(s) to platform name(s).
#'
#' To return a map of all available platform codes to platform names, exclude
#' the platform parameter. Otherwise, choose only the platforms you wish to be
#' included in the result.
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

  ret = download.Data(url, format)

  return(ret)
}
