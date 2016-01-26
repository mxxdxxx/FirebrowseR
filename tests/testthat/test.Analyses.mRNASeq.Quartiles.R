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
  expect_equal(length(obj[[1]]), 37)

  format = "tsv"
  obj = Analyses.mRNASeq.Quartiles(format = format,
                                   gene = gene,
                                   cohort = cohort,
                                   protocol = protocol,
                                   sample_type = sample_type,
                                   Exclude = Exclude)
  expect_equal(nrow(obj), 37)
  expect_equal(ncol(obj), 8)
})
