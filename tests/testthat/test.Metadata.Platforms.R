#library(FirebrowseR)
context("Metadata.Platforms")

test_that("CDEs are retrieved correctly", {

  format = "csv"
  obj = Metadata.Platforms(format = format)
  test.q = "http://firebrowse.org/api/v1/Metadata/Platforms?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))


  format = "tsv"
  platform = c("454", "ABI", "biotab")
  obj = Metadata.Platforms(format = format,
                           platform = platform)
  test.q = "http://firebrowse.org/api/v1/Metadata/Platforms?format=csv&platform=454%2CABI%2Cbiotab"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
