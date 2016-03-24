#' Retrieve Significantly Mutated Genes (SMG).
#' 
#' This service provides a list of significantly mutated genes, as scored by MutSig.  It may be filtered by cohort, rank, gene, tool and/or Q-value threshold, but at least one cohort must be supplied.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param tool Narrow search to include only data/results produced by the selected Firehose tool. Multiple values are allowed MutSig2.0,MutSig2CV,MutSigCV. Default value is MutSig2CV.  
#' @param rank Number of significant genes to return.
#' @param gene Comma separated list of gene name(s). Multiple values are allowed .
#' @param q Only return results with Q-value &lt;= given threshold.
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is rank. While q,cohort,tool,gene,rank are available. 
#' 
#' @export
Analyses.Mutation.SMG = function(format = "json",
                             cohort = "",
                             tool = "MutSig2CV",
                             rank = "",
                             gene = "",
                             q = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "rank"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    tool = tool,
                    rank = rank,
                    gene = gene,
                    q = q,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("cohort")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Analyses",
                    method = "Mutation/SMG")
  ret = download.Data(url, format, page)

  return(ret)

}
