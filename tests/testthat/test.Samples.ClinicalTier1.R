#library(FirebrowseR)
context("Samples.ClinicalTier1")

test_that("Samples.ClinicalTier1", {

  format = "json"
  cohort = ""
  tcga_participant_barcode = ""
  tier1_cde_name = ""
  page = 1
  page_size = 250
  sort_by = "cohort"
  expect_error(Samples.ClinicalTier1(format = format,
                                  cohort = cohort,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  tier1_cde_name = tier1_cde_name,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by))

  cohort = "COAD"
  obj = Samples.ClinicalTier1(format = format,
                                     cohort = cohort,
                                     tcga_participant_barcode = tcga_participant_barcode,
                                     tier1_cde_name = tier1_cde_name,
                                     page = page,
                                     page_size = page_size,
                                     sort_by = sort_by)
  expect_is(obj, "list")
  expect_is(obj[[1]], "list")
  expect_that(length(obj[[1]]), equals(250))

  format = "csv"
  obj = Samples.ClinicalTier1(format = format,
                                  cohort = cohort,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  tier1_cde_name = tier1_cde_name,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_is(obj, "data.frame")
  expect_that(nrow(obj), equals(250))
  expect_that(ncol(obj), equals(22))

  tcga_participant_barcode = "TCGA-GF-A4EO"
  obj = Samples.ClinicalTier1(format = "tsv",
                              cohort = cohort,
                              tcga_participant_barcode = tcga_participant_barcode,
                              tier1_cde_name = tier1_cde_name,
                              page = page,
                              page_size = page_size,
                              sort_by = sort_by)
  expect_null(obj)
})
