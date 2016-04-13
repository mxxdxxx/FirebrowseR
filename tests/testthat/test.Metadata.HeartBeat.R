#library(FirebrowseR)
context("Metadata.HeartBeat")

test_that("The HeartBeat", {

  format = "csv"
  obj = Metadata.HeartBeat(format = format)
  
  test.q = "http://firebrowse.org/api/v1/Metadata/HeartBeat?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
