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
  test.q = "http://firebrowse.org/api/v1/Analyses/mRNASeq/Quartiles?format=tsv&gene=PTEN&protocol=RSEM&sample_type=tumors"
  test.obj = read.table(test.q, header = T, sep = "\t")
  expect_equal(length(obj[[1]]), nrow(test.obj))
  expect_equal(length(obj[[1]][[1]]), ncol(test.obj))
  
  
  format = "tsv"
  obj = Analyses.mRNASeq.Quartiles(format = format,
                                   gene = gene,
                                   cohort = cohort,
                                   protocol = protocol,
                                   sample_type = sample_type,
                                   Exclude = Exclude)
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
})
