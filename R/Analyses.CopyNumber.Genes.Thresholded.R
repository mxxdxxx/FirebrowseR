#' Retrieve all thresholded by genes Gistic2 results.
#'
#' This service provides access to the Gistic2 all_thresholded_by_genes.txt
#' output data. A gene-level table of discrete amplification and deletion
#' indicators for all samples. A table value of 0 means no amplification or
#' deletion above the threshold. Amplifications are positive numbers: 1 means
#' amplification above the amplification threshold; 2 means amplifications
#' larger to the arm level amplifications observed for the sample. Deletions are
#' represented by negative table values: -1 represents deletion beyond the
#' threshold; -2 means deletions greater than the minimum arm-level deletion
#' observed for the sample. Results maybe filtered by cohort, gene or barcode,
#' but at least one gene OR barcode must be supplied.
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
#' obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
#'                                 cohort = cohort,
#'                                 gene = gene,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' gene = ""
#' obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
#'                                 cohort = cohort,
#'                                 gene = gene,
#'                                 tcga_participant_barcode = tcga_participant_barcode,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' format = "json"
#' obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
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
Analyses.CopyNumber.Genes.Thresholded = function(format = "csv",
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
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "CopyNumber/Genes/Thresholded")

  ret = download.Data(url, format)

  return(ret)
}
