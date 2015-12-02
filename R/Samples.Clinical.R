#' Retrieve TCGA CDEs verbatim, i.e. not normalized by Firehose.
#'
#' This service returns patient clinical data from TCGA, verbatim. It differs
#' from the Samples/Clinical_FH method by providing access to all TCGA CDEs in
#' their original form, not merely the subset of CDEs normalized by Firehose for
#' analyses. Results may be selected by disease cohort, patient barcode or CDE
#' name, but at least one cohort, barcode, or CDE must be provided. When
#' filtering by CDE note that only when a patient record contains one or more of
#' the selected CDEs will it be returned. Visit the Metadata/ClinicalNames api
#' function to see the entire list of TCGA CDEs that may be queried via this
#' method. For more information on how clinical data are processed, see our
#' pipeline documentation. \url{https://confluence.broadinstitute.org/display/GDAC/Documentation#Documentation-ClinicalPipeline}
#'
#' @param cde_name Retrieve results only for specified CDEs, per the
#' Metadata/ClinicalNames function
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#'
#' format = "json"
#' cohort = "COAD"
#' tcga_participant_barcode = ""
#' cde_name = ""
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Samples.Clinical(format = format,
#'                        cohort = cohort,
#'                        tcga_participant_barcode = tcga_participant_barcode,
#'                        cde_name = cde_name,
#'                        page = page,
#'                        page_size = page_size,
#'                        sort_by = sort_by)
#'
#' format = "csv"
#' obj = Samples.Clinical(format = format,
#'                        cohort = cohort,
#'                        tcga_participant_barcode = tcga_participant_barcode,
#'                        cde_name = cde_name,
#'                        page = page,
#'                        page_size = page_size,
#'                        sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Samples.Clinical = function(format = "csv",
                            cohort = "",
                            tcga_participant_barcode = "",
                            cde_name = "",
                            page = 1,
                            page_size = 250,
                            sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    cde_name = cde_name,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  to.Validate = c("cohort", "tcga_participant_barcode")
  validet.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters, invoker = "Samples", method = "ClinicalTier1")
  ret = download.Data(url, format, page)

  return(ret)
}
