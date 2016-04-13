#library(FirebrowseR)
context("Metadata.SampleTypes")

test_that("We get dates back", {

  format = "csv"
  obj = Metadata.SampleTypes(format = format)
  test.q = "http://firebrowse.org/api/v1/Metadata/SampleTypes?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
})
