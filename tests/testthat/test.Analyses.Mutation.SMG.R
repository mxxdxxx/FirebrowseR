#library(FirebrowseR)
context("Analyses.Mutation.SMG")

test_that("Getting SMG files", {

  format = "json"
  cohort = "PRAD"
  tool = "MutSig2CV"
  rank = ""
  gene = ""
  q = "0.01"
  page = 1
  page_size = 250
  sort_by = "q"


  parameters = list(format = format,
                    cohort = cohort,
                    tool = tool,
                    rank = rank,
                    gene = gene,
                    q = q,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)

  obj = Analyses.Mutation.SMG(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  rank = rank,
                                  gene = gene,
                                  q = q,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/Mutation/SMG?format=csv&cohort=PRAD&tool=MutSig2CV&q=0.01&page=1&page_size=250&sort_by=q"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_is(obj, "list")
  expect_equal(length(obj[[1]]), nrow(test.obj))


  format = "csv"
  obj = Analyses.Mutation.SMG(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  rank = rank,
                                  gene = gene,
                                  q = q,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_is(obj, "data.frame")
  expect_equal(ncol(obj), ncol(test.obj))
  expect_equal(nrow(obj), nrow(test.obj))

  gene = c("TP53", "SPOP")
  q = 0.05
  obj = Analyses.Mutation.SMG(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  rank = rank,
                                  gene = gene,
                                  q = q,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/Mutation/SMG?format=csv&cohort=PRAD&tool=MutSig2CV&gene=TP53%2CSPOP&q=0.05&page=1&page_size=250&sort_by=q"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  

  gene = ""
  obj = Analyses.Mutation.SMG(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  rank = rank,
                                  gene = gene,
                                  q = q,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/Mutation/SMG?format=csv&cohort=PRAD&tool=MutSig2CV&q=0.05&page=1&page_size=250&sort_by=q"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
})
