library(FireBrowseR)
context("Retrieving Analyses FeatureTable")

test_that("URLs are retrieved correctly", {

  format = "tsv"
  cohort = "PRAD"
  column = c("tcga_participant_barcode", "cohort")
  page = 1
  page_size = 250

  obj = Analyses.FeatureTable(format = format,
                                  cohort = cohort,
                                  column = column,
                                  page = page,
                                  page_size = page_size)
  expect_equal(ncol(obj), 2)
})
