#library(FirebrowseR)
context("Metadata.ClinicalNames")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.ClinicalNames(format = format)

  expect_equal(nrow(obj), 64)
  expect_equal(ncol(obj), 1)

  format = "tsv"
  obj = Metadata.ClinicalNames(format = format)

  expect_equal(nrow(obj), 64)
  expect_equal(ncol(obj), 1)

})
