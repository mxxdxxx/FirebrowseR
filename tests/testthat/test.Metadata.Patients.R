#library(FirebrowseR)
context("Metadata.Patients")

test_that("Barcodes are received correctly", {

  format = "csv"
  cohort  = ""
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Metadata.Patients(format = format)
  expect_equal(nrow(obj), 250)
  expect_equal(ncol(obj), 3)

  format = "tsv"
  obj = Metadata.Patients(format = format)
  expect_equal(nrow(obj), 250)
  expect_equal(ncol(obj), 3)

})
