#' Retrieve names of CDEs normalized by Firehose and selected for analyses
#'
#' This service returns the names of patient-level clinical data elements (CDEs)
#' that have been normalized by Firehose for use in analyses, unioned across all
#' disease cohorts. For more information on how these CDEs are processed, see
#' our pipeline documentation.
#' \url{https://confluence.broadinstitute.org/display/GDAC/Documentation}
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' obj = Metadata.ClinicalNames_FH(format = format)
#'
#' @export
Metadata.ClinicalNames_FH = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "ClinicalTier1")

  ret = download.Data(url, format, NULL)

  return(ret)
}
