#' Retrieve names of all TCGA clinical data elements (CDEs).
#'
#' Retrieve names of all patient-level clinical data elements (CDES) available
#' in TCGA, unioned across all disease cohorts. A CDE will be listed here only
#' when it has a value other than NA for at least 1 patient case in any disease
#' cohort. For more information on how these CDEs are processed see our pipeline
#' documentation.
#' \url{https://confluence.broadinstitute.org/display/GDAC/Documentation}
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' obj = Metadata.ClinicalNames(format = format)
#'
#' @export
Metadata.ClinicalNames = function(format = "csv"){

  parameters = list(format = format)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "ClinicalTier1")

  ret = download.Data(url, format, NULL)

  return(ret)
}
