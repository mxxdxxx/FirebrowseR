#' Retrieve all data by genes Gistic2 results.
#'
#' This service provides access to the Gistic2 all_data_by_genes.txt output
#' data. This data is a gene-level table of copy number values for all samples.
#' The returned copy number values are in units (copy number - 2) so that no
#' amplification or deletion is 0, genes with amplifications have positive
#' values, and genes with deletions are negative values. The data are converted
#' from marker level to gene level using the extreme method: a gene is assigned
#' the greatest amplification or the least deletion value among the markers it
#' covers. Results may be filtered by cohort, gene, or barcode, but at least one
#' gene OR barcode must be supplied.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' cohort = "PRAD"
#' gene = "PTEN"
#' tcga_participant_barcode = c("TCGA-J4-A67O", "TCGA-G9-6496")
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Analyses.CopyNumber.Genes.All(format = format,
#'                                 cohort = cohort,
#'                                 gene = gene,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' gene = ""
#' obj = Analyses.CopyNumber.Genes.All(format = format,
#'                                 cohort = cohort,
#'                                 gene = gene,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' format = "json"
#' obj = Analyses.CopyNumber.Genes.All(format = format,
#'                                 cohort = cohort,
#'                                 gene = gene,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.CopyNumber.Genes.All = function(format = "csv",
                                     cohort = "",
                                     gene = "",
                                     tcga_participant_barcode = "",
                                     page = 1,
                                     page_size = 250,
                                     sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    gene = gene,
                    tcga_participant_barcode = tcga_participant_barcode,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(is.null(parameters[["gene"]]) &
     is.null(parameters[["tcga_participant_barcode"]])){
    stop("One of the parameters 'gene' or 'tcga_participant_barcode', must be
         provided")
  }

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "CopyNumber/Genes/All")

  ret = download.Data(url, format)

  return(ret)
}
