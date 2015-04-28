#library(FirebrowseR)
context("build.Query")

test_that("Query Builder works for regular queries", {

  q1 = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=csv&gene=PTEN&cohort=BRCA&sample_type=NT&protocol=RSEM&page=1&page_size=250&sort_by=gene"
  sort_by = "gene"
  page_size = 250
  page = 1
  protocol = "RSEM"
  sample_type = "NT"
  tcga_participant_barcode = ""
  cohort = "BRCA"
  format = "csv"
  gene = "PTEN"

  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    sample_type = sample_type,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  expect_identical(build.Query(parameters, invoker = "Samples", method = "mRNASeq"), q1)


  q2 = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=json&gene=PTEN%2CRUNX1&cohort=BLCA%2CBRCA&sample_type=NBC%2CNBM%2CNT&protocol=RPKM&page=1&page_size=2000&sort_by=gene"
  format = "json"
  gene = c("PTEN", "RUNX1")
  cohort = c("BLCA", "BRCA")
  sample_type = c("NBC","NBM","NT")
  protocol = "RPKM"
  tcga_participant_barcode = ""
  page = 1
  page_size = 2000
  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    sample_type = sample_type,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  expect_identical(build.Query(parameters, invoker = "Samples", method = "mRNASeq"), q2)

  q3 = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=csv&gene=PTEN%2CRUNX1&cohort=BRCA&tcga_participant_barcode=TCGA-GF-A4EO&sample_type=NBC%2CNBM&protocol=RPKM&page=1&page_size=2000&sort_by=gene"
  format = "csv"
  gene = c("PTEN", "RUNX1")
  cohort = "BRCA"
  sample_type = c("NBC","NBM")
  protocol = "RPKM"
  tcga_participant_barcode = "TCGA-GF-A4EO"
  page = 1
  page_size = 2000
  parameters = list(format = format,
                    gene = gene,
                    cohort = cohort,
                    tcga_participant_barcode = tcga_participant_barcode,
                    sample_type = sample_type,
                    protocol = protocol,
                    page = page,
                    page_size = page_size,
                    sort_by = sort_by)
  expect_identical(build.Query(parameters, invoker = "Samples", method = "mRNASeq"), q3)
})


test_that("Query Builder works for mass queries", {

  q1 = "http://firebrowse.org/api/v1/Metadata/Cohort/ACC%2CBLCA%2CBRCA%2CCESC?format=json"
  cohort = c("ACC", "BLCA", "BRCA", "CESC")
  format = "json"

  parameters = list(format = format,
                    cohort = cohort)
  expect_identical(build.Query(parameters, invoker = "Metadata", method = "Cohort", mass = T), q1)

})
