library(FireBrowseR)
context("Basic GISTIC2 Copy Number Data, Focal")

test_that("Getting the GISTIC2 focal ouput", {

  format = "csv"
  cohort = "PRAD"
  gene = "PTEN"
  tcga_participant_barcode = c("TCGA-J4-A67O", "TCGA-G9-6496")
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Analyses.CopyNumber.Genes.Focal(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  expect_equal(nrow(obj), 2)
  expect_equal(ncol(obj), 7)

  gene = ""
  obj = Analyses.CopyNumber.Genes.Focal(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  expect_equal(nrow(obj), 250)
  expect_equal(ncol(obj), 7)

  format = "json"
  obj = Analyses.CopyNumber.Genes.Focal(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  expect_equal(length(obj[[1]]), 250)
})
