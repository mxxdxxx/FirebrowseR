#library(FirebrowseR)
context("Analyses.mRNASeq.Quartiles")

test_that("Are quantiles returned correctly", {

  format = "json"
  gene = "PTEN"
  cohort = ""
  protocol = "RSEM"
  sample_type = "tumors"
  Exclude = ""

  obj = Analyses.mRNASeq.Quartiles(format = format,
                                   gene = gene,
                                   cohort = cohort,
                                   protocol = protocol,
                                   sample_type = sample_type,
                                   Exclude = Exclude)
  expect_equal(length(obj[[1]]), 34)

  format = "tsv"
  obj = Analyses.mRNASeq.Quartiles(format = format,
                                   gene = gene,
                                   cohort = cohort,
                                   protocol = protocol,
                                   sample_type = sample_type,
                                   Exclude = Exclude)
  expect_equal(nrow(obj), 34)
  expect_equal(ncol(obj), 8)
})
