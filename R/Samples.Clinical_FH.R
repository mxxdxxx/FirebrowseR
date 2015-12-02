#' Retrieve CDEs normalized by Firehose and selected for analyses.
#'
#' This service returns patient-level clinical data elements (CDEs) that have
#' been normalized by Firehose for use in analyses. Results may be selected by
#' disease cohort, patient barcode or CDE name, but at least one cohort, barcode
#' or CDE must be provided. When filtering by CDE note that only when a patient
#' record contains one or more of the selected CDEs will it be returned. Visit
#' this table of CDEs to see what's available for every disase cohort (\url{http://gdac.broadinstitute.org/runs/info/clinical});
#' for more information on how these CDEs are processed see our pipeline
#' documentation \url{https://confluence.broadinstitute.org/display/GDAC/Documentation#Documentation-ClinicalPipeline}
#'
#' @param fh_fh_cde_name Retrieve results only for the CDEs specified from the
#' scrollable list.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#'
#' format = "json"
#' cohort = "COAD"
#' tcga_participant_barcode = ""
#' fh_cde_name = ""
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Samples.Clinical_FH(format = format,
#'                           cohort = cohort,
#'                           tcga_participant_barcode = tcga_participant_barcode,
#'                           fh_cde_name = fh_cde_name,
#'                           page = page,
#'                           page_size = page_size,
#'                           sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Samples.Clinical_FH = function(format = "csv",
                            cohort = "",
                            tcga_participant_barcode = "",
                            fh_cde_name = "",
                            page = 1,
                            page_size = 250,
                            sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    fh_cde_name = fh_cde_name,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  to.Validate = c("cohort", "tcga_participant_barcode")
  validet.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters, invoker = "Samples", method = "ClinicalTier1")
  ret = download.Data(url, format, page)

  return(ret)
}
