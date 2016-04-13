#library(FirebrowseR)
context("Archives.StandardData")

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
  test.q = "http://firebrowse.org/api/v1/Archives/StandardData?format=csv&date=2014_12_06&cohort=BRCA&data_type=CopyNumber&level=3&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
  
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
  test.q = "http://firebrowse.org/api/v1/Archives/StandardData?format=csv&date=2014_12_06&cohort=PRAD&data_type=MAF&level=3&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

})
