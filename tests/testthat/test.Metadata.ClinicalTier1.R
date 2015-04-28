#library(FirebrowseR)
context("Metadata.ClinicalTier1")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.ClinicalTier1(format = format)

  expect_equal(nrow(obj), 86)
  expect_equal(ncol(obj), 1)

  format = "tsv"
  obj = Metadata.ClinicalTier1(format = format)

  expect_equal(nrow(obj), 86)
  expect_equal(ncol(obj), 1)

})
