#' Retrieve names of all available clinical data elements (CDEs).
#'
#' Retrieve names of all available tier 1 clinical data elements (CDEs), unioned
#' across all disease cohorts and patients. For more information on how these
#' CDEs are processed see our pipeline documentation
#' \url{https://confluence.broadinstitute.org/display/GDAC/Documentation}
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' obj = Metadata.ClinicalTier1(format = format)
#'
#' format = "tsv"
#' obj = Metadata.ClinicalTier1(format = format)
#'
#' @export
Metadata.ClinicalTier1 = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "ClinicalTier1")

  ret = download.Data(url, format, NULL)

  return(ret)
}
