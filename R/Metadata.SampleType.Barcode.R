#' Return a sample type code to short letter code mapping.
#'
#' Return a sample type code to short letter code mapping.
#' This method only returns the first barcode, so just use one.
#'
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "csv"
#' tcga_participant_barcode = c("TCGA-GF-A4EO-06",
#'                              "TCGA-EL-A3D5-01A-22D-A202-08")
#' obj = Metadata.SampleType.Barcode(format = format,
#'                                   tcga_participant_barcode = tcga_participant_barcode)
#'
#' @export
Metadata.SampleType.Barcode = function(format = "csv",
                                       tcga_participant_barcode = ""){

  parameters = list(format = format,
                    tcga_participant_barcode = tcga_participant_barcode)

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "SampleType/Barcode",
                    mass = T)

  ret = download.Data(url, format, NULL)

  return(ret)
}
