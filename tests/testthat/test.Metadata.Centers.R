#library(FirebrowseR)
context("Metadata.Centers")

test_that("We get centers back", {

  format = "csv"
  center = c("intgen.org", "jhu-usc.edu")
  obj = Metadata.Centers(format = format, center = center)

  expect_equal(ncol(obj), 5)
  expect_equal(nrow(obj), 2)

})
