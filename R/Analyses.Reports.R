#' Retrieve nozzle report links
#'
#' This service returns the nozzle report urls for our Firehose analyses runs.
#' The reports can be filtered based on run date, cohort, report type, and
#' report name.
#'
#' @param date Narrow search to one or more Firehose run date stamps. For a list
#' of available dates see \code{\link{Metadata.Dates}}
#' @param name One or more report names. Please visit
#' \url{http://firebrowse.org/api-docs/#!/Analyses/Reports} for details.
#' Currently there is no API call listing all names.
#' @param type One or more report types. Please visit
#' \url{http://firebrowse.org/api-docs/#!/Analyses/Reports} for details.
#' Currently there is no API call listing all types.
#' @inheritParams Samples.mRNASeq
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.Reports = function(format = "tsv",
                                date = "",
                                cohort = "",
                                name = "",
                                type = "",
                                page = 1,
                                page_size = 250,
                                sort_by = "date"){

  parameters = list(format = format,
                    date = date,
                    cohort = cohort,
                    name = name,
                    type = type,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(is.null(parameters[["format"]])){
    stop("At least the format needs to be provided.")
  }

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "Reports")

  ret = download.Data(url, format, page)

  return(ret)
}
