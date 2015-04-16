library(FireBrowseR)
context("Metadata Dates")

test_that("We get dates back", {

  format = "csv"
  obj = Metadata.Dates(format = format)

  expect_equal(ncol(obj), 1)
  expect_equal(nrow(obj), 8)

})
