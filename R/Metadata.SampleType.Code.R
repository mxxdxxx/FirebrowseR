#' Translate from numeric to symbolic TCGA sample codes.
#' 
#' Convert a TCGA numeric sample type code (e.g. 01, 02) to its corresponding symbolic (short letter) code (e.g. TP, TR).
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param code Narrow search to one or more TCGA sample type codes. Multiple values are allowed 01,03,07,09,12,20,40,02,04,05,06,08,10,11,13,14,50,60,61.
#' 
#' @export
Metadata.SampleType.Code = function(format = "json",
                             code = ""
                             ){
                             
  parameters = list(format = format,
                    code = code)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/Code",
                    mass = T)
  ret = download.Data(url, format)

  return(ret)

}
