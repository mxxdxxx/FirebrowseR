#' Retrieve sample counts.
#'
#' Returns the number of available samples, after applying submitted filter.
#'
#' @param totals Provide an extra column/element giving the total sum of
#' samples. Not implemented by API...
#' @inheritParams Archives.StandardData
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' date = "2015_02_04"
#' cohort = c("PRAD", "BRCA")
#' sample_type = ""
#' data_type = ""
#' totals = TRUE
#' obj = Metadata.Counts(format = format,
#'                                date = date,
#'                                cohort = cohort,
#'                                sample_type = sample_type,
#'                                data_type = data_type,
#'                                totals = totals)
#'
#' format = "tsv"
#' cohort = c("PRAD", "BRCA")
#' sample_type = "Tumor"
#' data_type = c("methylation", "maf")
#' totals = TRUE
#'
#' obj = Metadata.Counts(format = format,
#'                                date = date,
#'                                cohort = cohort,
#'                                sample_type = sample_type,
#'                                data_type = data_type,
#'                                totals = totals)
#'
#' @export
Metadata.Counts = function(format = "csv",
                                 date = "",
                                 cohort = "",
                                 sample_type = "",
                                 data_type = "",
                                 totals = T){

  if(totals == T)
    totals = "true"
  if(totals == F)
    totals = "false"

  parameters = list(format = format,
                    date = date,
                    cohort = cohort,
                    sample_type = sample_type,
                    data_type = data_type,
                    totals = totals)

  if(nchar(parameters[["date"]]) == 0) {
    stop("A date is always required. See MetadataDates()")
  }

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Counts")

  ret = download.Data(url, format)

  return(ret)
}
