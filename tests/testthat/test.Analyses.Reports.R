#library(FirebrowseR)
context("Retrieving Analyses Report URLs")

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
  expect_equal(nrow(obj), 26)

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
  expect_equal(nrow(obj), 250)
})
