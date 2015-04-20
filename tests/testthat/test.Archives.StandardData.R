#library(FirebrowseR)
context("Archives Standard Data")

test_that("Check if download links a returned correctly", {

  format = "tsv"
  date = "2014_12_06"
  cohort = "BRCA"
  data_type = "CopyNumber"
  level = 3
  page = 1
  page_size = 250

  obj = Archives.StandardData(format = format,
                                  date = date,
                                  cohort = cohort,
                                  data_type = data_type,
                                  level = level,
                                  page = page,
                                  page_size = page_size)
  expect_equal(nrow(obj), 8)
  expect_equal(ncol(obj), 11)

  cohort = "PRAD"
  data_type = "MAF"
  level = 3
  obj = Archives.StandardData(format = format,
                                  date = date,
                                  cohort = cohort,
                                  data_type = data_type,
                                  level = level,
                                  page = page,
                                  page_size = page_size)
  expect_equal(nrow(obj), 1)

  format = "csv"
  date = "2014_12_06"
  cohort = "BRCA"
  data_type = "CopyNumber"
  level = 3
  page = 1
  page_size = 250

  obj = Archives.StandardData(format = format,
                              date = date,
                              cohort = cohort,
                              data_type = data_type,
                              level = level,
                              page = page,
                              page_size = page_size)
  expect_equal(nrow(obj), 8)
  expect_equal(ncol(obj), 11)

  cohort = "PRAD"
  data_type = "MAF"
  level = 3
  obj = Archives.StandardData(format = format,
                              date = date,
                              cohort = cohort,
                              data_type = data_type,
                              level = level,
                              page = page,
                              page_size = page_size)
  expect_equal(nrow(obj), 1)
})
