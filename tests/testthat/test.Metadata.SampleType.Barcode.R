#library(FirebrowseR)
context("Metadata.SampleType.Barcode")

test_that("We get dates back", {

  format = "csv"
  tcga_participant_barcode = c("TCGA-GF-A4EO-06")
  obj = Metadata.SampleType.Barcode(format = format,
                                    TCGA_Barcode = tcga_participant_barcode)

  expect_equal(ncol(obj), 2)
  expect_equal(nrow(obj), 1)

})
