#library(FirebrowseR)
context("Analyses.Mutation.MAF")

test_that("Getting MAF files", {
#  skip("Skipping this test in DEV mode, it takes alot time and already passed.")
  format = "json"
  cohort = ""
  tool = "MutSig2CV"
  gene = ""
  tcga_participant_barcode = ""
  column = ""
  page = 1
  page_size = 250
  sort_by = c("gene")

  expect_error(Analyses.Mutation.MAF(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  gene =gene,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  column = column,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by))

  gene = c("TP53", "RUNX1")
  obj = Analyses.Mutation.MAF(format = format,
                              cohort = cohort,
                              tool = tool,
                              gene = gene,
                              tcga_participant_barcode = tcga_participant_barcode,
                              column = column,
                              page = page,
                              page_size = page_size,
                              sort_by = sort_by)

  expect_is(obj, "list")
  expect_that(length(obj[[1]]), equals(page_size))

  format = "csv"
  obj = Analyses.Mutation.MAF(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  gene =gene,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  column = column,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_is(obj, "data.frame")
  expect_that(ncol(obj), equals(9))

  tcga_participant_barcode = "TCGA-CH-5761"
  cohort = "PRAD"
  obj = Analyses.Mutation.MAF(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  gene =gene,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  column = column,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_equal(nrow(obj), 1)

  gene = ""
  obj = Analyses.Mutation.MAF(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  gene = gene,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  column = column,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_equal(nrow(obj), 74)

  column = c("tcga_participant_barcode", "Hugo_Symbol", "Variant_Type")
  obj = Analyses.Mutation.MAF(format = format,
                                  cohort = cohort,
                                  tool = tool,
                                  gene = gene,
                                  tcga_participant_barcode = tcga_participant_barcode,
                                  column = column,
                                  page = page,
                                  page_size = page_size,
                                  sort_by = sort_by)
  expect_equal(ncol(obj), 3)

})
