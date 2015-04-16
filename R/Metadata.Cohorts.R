#' Retrieve map of cohort abbreviation(s) to cohort name(s).
#'
#' To return a map of all available cohort abbreviations to cohort names,
#' exclude the cohort parameter. Otherwise, choose only the cohort abbreviations
#' you wish to be included in the result.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' cohort = c("PRAD", "BRCA")
#'
#' obj = Metadata.Cohorts(format = format,
#'                        cohort = cohort)
#'
#' format = "tsv"
#' cohort = c("PRAD", "BRCA")
#'
#' obj = Metadata.Cohorts(format = format,
#'                        cohort = cohort)
#'
#' @export
Metadata.Cohorts = function(format = "csv",
                            cohort = ""){


  parameters = list(format = format,
                    cohort = cohort)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Cohorts")

  ret = download.Data(url, format)

  return(ret)
}
