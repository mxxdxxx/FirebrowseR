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
  test.q = "http://firebrowse.org/api/v1/Analyses/CopyNumber/Genes/Deleted?format=csv&gene=PTEN&q=0.05&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

  gene = "PFN3"
  obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/CopyNumber/Genes/Deleted?format=csv&gene=PFN3&q=0.05&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
  format = "json"
  obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)
  expect_equal(length(obj[[1]]), nrow(test.obj))
  expect_equal(length(obj[[1]][[1]]), ncol(test.obj))
})
