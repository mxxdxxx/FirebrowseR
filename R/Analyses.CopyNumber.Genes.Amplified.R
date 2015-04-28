#' Retrieve Gistic2 significantly amplified genes results.
#'
#' This service provides access to the Gistic2 amp_genes.conf_99.txt output
#' data. At least 1 gene or cohort must be supplied.
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
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  to.Validate = c("gene", "cohort")
  validet.Parameters(params = parameters, to.Validate = to.Validate)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "CopyNumber/Genes/Amplified")

  ret = download.Data(url, format, page)

  return(ret)
  }
