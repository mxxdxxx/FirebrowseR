#library(FirebrowseR)
context("Metadata.SampleType.ShortLetterCode")

test_that("We get ShortLetterCodes back", {

  format = "csv"
  short_letter_code = c("TR", "TB")
  obj = Metadata.SampleType.ShortLetterCode(format = format,
                                            short_letter_code = short_letter_code)
  test.q = "http://firebrowse.org/api/v1/Metadata/SampleType/ShortLetterCode/TB%2CTR?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
})
