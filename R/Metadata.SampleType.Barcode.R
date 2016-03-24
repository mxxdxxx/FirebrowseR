#' Given a TCGA barcode, return its short letter sample type code.
#' 
#' 
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param TCGA_Barcode Enter a single TCGA barcode, of any form: e.g. TCGA-GF-A4EO-06 or TCGA-EL-A3D5-01A-22D-A202-08
#' 
#' @export
Metadata.SampleType.Barcode = function(format = "json",
                             TCGA_Barcode = ""
                             ){
                             
  parameters = list(format = format,
                    TCGA_Barcode = TCGA_Barcode)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/Barcode",
                    mass = T)
  ret = download.Data(url, format)

  return(ret)

}
