#library(FirebrowseR)
context("Metadata.SampleType.Barcode")

test_that("We get dates back", {

  format = "csv"
  tcga_participant_barcode = c("TCGA-GF-A4EO-06")
  obj = Metadata.SampleType.Barcode(format = format,
                                    TCGA_Barcode = tcga_participant_barcode)
  test.q = "http://firebrowse.org/api/v1/Metadata/SampleType/Barcode/TCGA-GF-A4EO-06?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
