#library(FirebrowseR)
context("Analyses.CopyNumber.Genes.Deleted")

test_that("Getting the GISTIC2 delted ouput", {

  format = "csv"
  cohort = ""
  gene = "PTEN"
  q = 0.05
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)
  expect_equal(nrow(obj), 21)

  gene = "PFN3"
  obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)
  expect_equal(nrow(obj), 3)
  expect_equal(ncol(obj), 10)

  format = "json"
  obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)
  expect_equal(length(obj[[1]]), 3)
  expect_equal(length(obj[[1]][[1]]), 10)
})
