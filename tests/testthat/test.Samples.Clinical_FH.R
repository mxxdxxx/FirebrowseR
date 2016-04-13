#library(FirebrowseR)
context("Samples.Clinical_FH")

test_that("Samples.Clinical_FH", {

  format = "csv"
  cohort = ""
  tcga_participant_barcode = ""
  fh_cde_name = ""
  page = 1
  page_size = "150"
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
  test.q = "http://firebrowse.org/api/v1/Samples/Clinical_FH?format=tsv&cohort=COAD&page=1&page_size=150&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = "\t", quote = "\"")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))

  tcga_participant_barcode = "TCGA-GF-A4EO"
  expect_error(Samples.Clinical_FH(format = "tsv",
                                   cohort = cohort,
                                   tcga_participant_barcode = tcga_participant_barcode,
                                   fh_cde_name = fh_cde_name,
                                   page = page,
                                   page_size = page_size,
                                   sort_by = sort_by))
})
