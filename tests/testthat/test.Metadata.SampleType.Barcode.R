library(FireBrowseR)
context("Metadata SampleType Barcode")

test_that("We get dates back", {

  format = "csv"
  tcga_participant_barcode = c("TCGA-GF-A4EO-06",
                               "TCGA-EL-A3D5-01A-22D-A202-08")
  obj = Metadata.SampleType.Barcode(format = format,
                                    tcga_participant_barcode = tcga_participant_barcode)

  expect_equal(ncol(obj), 2)
  expect_equal(nrow(obj), 2)

})
