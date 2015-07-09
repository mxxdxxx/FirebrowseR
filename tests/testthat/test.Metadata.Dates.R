#library(FirebrowseR)
context("Metadata.Dates")

test_that("We get dates back", {

  format = "csv"
  url = "http://firebrowse.org/api/v1/Metadata/Dates?format=tsv"
  obj = Metadata.Dates(format = format)


  expect_equal(ncol(obj), 1)
  expect_equal(nrow(obj),
               nrow(read.table(url, header = T, sep = "\t")))

})
