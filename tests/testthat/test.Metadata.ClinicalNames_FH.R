#library(FirebrowseR)
context("Metadata.ClinicalNames_FH")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.ClinicalNames_FH(format = format)

  expect_equal(nrow(obj), 65)
  expect_equal(ncol(obj), 1)

  format = "tsv"
  obj = Metadata.ClinicalNames_FH(format = format)

  expect_equal(nrow(obj), 65)
  expect_equal(ncol(obj), 1)

})
