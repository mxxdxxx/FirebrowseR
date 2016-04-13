#library(FirebrowseR)
context("Analyses.Reports")

test_that("URLs are retrieved correctly", {

  format = "tsv"
  date = "2014_10_17"
  cohort = ""
  name = "Aggregate_AnalysisFeatures"
  type = ""
  page = 1
  page_size = 250
  sort_by = "date"

  obj = Analyses.Reports(format = format,
                             date = date,
                             cohort = cohort,
                             name = name,
                             type = type,
                             page = page,
                             page_size = page_size,
                             sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/Reports?format=csv&date=2014_10_17&name=Aggregate_AnalysisFeatures&page=1&page_size=250&sort_by=date"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

  name = ""
  type = "Clustering"
  obj = Analyses.Reports(format = format,
                             date = date,
                             cohort = cohort,
                             name = name,
                             type = type,
                             page = page,
                             page_size = page_size,
                             sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/Reports?format=csv&date=2014_10_17&type=Clustering&page=1&page_size=250&sort_by=date"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
})
