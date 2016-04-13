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
  test.q = "http://firebrowse.org/api/v1/Metadata/Counts?format=csv&date=2015_02_04&cohort=BRCA%2CPRAD&totals=true&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

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

  test.q = "http://firebrowse.org/api/v1/Metadata/Counts?format=csv&date=2015_02_04&cohort=BRCA%2CPRAD&sample_type=TP&data_type=methylation%2Cmaf&totals=true&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
