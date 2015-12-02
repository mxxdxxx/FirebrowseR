#' Retrieve list of all TCGA patients.
#'
#' This service returns a list of all TCGA patient barcodes in FireBrowse,
#' optionally filtered by disease cohort. The barcodes are obtained directy from
#' the clinical data.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' cohort  = ""
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Metadata.Patients(format = format)
#'
#' @export
Metadata.Patients = function(format = "csv",
                             cohort  = "",
                             page = 1,
                             page_size = 250,
                             sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Metadata", method = "Patients")

  ret = download.Data(url, format, NULL)

  return(ret)
}
