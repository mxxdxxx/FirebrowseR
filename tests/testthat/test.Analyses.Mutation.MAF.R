#library(FirebrowseR)
context("Analyses.Mutation.MAF")

test_that("Getting MAF files", {
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

  tcga_participant_barcode = "TCGA-CH-5761"
  cohort = "PRAD"
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
  test.q = "http://firebrowse.org/api/v1/Analyses/Mutation/MAF?format=csv&cohort=PRAD&tool=MutSig2CV&tcga_participant_barcode=TCGA-CH-5761&page=1&page_size=250&sort_by=gene"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(length(obj[[1]]), nrow(test.obj))
  expect_equal(length(obj[[1]][[1]]), ncol(test.obj))

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
  expect_equal(length(obj[[1]][[1]]), 3)

})
