#library(FirebrowseR)
context("Metadata.ClinicalNames_FH")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.ClinicalNames_FH(format = format)
  
  test.q = "http://firebrowse.org/api/v1/Metadata/ClinicalNames_FH?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
})
