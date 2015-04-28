#library(FirebrowseR)
context("Metadata.Platforms")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.Platforms(format = format)
  expect_equal(nrow(obj), 78)
  expect_equal(ncol(obj), 2)

  format = "tsv"
  obj = Metadata.Platforms(format = format)
  expect_equal(nrow(obj), 78)
  expect_equal(ncol(obj), 2)

  platform = c("454", "ABI", "biotab")
  obj = Metadata.Platforms(format = format,
                           platform = platform)
  expect_equal(nrow(obj), 3)
  expect_equal(ncol(obj), 2)

})
