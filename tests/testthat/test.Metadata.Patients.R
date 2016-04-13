#library(FirebrowseR)
context("Metadata.Patients")

test_that("Barcodes are received correctly", {

  format = "csv"
  cohort  = ""
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Metadata.Patients(format = format)
  test.q = "http://firebrowse.org/api/v1/Metadata/Patients?format=csv&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
