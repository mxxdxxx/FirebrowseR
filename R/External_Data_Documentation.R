# Document everything -----------------------------------------------------

#' All Sample Types used by firehose
#'
#' Sample Types are used by firehose to label the tissue source. Internaly the
#' firhose uses just abbreviation like TP or NT or even just numbers.
#' This matrix deciphers all those abbreviation into human readable text
#'
#' @docType data
#' @keywords datasets
#' @name sample.Type
#' @usage data(sample.Type)
#' @source \url{https://tcga-data.nci.nih.gov/datareports/codeTablesReport.htm}
#' @format A matrix
NULL

#' data_types includes all available data types
#'
#' For two functions/queries (namely \code{archives_standard_data} and
#' \code{metadata_counts})a data_type, such as \code{miR} or \code{CopyNumber}
#' is required, but there is no API function listing all possible options. This
#' table indicates which function accepts which data type.
#' This table is hand curated, information are directly gathered from source
#' listed below
#'
#' @docType data
#' @keywords datasets
#' @name data_types
#' @usage data(data_types)
#' @source \url{http://firebrowse.org/api-docs/#!/Archives/StandardData}
#' @format A matrix
NULL

#' Indicates the tools argument take by some functions
#'
#' Just as the \code{data_types} matrix, the tools matrix indicates which
#' arguments are accepted by the four functions (function names corrospond to
#' column names). Also this table is hand curated and information are directly
#' taken from firehose Web-API.
#'
#' @source \url{http://firebrowse.org/api-docs/#!/Archives/StandardData}
#'
#' @docType data
#' @keywords datasets
#' @name tools
#' @usage data(tools)
#' @source \url{http://firebrowse.org/api-docs/#!/Archives/StandardData}
#' @format A matrix
NULL

#' Indicates the protocol argument take by some functions
#'
#' Just as the \code{data_types} matrix, the protocols matrix indicates which
#' arguments are accepted by the two functions (function names corrospond to
#' column names). Also this table is hand curated and information are directly
#' taken from firehose Web-API.
#'
#' @docType data
#' @keywords datasets
#' @name protocols
#' @usage data(protocols)
#' @source \url{http://firebrowse.org/api-docs/#!/Archives/StandardData}
#' @format A matrix
NULL
