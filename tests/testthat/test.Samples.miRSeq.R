library(FireBrowseR)
context("Sample data miRSeq")

test_that("miRSeq data is retrieved correctly", {

  format = "json"
  mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p","hsa-mir-221-3p","hsa-mir-10b-5p","hsa-mir-608","hsa-mir-324-5p")
  cohort = "BRCA"
  tcga_participant_barcode = ""
  tool = "miRseq_Mature_Preprocess"
  sample_type = "NT"
  page = 1
  page_size = 250
  sort_by = "mir"

  obj = Samples.miRSeq(format = format,
                          mir = mir,
                          cohort = cohort,
                          tcga_participant_barcode = tcga_participant_barcode,
                          tool = tool,
                          sample_type = sample_type,
                          page = page,
                          page_size = page_size,
                          sort_by = sort_by)
  expect_is(obj, "list")
  expect_that(length(obj[[1]]), equals(page_size))

  format = "csv"
  mir = c("hsa-mir-1285-3p", "hsa-mir-125a-5p")
  obj = Samples.miRSeq(format = format,
                          mir = mir,
                          cohort = cohort,
                          tcga_participant_barcode = tcga_participant_barcode,
                          tool = tool,
                          sample_type = sample_type,
                          page = page,
                          page_size = page_size,
                          sort_by = sort_by)
  expect_is(obj, "data.frame")
  expect_that(ncol(obj), equals(8))
  expect_identical( sort(unique(obj$mir)) , sort(mir))

  obj = Samples.miRSeq(mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p"))
  expect_is(obj, "data.frame")

})
