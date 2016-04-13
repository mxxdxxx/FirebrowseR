#library(FirebrowseR)
context("Samples.mRNASeq")

test_that("mRNASeq data is retrieved correctly", {

  format = "json"
  gene = c("AKT3", "RB1", "MAP3K1")
  cohort = "BRCA"
  tcga_participant_barcode = ""
  sample_type = "NT"
  protocol = "RSEM"
  page = 1
  page_size = 250
  sort_by = "gene"

  obj = Samples.mRNASeq(format = format, gene, cohort, tcga_participant_barcode,
                            sample_type, protocol, page, page_size, sort_by)
  
  test.q = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=csv&gene=AKT3%2CRB1%2CMAP3K1&cohort=BRCA&sample_type=NT&protocol=RSEM&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",", quote = "\"")
  expect_is(obj, "list")
  expect_equal(length(obj[[1]]), nrow(test.obj))
  expect_equal(length(obj[[1]][[1]]), ncol(test.obj))

})
