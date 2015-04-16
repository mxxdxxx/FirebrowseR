library(FireBrowseR)
context("Metadata Dates")

test_that("We get dates back", {

  format = "csv"
  obj = Metadata.SampleTypes(format = format)

  expect_equal(ncol(obj), 2)
  expect_equal(nrow(obj), 19)

})
