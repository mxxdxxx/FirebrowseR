#library(FirebrowseR)
context("Analyses.CopyNumber.Genes.Amplified")

test_that("Getting the GISTIC2 amplified ouput", {

  format = "csv"
  cohort = ""
  gene = "PTEN"
  q = 0.05
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                  cohort = cohort,
                                                  gene = gene,
                                                  q = q,
                                                  page = page,
                                                  page_size = page_size,
                                                  sort_by = sort_by)
  expect_null(obj)

  gene = "PFN3"
  obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                  cohort = cohort,
                                                  gene = gene,
                                                  q = q,
                                                  page = page,
                                                  page_size = page_size,
                                                  sort_by = sort_by)
  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 10)

  format = "json"
  obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                  cohort = cohort,
                                                  gene = gene,
                                                  q = q,
                                                  page = page,
                                                  page_size = page_size,
                                                  sort_by = sort_by)
  expect_equal(length(obj[[1]]), 2)
  expect_equal(length(obj[[1]][[1]]), 10)
})
