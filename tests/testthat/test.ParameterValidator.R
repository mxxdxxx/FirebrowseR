library(FireBrowseR)
context("Parameter Validator")

test_that("validet.Parameters works correct", {

  to.Validate = list(
    gene = c("PTEN","RUNX1","TP53"),
    format = "json",
    cohort = c("ACC","BLCA"),
    sample_type = c("NB"),
    protocol = "RSEM",
    page = 1,
    page_size = 250,
    sort_by = "gene")

  expect_true({validet.Parameters(to.Validate); TRUE})
})
