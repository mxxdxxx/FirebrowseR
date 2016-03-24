#' Translate from symbolic to numeric TCGA sample codes.
#' 
#' Convert a TCGA sample type code in symbolic form (or 'short letter code' like TP, TR) to its corresponding numeric form (e.g. 01, 02).
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param short_letter_code TCGA sample type short letter code(s) (e.g. TP, NB, etc.).  Multiple values are allowed TP,TB,TAM,TBM,NBC,CELLC,TRB,TR,TRBM,TAP,TM,THOC,NB,NT,NEBV,NBM,CELL,XP,XCL.
#' 
#' @export
Metadata.SampleType.ShortLetterCode = function(format = "json",
                             short_letter_code = ""
                             ){
                             
  parameters = list(format = format,
                    short_letter_code = short_letter_code)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/ShortLetterCode",
                    mass = T)
  ret = download.Data(url, format)

  return(ret)

}
