#' Retrieve map of cohort abbreviation(s) to cohort name(s).
#'
#' By default this function returns a table containing all TCGA cohort
#' abbreviations and their corresponding disease names. A subset of that table
#' may be obtained by explicitly specifying one or more cohort abbreviations.
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

  ret = download.Data(url, format, NULL)

  return(ret)
}
