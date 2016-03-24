#library(FirebrowseR)
context("validet.Parameters")

test_that("validate.Parameters works correct", {

  to.Validate = list(
    gene = c("PTEN","RUNX1","TP53"),
    format = "json",
    cohort = c("ACC","BLCA"),
    sample_type = c("NB"),
    protocol = "RSEM",
    page = 1,
    page_size = 250,
    sort_by = "gene")

  expect_true({validate.Parameters(to.Validate); TRUE})
})
