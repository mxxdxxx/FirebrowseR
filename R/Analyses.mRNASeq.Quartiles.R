#' Returns RNASeq expression quartiles, e.g. suitable for drawing a boxplot.
#'
#' For a given gene compute quartiles and extrema, suitable e.g. for drawing a
#' boxplot (Tukey 1977). Results may be filtered by cohort, sample type, patient
#' barcode or characterization protocol, and are returned sorted by cohort. Note
#' that samples for which no expression value was recorded (e.g. the melanoma
#' sample TCGA-GN-262) are removed prior to calculation.
#'
#' @param Exclude Comma separated list of TCGA participants, identified by
#' barcodes such as TCGA-GF-A4EO, denoting samples to exclude from computation.
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "json"
#' gene = "PTEN"
#' cohort = ""
#' protocol = "RSEM"
#' sample_type = "tumors"
#' Exclude = ""
#'
#' obj = Analyses.mRNASeq.Quartiles(format = format,
#'                                  gene = gene,
#'                                  cohort = cohort,
#'                                  protocol = protocol,
#'                                  sample_type = sample_type,
#'                                  Exclude = Exclude)
#'
#' format = "tsv"
#' obj = Analyses.mRNASeq.Quartiles(format = format,
#'                                  gene = gene,
#'                                  cohort = cohort,
#'                                  protocol = protocol,
#'                                  sample_type = sample_type,
#'                                  Exclude = Exclude)
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Analyses.mRNASeq.Quartiles = function(format = "csv",
                                      gene = "",
                                      cohort = "",
                                      protocol = "RSEM",
                                      sample_type = "tumors",
                                      Exclude = ""){

  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    protocol = protocol,
                    sample_type = sample_type,
                    Exclude = Exclude)


  to.Validate = c("gene")
  validet.Parameters(params = parameters, to.Validate = to.Validate)
  url = build.Query(parameters = parameters, invoker = "Analyses", method = "mRNASeq/Quartiles")

  ret = download.Data(url, format, NULL)

  return(ret)
}
