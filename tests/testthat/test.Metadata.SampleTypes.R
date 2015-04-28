#library(FirebrowseR)
context("Metadata.SampleTypes")

test_that("We get dates back", {

  format = "csv"
  obj = Metadata.SampleTypes(format = format)

  expect_equal(ncol(obj), 3)
  expect_equal(nrow(obj), 19)

})
