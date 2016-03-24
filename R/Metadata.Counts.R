#' Retrieve sample counts.
#' 
#' Returns the aliquot counts for each disease cohort, per sample type and data type.  The sample type designation of "Tumor" may be used to aggregate the count of all tumor aliquots into a single number per disease and data type. See the SampleTypes function for a complete description of sample types.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param date Select one or more date stamps. Multiple values are allowed 2016_01_28,2015_11_01,2015_08_21,2015_06_01,2015_04_02,2015_02_04,2014_12_06,2014_10_17,2014_09_02,2014_07_15,2014_05_18,2014_04_16,2014_03_16. Default value is 2016_01_28.  
#' @param cohort Narrow search to one or more TCGA disease cohorts from the scrollable list. Multiple values are allowed ACC,BLCA,BRCA,CESC,CHOL,COAD,COADREAD,DLBC,ESCA,FPPP,GBM,GBMLGG,HNSC,KICH,KIPAN,KIRC,KIRP,LAML,LGG,LIHC,LUAD,LUSC,MESO,OV,PAAD,PCPG,PRAD,READ,SARC,SKCM,STAD,STES,TGCT,THCA,THYM,UCEC,UCS,UVM.
#' @param sample_type Narrow search to one or more TCGA sample types from the scrollable list. Multiple values are allowed FFPE,NB,NBC,NBM,NT,TAM,TAP,TB,TM,TP,TR,Tumor.
#' @param data_type Narrow search to one or more TCGA data types from the scrollable list. Multiple values are allowed bcr,clinical,cn,lowp,methylation,mrna,mrnaseq,mir,mirseq,rppa,maf,rawmaf.
#' @param totals Output an entry providing the totals for each data type. Default value is TRUE. While  are available. 
#' 
#' @export
Metadata.Counts = function(format = "json",
                             date = "2016_01_28",
                             cohort = "",
                             sample_type = "",
                             data_type = "",
                             totals = "TRUE"
                             ){
                             
  parameters = list(format = format,
                    date = date,
                    cohort = cohort,
                    sample_type = sample_type,
                    data_type = data_type,
                    totals = totals)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Counts")
  ret = download.Data(url, format)

  return(ret)

}
