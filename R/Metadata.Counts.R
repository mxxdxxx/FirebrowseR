#' Retrieve sample counts.
#'
#' Returns the aliquot counts for each disease cohort, per sample type and data
#' type. The sample type designation of "Tumor" may be used to aggregate the
#' count of all tumor aliquots into a single number per disease and data type.
#' See the SampleTypes function for a complete description of sample types.
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


  to.Validate = c("date")
  validet.Parameters(params = parameters, to.Validate = to.Validate)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Counts")

  ret = download.Data(url, format, NULL)

  return(ret)
}
