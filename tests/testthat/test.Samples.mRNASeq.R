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
  expect_is(obj, "list")
  expect_that(length(obj[[1]]), equals(page_size))

  format = "csv"
  obj = Samples.mRNASeq(format = format, gene, cohort, tcga_participant_barcode,
                            sample_type, protocol, page, page_size, sort_by)
  expect_is(obj, "data.frame")
  expect_that(ncol(obj), equals(8))
  expect_identical( sort(unique(obj$gene)) , sort(gene))

  obj = Samples.mRNASeq(gene = c("TP53", "RUNX1"))
  expect_is(obj, "data.frame")

})
