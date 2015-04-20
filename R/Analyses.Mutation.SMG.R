#' Retrieve Significantly Mutated Genes (SMG).
#'
#' This service provides a list of significantly mutated genes. It can be
#' filtered based on date, cohort, rank, gene, tool and/or Q-value threshold.
#'
#' @param rank Number of significant genes to return.
#' @param q Only return results with Q-value <= given threshold. For details
#' please see \url{https://www.broadinstitute.org/cancer/cga/mutsig}
#' @inheritParams Analyses.Mutation.MAF
#' @inheritParams Archives.StandardData
#'
#' @examples
#' format = "json"
#' cohort = "PRAD"
#' tool = "MutSig2CV"
#' rank = ""
#' gene = ""
#' q = "0.01"
#' page = 1
#' page_size = 250
#' sort_by = "q"
#'
#'
#' parameters = list(format = format,
#'                   cohort = cohort,
#'                   tool = tool,
#'                   rank = rank,
#'                   gene = gene,
#'                   q = q,
#'                   page = page,
#'                   page_size = page_size,
#'                   sort_by = sort_by)
#'
#' obj = Analyses.Mutation.SMG(format = format,
#'                                 cohort = cohort,
#'                                 tool = tool,
#'                                 rank = rank,
#'                                 gene = gene,
#'                                 q = q,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' format = "tsv"
#' obj = Analyses.Mutation.SMG(format = format,
#'                                 cohort = cohort,
#'                                 tool = tool,
#'                                 rank = rank,
#'                                 gene = gene,
#'                                 q = q,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' gene = c("TP53", "SPOP")
#' q = 0.05
#' obj = Analyses.Mutation.SMG(format = format,
#'                                 cohort = cohort,
#'                                 tool = tool,
#'                                 rank = rank,
#'                                 gene = gene,
#'                                 q = q,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#' gene = ""
#' obj = Analyses.Mutation.SMG(format = format,
#'                                 cohort = cohort,
#'                                 tool = tool,
#'                                 rank = rank,
#'                                 gene = gene,
#'                                 q = q,
#'                                 page = page,
#'                                 page_size = page_size,
#'                                 sort_by = sort_by)
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.Mutation.SMG = function(format = "tsv",
                                     cohort = "",
                                     tool = "MutSig2CV",
                                     rank = "",
                                     gene = "",
                                     q = "",
                                     page = 1,
                                     page_size = 250,
                                     sort_by = "q"){

  if(format=="csv")
    stop("Only 'tsv' or 'json' is allowed, see ?Analyses.Mutation.SMG for
         details")

  parameters = list(format = format,
                    cohort = cohort,
                    tool = tool,
                    rank = rank,
                    gene = gene,
                    q = q,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "Mutation/SMG")

  ret = download.Data(url, format)

  return(ret)
}