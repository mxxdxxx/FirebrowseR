#library(FirebrowseR)
context("Samples.Clinical_FH")

test_that("Samples.Clinical_FH", {

  format = "json"
  cohort = ""
  tcga_participant_barcode = ""
  fh_cde_name = ""
  page = 1
  page_size = 250
  sort_by = "cohort"
  expect_error(Samples.Clinical_FH(format = format,
                                cohort = cohort,
                                tcga_participant_barcode = tcga_participant_barcode,
                                fh_cde_name = fh_cde_name,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by))

  cohort = "COAD"
  obj = Samples.Clinical_FH(format = format,
                         cohort = cohort,
                         tcga_participant_barcode = tcga_participant_barcode,
                         fh_cde_name = fh_cde_name,
                         page = page,
                         page_size = page_size,
                         sort_by = sort_by)
  expect_is(obj, "list")
  expect_is(obj[[1]], "list")
  expect_that(length(obj[[1]]), equals(250))

  format = "csv"
  obj = Samples.Clinical_FH(format = format,
                         cohort = cohort,
                         tcga_participant_barcode = tcga_participant_barcode,
                         fh_cde_name = fh_cde_name,
                         page = page,
                         page_size = page_size,
                         sort_by = sort_by)
  expect_is(obj, "data.frame")
  expect_that(nrow(obj), equals(250))
  expect_that(ncol(obj), equals(22))

  tcga_participant_barcode = "TCGA-GF-A4EO"
  obj = Samples.Clinical_FH(format = "tsv",
                         cohort = cohort,
                         tcga_participant_barcode = tcga_participant_barcode,
                         fh_cde_name = fh_cde_name,
                         page = page,
                         page_size = page_size,
                         sort_by = sort_by)
  expect_null(obj)
})
