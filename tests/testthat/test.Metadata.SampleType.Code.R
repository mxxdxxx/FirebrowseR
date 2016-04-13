#library(FirebrowseR)
context("Metadata.SampleType.Code")

test_that("We get codes back", {

  format = "csv"
  code = c(50, 60)
  obj = Metadata.SampleType.Code(format = format,
                                 code = code)
  test.q = "http://firebrowse.org/api/v1/Metadata/SampleType/Code/50%2C60?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
