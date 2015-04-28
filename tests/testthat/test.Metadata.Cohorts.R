#library(FirebrowseR)
context("Metadata.Cohorts")

test_that("Cohort abbreviations are returned correctly", {

  format = "csv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohorts(format = format,
                         cohort = cohort)

  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 2)

  format = "tsv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohorts(format = format,
                         cohort = cohort)

  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 2)

})
