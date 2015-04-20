#library(FirebrowseR)
context("Metadata SampleType Barcode")

test_that("We get codes back", {

  format = "csv"
  code = c(50, 60)
  obj = Metadata.SampleType.Code(format = format,
                                 code = code)

  expect_equal(ncol(obj), 2)
  expect_equal(nrow(obj), 2)

})
