#' Retrieve all thresholded by genes Gistic2 results.
#' 
#' This service provides access to the Gistic2 all_thresholded_by_genes.txt output data. A gene-level table of discrete amplification and deletion indicators for all samples. A table value of 0 means no amplification or deletion above the threshold. Amplifications are positive numbers: 1 means amplification above the amplification threshold; 2 means amplifications larger to the arm level amplifications observed for the sample. Deletions are represented by negative table values: -1 represents deletion beyond the threshold; -2 means deletions greater than the minimum arm-level deletion observed for the sample. Results maybe filtered by cohort, gene or barcode, but at least one gene or barcode must be supplied.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param gene Comma separated list of gene name(s). Multiple values are allowed .
#' @param tcga_participant_barcode Comma separated list of TCGA participant barcodes (e.g. TCGA-GF-A4EO). Multiple values are allowed .
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 250.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While tcga_participant_barcode,cohort,gene are available. 
#' 
#' @export
Analyses.CopyNumber.Genes.Thresholded = function(format = "json",
                             cohort = "",
                             gene = "",
                             tcga_participant_barcode = "",
                             page = "1",
                             page_size = "250",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    gene = gene,
                    tcga_participant_barcode = tcga_participant_barcode,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("gene","tcga_participant_barcode")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Analyses",
                    method = "CopyNumber/Genes/Thresholded")
  ret = download.Data(url, format, page)

  return(ret)

}
