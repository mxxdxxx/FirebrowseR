#' Retrieve clinical pick tier 1 data.
#'
#' This service returns patient-level tier 1 clinical data elements (CDEs).
#' Results may be filtered by disease cohort, patient barcode or CDE name. When
#' filtering by CDE note that only when a patient record contains one or more of
#' the selected CDEs will it be returned. For more information on how these CDEs
#' are processed see our pipeline documentation \url{https://confluence.broadinstitute.org/display/GDAC/Documentation#Documentation-ClinicalPipeline}.
#'
#' @param tier1_cde_name A character vector containing the CDEs which should be
#' used for subsetting. To view all CDEs see
#' \code{\link{Metadata.ClinicalTier1}}.
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "json"
#' cohort = ""
#' tcga_participant_barcode = ""
#' tier1_cde_name = ""
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Samples.ClinicalTier1(format = format,
#'                                 cohort = cohort,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 tier1_cde_name = tier1_cde_name,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' format = "csv"
#' obj = Samples.ClinicalTier1(format = format,
#'                                 cohort = cohort,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 tier1_cde_name = tier1_cde_name,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' tcga_participant_barcode = "TCGA-GF-A4EO"
#' obj = Samples.ClinicalTier1(format = "tsv",
#'                                 cohort = cohort,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 tier1_cde_name = tier1_cde_name,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Samples.ClinicalTier1 = function(format = "csv",
                              cohort = "",
                              tcga_participant_barcode = "",
                              tier1_cde_name = "",
                              page = 1,
                              page_size = 250,
                              sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    tier1_cde_name = tier1_cde_name,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Samples", method = "ClinicalTier1")
  ret = download.Data(url, format)

  return(ret)
}
