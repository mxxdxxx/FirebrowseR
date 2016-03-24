#' Retrieve TCGA CDEs verbatim, i.e. not normalized by Firehose.
#' 
#' This service returns patient clinical data from TCGA, verbatim. It differs from the Samples/Clinical_FH method by providing access to all TCGA CDEs in their original form, not merely the subset of CDEs normalized by Firehose for analyses.  Results may be selected by disease cohort, patient barcode or CDE name, but at least one cohort, barcode, or CDE must be provided. When filtering by CDE note that only when a patient record contains one or more of the selected CDEs will it be returned. Visit the Metadata/ClinicalNames api function to see the entire list of TCGA CDEs that may be queried via this method. For more information on how clinical data are processed, see our <a href="https://confluence.broadinstitute.org/display/GDAC/Documentation#Documentation-ClinicalPipeline">pipeline documentation</a>.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param tcga_participant_barcode Comma separated list of TCGA participant barcodes (e.g. TCGA-GF-A4EO). Multiple values are allowed .
#' @param cde_name Retrieve results only for specified CDEs, per the Metadata/ClinicalNames function Multiple values are allowed .
#' @param page Which page (slice) of entire results set should be returned.  Multiple values are allowed . Default value is 1.  
#' @param page_size Number of records per page of results.  Max is 2000. Multiple values are allowed . Default value is 150.  
#' @param sort_by Which column in the results should be used for sorting paginated results? Default value is cohort. While tcga_participant_barcode,cohort,cde_name are available. 
#' 
#' @export
Samples.Clinical = function(format = "json",
                             cohort = "",
                             tcga_participant_barcode = "",
                             cde_name = "",
                             page = "1",
                             page_size = "150",
                             sort_by = "cohort"
                             ){
                             
  parameters = list(format = format,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    cde_name = cde_name,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  to.Validate = c("cohort","tcga_participant_barcode","cde_name")
  validate.Parameters(params = parameters, to.Validate = to.Validate)

  url = build.Query(parameters = parameters,
                    invoker = "Samples",
                    method = "Clinical")
  ret = download.Data(url, format, page)

  return(ret)

}
