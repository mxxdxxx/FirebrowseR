#library(FirebrowseR)
context("Analyses.CopyNumber.Genes.Thresholded")

test_that("Getting the GISTIC2 thresholded ouput", {

  format = "csv"
  cohort = "PRAD"
  gene = "PTEN"
  tcga_participant_barcode = c("TCGA-J4-A67O", "TCGA-G9-6496")
  page = 1
  page_size = 250
  sort_by = "cohort"

  obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/CopyNumber/Genes/Thresholded?format=csv&cohort=PRAD&gene=PTEN&tcga_participant_barcode=TCGA-J4-A67O%2CTCGA-G9-6496&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  

  gene = ""
  obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  test.q = "http://firebrowse.org/api/v1/Analyses/CopyNumber/Genes/Thresholded?format=csv&cohort=PRAD&tcga_participant_barcode=TCGA-J4-A67O%2CTCGA-G9-6496&page=1&page_size=250&sort_by=cohort"
  test.obj = read.table(test.q, header = T, sep = ",")
  expect_equal(nrow(obj), nrow(test.obj))
  expect_equal(ncol(obj), ncol(test.obj))
  
  
  format = "json"
  obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
                                          cohort = cohort,
                                          gene = gene,
                                          tcga_participant_barcode = tcga_participant_barcode,
                                          page = page,
                                          page_size = page_size,
                                          sort_by = sort_by)
  expect_equal(length(obj[[1]]), nrow(test.obj))
})
