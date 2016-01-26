#' Retrieve mRNASeq data
#'
#' This service returns sample-level log2 mRNASeq expression values. Results may
#' be filtered by gene, cohort, barcode, sample type or characterization
#' protocol, but at least one gene OR barcode must be supplied.
#'
#' @param format A string identifying the data type returned. Using json
#' requires the jsonlite package. \code{json}, \code{csv} or \code{tsv} are
#' available. In this package \code{tsv} and \code{csv} are identical.
#' @param gene A character vector of gene symbols. At least one gene OR Barcode
#' is required.
#' @param cohort A character vector indicating the cohort to query,
#' empty string queries all cohorts. See \code{\link{Metadata.Cohorts}} for
#' available cohorts.
#' @param tcga_participant_barcode A character vector containing TCGA Barcodes.
#' Empty string returns all patients. Either one gene OR barcode is required.
#' @param sample_type A character vector indicating the sample types to query.
#' Empty string returns all types. See \code{\link{Metadata.SampleTypes}},
#' for available sample types.
#' @param protocol Should RSEM (default) or RPKM data be retrieved.
#' @param page Subset to be returned.
#' @param page_size Number of records per page, max. is 2000.
#' @param sort_by character indicating the to column which is used for sorting.
#'
#' @details For further information please see
#' \url{https://confluence.broadinstitute.org/display/GDAC/FAQ}
#'
#' @examples
#' format = "json"
#' gene = c("AKT3", "RB1", "MAP3K1")
#' cohort = "BRCA"
#' tcga_participant_barcode = ""
#' sample_type = "NT"
#' protocol = "RSEM"
#' page = 1
#' page_size = 250
#' sort_by = "gene"
#' obj = Samples.mRNASeq(format = format, gene, cohort, tcga_participant_barcode,
#'                           sample_type, protocol, page, page_size, sort_by)
#' # returns a list from json
#'
#' obj = Samples.mRNASeq(gene = c("TP53", "RUNX1"))
#' # returns a data frame, default
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Samples.mRNASeq = function(format = "csv",
                             gene = "",
                             cohort = "",
                             tcga_participant_barcode = "",
                             sample_type = "",
                             protocol = "RSEM",
                             page = 1,
                             page_size = 250,
                             sort_by = "gene"){

  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    sample_type = sample_type,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(is.null(parameters[["gene"]]) &
     is.null(parameters[["tcga_participant_barcode"]])){
    stop("One of the parameters 'gene' or 'tcga_participant_barcode', must be
         provided")
    }

  to.Validate = c("gene", "tcga_participant_barcode")
  validet.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters, invoker = "Samples", method = "mRNASeq")
  ret = download.Data(url, format, page)

  return(ret)
  }
