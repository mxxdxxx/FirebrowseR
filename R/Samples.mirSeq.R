#' Retrieve miRSeq data
#'
#' This service returns sample-level log2 miRSeq expression values. Results may
#' be filtered by miR, cohort, barcode, sample type or Firehose preprocessing
#' tool, but at least one miR OR barcode must be supplied.
#'
#' @param mir A character vector of miR names. At least one miR or barcode is
#' required.
#' @param tool The tool used to run the anylses, either
#' \code{miRseq_Mature_Preprocess}  or \code{miRseq_Preprocess}
#' @inheritParams Samples.mRNASeq
#'
#' @examples
#' format = "json"
#' mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p","hsa-mir-221-3p",
#'         "hsa-mir-10b-5p","hsa-mir-608","hsa-mir-324-5p")
#' cohort = "BRCA"
#' tcga_participant_barcode = ""
#' tool = "miRseq_Mature_Preprocess"
#' sample_type = "NT"
#' page = 1
#' page_size = 250
#' sort_by = "mir"
#'
#' # Get results in json format/list
#' obj = Samples.miRSeq(format = format,
#'                         mir = mir,
#'                         cohort = cohort,
#'                         tcga_participant_barcode = tcga_participant_barcode,
#'                         tool = tool,
#'                         sample_type = sample_type,
#'                         page = page,
#'                         page_size = page_size,
#'                         sort_by = sort_by)
#'
#' # Nor as CSV
#' format = "csv"
#' mir = c("hsa-mir-1285-3p", "hsa-mir-125a-5p")
#' obj = Samples.miRSeq(format = format,
#'                         mir = mir,
#'                         cohort = cohort,
#'                         tcga_participant_barcode = tcga_participant_barcode,
#'                         tool = tool,
#'                         sample_type = sample_type,
#'                         page = page,
#'                         page_size = page_size,
#'                         sort_by = sort_by)
#'
#' # And just by miR IDs, without any other restrictions
#' obj = Samples.miRSeq(mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p"))
#'
#' @return A \code{list}, if format is \code{json}, elsewise a \code{data.frame}
#'
#' @export
Samples.miRSeq = function(format = "csv",
                               mir = "",
                               cohort = "",
                               tcga_participant_barcode = "",
                               tool = "miRseq_Mature_Preprocess",
                               sample_type = "",
                               page = 1,
                               page_size = 250,
                               sort_by = "mir"){

  parameters = list(format = format,
                    mir = mir,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    tool = tool,
                    sample_type = sample_type,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  if(is.null(parameters[["mir"]]) &
     is.null(parameters[["tcga_participant_barcode"]]) ){
    stop("One of the parameters 'mir' OR 'tcga_participant_barcode', must be
         provided")
  }

  validet.Parameters(parameters)
  url = build.Query(parameters = parameters, invoker = "Samples", method = "miRSeq")

  ret = download.Data(url, format)

  return(ret)
}
