#library(FirebrowseR)
context("Metadata.Cohorts")

test_that("Cohort abbreviations are returned correctly", {

  format = "csv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohorts(format = format,
                         cohort = cohort)

  test.q = "http://firebrowse.org/api/v1/Metadata/Cohorts?format=csv&cohort=BRCA%2CPRAD"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
