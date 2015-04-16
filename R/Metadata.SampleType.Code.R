#' Translate from numeric sample type code to short letter code.
#'
#' Translate a numeric sample type code (e.g. 01, 02, etc.) into its short
#' letter code (e.g. TP, TR, etc.).
#'
#' @param code Sample type codes.
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' code = c(50, 60)
#' obj = Metadata.SampleType.Code(format = format, code = code)
#'
#' @export
Metadata.SampleType.Code = function(format = "csv",
                                    code = ""){

  parameters = list(format = format,
                    code = code)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/Code",
                    mass = T)

  ret = download.Data(url, format)

  return(ret)
}
