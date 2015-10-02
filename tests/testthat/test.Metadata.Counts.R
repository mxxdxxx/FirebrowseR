#library(FirebrowseR)
context("Metadata.Counts")

test_that("Sample counts are returned correctly", {

  format = "csv"
  date = "2015_02_04"
  cohort = c("PRAD", "BRCA")
  sample_type = ""
  data_type = ""
  totals = T

  obj = Metadata.Counts(format = format,
                                 date = date,
                                 cohort = cohort,
                                 sample_type = sample_type,
                                 data_type = data_type,
                                 totals = totals)
  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 14)

  format = "tsv"
  cohort = c("PRAD", "BRCA")
  sample_type = "TP"
  data_type = c("methylation", "maf")
  totals = T

  obj = Metadata.Counts(format = format,
                                 date = date,
                                 cohort = cohort,
                                 sample_type = sample_type,
                                 data_type = data_type,
                                 totals = totals)

  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 3)

})
