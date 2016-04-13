#library(FirebrowseR)
context("Metadata.Centers")

test_that("We get centers back", {

  format = "csv"
  center = c("intgen.org", "jhu-usc.edu")
  obj = Metadata.Centers(format = format, center = center)

  test.q = "http://firebrowse.org/api/v1/Metadata/Centers?format=csv&center=intgen.org%2Cjhu-usc.edu"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
