#' Retrieve aggregated analysis features table.
#'
#' This service returns part or all of the so-called feature table; which
#' aggregates the most important findings across ALL pipelines in the GDAC
#' Firehose analysis workflow into a single table for simple access. For more
#' details please visit the online documentation (\url{https://confluence.broadinstitute.org/display/GDAC/Documentation/#Documentation-FeatureTable}).
#' Please note that the service is still undergoing experimental evaluation and
#' does not return JSON format.
#'
#' @param format Either \code{tsv} or \code{csv}, here \code{json} is not
#' possible, but comming soon.
#' @param column Comma separated list of which data columns/fields to return.
#' @inheritParams Samples.mRNASeq
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.FeatureTable = function(format = "csv",
                                     cohort = "",
                                     column = "",
                                     page = 1,
                                     page_size = 250){

  parameters = list(format = format,
                    cohort = cohort,
                    column = column,
                    page = page,
                    page_size = page_size)

  if(parameters[["format"]] == "json"){
    stop("Here json is not allowed, yet.")
  }
  parameters <<- parameters
  if(any(parameters[["column"]] != "")){
    stop("For version 1.1.5 the column parameter is not working, please don't use it")
  }

  to.Validate = c("cohort")
  validet.Parameters(params = parameters, to.Validate = to.Validate)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "FeatureTable")

  ret = download.Data(url, format, page)

  return(ret)
}
