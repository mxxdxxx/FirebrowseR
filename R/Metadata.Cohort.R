#' Retrieve cohort description.
#'
#' In this client, the function does, exactly the same as
#' \code{\link{Metadata.Cohorts}}. It just differs within the internal
#' implentation. Maybe, depending on the API, this will change.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' cohort = c("PRAD", "BRCA")
#'
#' obj = Metadata.Cohort(format = format,
#'                        cohort = cohort)
#'
#' format = "tsv"
#' cohort = c("PRAD", "BRCA")
#'
#' obj = Metadata.Cohort(format = format,
#'                        cohort = cohort)
#' @export
Metadata.Cohort = function(format = "csv",
                            cohort = ""){


  parameters = list(format = format,
                    cohort = cohort)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Cohort",
                    mass = T)

  ret = download.Data(url, format)

  return(ret)
}
