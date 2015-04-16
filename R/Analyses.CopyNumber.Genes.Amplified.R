#' Retrieve Gistic2 significantly amplified genes results.
#'
#' This service provides access to the Gistic2 amp_genes.conf_99.txt output
#' data.
#'
#' @inheritParams Analyses.CopyNumber.Genes.All
#' @inheritParams Analyses.Mutation.SMG
#'
#' @examples
#' format = "csv"
#' cohort = ""
#' gene = "PTEN"
#' q = 0.05
#' page = 1
#' page_size = 250
#' sort_by = "cohort"
#'
#' obj = Analyses.CopyNumber.Genes.Amplified(format = format,
#'                                                 cohort = cohort,
#'                                                 gene = gene,
#'                                                 q = q,
#'                                                 page = page,
#'                                                 page_size = page_size,
#'                                                 sort_by = sort_by)
#'
#' gene = "PFN3"
#' obj = Analyses.CopyNumber.Genes.Amplified(format = format,
#'                                                 cohort = cohort,
#'                                                 gene = gene,
#'                                                 q = q,
#'                                                 page = page,
#'                                                 page_size = page_size,
#'                                                 sort_by = sort_by)
#'
#' format = "json"
#' obj = Analyses.CopyNumber.Genes.Amplified(format = format,
#'                                                 cohort = cohort,
#'                                                 gene = gene,
#'                                                 q = q,
#'                                                 page = page,
#'                                                 page_size = page_size,
#'                                                 sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.CopyNumber.Genes.Amplified = function(format = "csv",
                                                   cohort = "",
                                                   gene = "",
                                                   q = "",
                                                   page = 1,
                                                   page_size = 250,
                                                   sort_by = "cohort"){

  parameters = list(format = format,
                    cohort = cohort,
                    gene = gene,
                    q = q,
                    q = q,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(is.null(parameters[["format"]])){
    stop("At least the format needs to be provided.")
  }

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "CopyNumber/Genes/Amplified")

  ret = download.Data(url, format)

  return(ret)
  }
