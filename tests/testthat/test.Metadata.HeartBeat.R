#library(FirebrowseR)
context("Metadata.HeartBeat")

test_that("The HeartBeat", {

  format = "csv"
  obj = Metadata.HeartBeat(format = format)

  expect_equal(nrow(obj), 4)
  expect_equal(ncol(obj), 1)

  format = "tsv"
  obj = Metadata.HeartBeat(format = format)

  expect_equal(nrow(obj), 4)
  expect_equal(ncol(obj), 1)

})
