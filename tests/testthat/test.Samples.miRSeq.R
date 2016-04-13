#library(FirebrowseR)
context("Samples.miRSeq")

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
  test.q = "http://firebrowse.org/api/v1/Samples/miRSeq?format=csv&mir=hsa-mir-1285-3p%2Chsa-mir-125a-5p%2Chsa-mir-221-3p%2Chsa-mir-10b-5p%2Chsa-mir-608%2Chsa-mir-324-5p&cohort=BRCA&tool=miRseq_Mature_Preprocess&sample_type=NT&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",", quote = "\"")
  expect_is(obj, "list")
  expect_equal(length(obj[[1]]), nrow(test.obj))
  expect_equal(length(obj[[1]][[1]]), ncol(test.obj))
  

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
  test.q = "http://firebrowse.org/api/v1/Samples/miRSeq?format=csv&mir=hsa-mir-1285-3p%2Chsa-mir-125a-5p&cohort=BRCA&tool=miRseq_Mature_Preprocess&sample_type=NT&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",", quote = "\"")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
