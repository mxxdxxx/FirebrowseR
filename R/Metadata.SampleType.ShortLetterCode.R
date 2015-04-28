#' Translate from sample type short letter code to numeric code.
#'
#' Translate a sample type short letter code (e.g. TP, TR, etc.) into its
#' numeric sample type code (e.g. 01, 02, etc.).
#'
#' @param short_letter_code Short Letter Code e.g. TP, TM, NB, ...
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' short_letter_code = c("TR", "TR")
#' obj = Metadata.SampleType.ShortLetterCode(format = format,
#' short_letter_code = short_letter_code)
#'
#' @export
Metadata.SampleType.ShortLetterCode = function(format = "csv",
                                               short_letter_code =""){

  parameters = list(format = format,
                    short_letter_code = short_letter_code)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/ShortLetterCode",
                    mass = T)

  ret = download.Data(url, format, NULL)

  return(ret)
}
