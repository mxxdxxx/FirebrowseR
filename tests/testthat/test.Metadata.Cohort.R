#library(FirebrowseR)
context("Metadata.Cohort")

test_that("Cohort describtions are returned correctly", {

  format = "csv"
  cohort = c("PRAD", "BRCA")

  obj = Metadata.Cohort(format = format,
                         cohort = cohort)

  test.q = "http://firebrowse.org/api/v1/Metadata/Cohort/BRCA%2CPRAD?format=csv"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
})
