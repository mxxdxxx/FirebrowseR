#library(FirebrowseR)
context("Analyses.FeatureTable")

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
  test.q = "http://firebrowse.org/api/v1/Analyses/FeatureTable?format=tsv&cohort=PRAD&date=2015_08_21&column=tcga_participant_barcode%2Ccohort&page=1&page_size=250"
  test.obj = read.table(test.q, header = T, sep = "\t")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
  
  column = ""
  obj = Analyses.FeatureTable(format = format,
                              cohort = cohort,
                              column = column,
                              page = page,
                              page_size = page_size)
  test.q = "http://firebrowse.org/api/v1/Analyses/FeatureTable?format=tsv&cohort=PRAD&page=1&page_size=250"
  test.obj = read.table(test.q, header = T, sep = "\t")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
})
