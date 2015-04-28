#library(FirebrowseR)
context("Metadata.Cohort")

test_that("Cohort describtions are returned correctly", {

  format = "csv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohort(format = format,
                         cohort = cohort)

  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 2)

  format = "tsv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohort(format = format,
                         cohort = cohort)

  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 2)

})
