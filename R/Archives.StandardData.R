#' Retrieve standard data archives.
#'
#' This service returns the archive URLs for our Firehose standard data runs,
#' providing a RESTful interface similar in spirit to the command line
#' firehose_get tool. The archives can be filtered based on date, cohort, data
#' type, platform, center, data level, and protocol.
#'
#' @param level choose data level from 1-4.
#' @param data_type Narrow search to one or more TCGA data types. Available data
#' types are provided by the data frame \code{data_types}.
#' @param tool Narrow search to include only data/results produced by the selected
#' Firehose tool.  Available tools are provided in the data frame \code{tools}.
#' @param protocol Narrow search to one or more sample characterization
#' protocols, see \code{protocols} data.frame for available protocols.
#' @inheritParams Metadata.Platforms
#' @inheritParams Samples.mRNASeq
#' @inheritParams Analyses.Reports
#' @inheritParams Metadata.Platforms
#' @inheritParams Metadata.Centers
#'
#' @details
#' \code{data_type}m \code{tool} and \code{protocol} are hard coded, since the
#' API provides no methods to query them. Therefor, and to keep always up to
#' date, you may consider looking at the website
#' \url{http://firebrowse.org/api-docs/} for all available data types.
#'
#' @examples
#' format = "tsv"
#' date = "2014_12_06"
#' cohort = "BRCA"
#' data_type = "CopyNumber"
#' level = 3
#' page = 1
#' page_size = 250
#'
#' obj = Archives.StandardData(format = format,
#'                                 date = date,
#'                                 cohort = cohort,
#'                                 data_type = data_type,
#'                                 level = level,
#'                                 page = page,
#'                                 page_size = page_size)
#'
#' cohort = "PRAD"
#' data_type = "MAF"
#' level = 3
#' obj = Archives.StandardData(format = format,
#'                                 date = date,
#'                                 cohort = cohort,
#'                                 data_type = data_type,
#'                                 level = level,
#'                                 page = page,
#'                                 page_size = page_size)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Archives.StandardData = function(format = "tsv",
                                     date = "",
                                     cohort = "",
                                     data_type = "",
                                     tool = "",
                                     platform = "",
                                     center = "",
                                     level = "",
                                     protocol = "",
                                     page = 1,
                                     page_size = 250,
                                     sort_by = "cohort"){

  parameters = list(format = format,
                    date = date,
                    cohort = cohort,
                    data_type = data_type,
                    tool = tool,
                    platform = platform,
                    center = center,
                    level = level,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(nchar(parameters[["date"]]) == 0) {
    stop("A date is always required. See MetadataDates()")
  }
  #if(parameters[["format"]] == "csv") {
  #  stop("csv is currently not supported by that function.")
  #}

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Archives", method = "StandardData")

  ret = download.Data(url, format)

  return(ret)
  }
