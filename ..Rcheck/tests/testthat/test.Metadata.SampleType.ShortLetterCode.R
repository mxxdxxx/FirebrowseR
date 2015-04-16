library(FireBrowseR)
context("Metadata SampleType ShortLetterCode")

test_that("We get ShortLetterCodes back", {

  format = "csv"
  short_letter_code = c("TR", "TB")
  obj = Metadata.SampleType.ShortLetterCode(format = format,
                                            short_letter_code = short_letter_code)

  expect_equal(ncol(obj), 2)
  expect_equal(nrow(obj), 2)

})
