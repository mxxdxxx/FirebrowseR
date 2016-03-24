#library(FirebrowseR)
context("download.Data")

test_that("Can data be retrieved in different formats", {

  gene = c("PTEN","RUNX1","TP53")
  cohort = c("ACC","BLCA","BRCA","CESC","CHOL","COAD","COADREAD","DLBC","ESCA","FPPP","GBM","GBMLGG","HNSC","KICH","KIPAN","KIRC","KIRP","LAML","LGG","LIHC","LUAD","LUSC","MESO","OV","PAAD","PCPG","PRAD","READ","SARC","SKCM","STAD","TGCT","THCA","THYM","UCEC","UCS","UVM")
  sample_type = c("NB","NBC","NBM","NT","TAM","TAP","TB","TM","TP","TR")
  protocol = "RSEM"
  page = 1
  page_size = 250
  sort_by = "gene"

  params = list(format = NULL,
                gene = gene,
                cohort = cohort,
                sample_type = sample_type,
                protocol = protocol,
                page = page,
                page_size = page_size,
                sort_by = sort_by)

  params[["format"]] = "csv"
  csv.Url = build.Query(parameters = params, invoker = "Samples", method = "mRNASeq")
  params[["format"]] = "tsv"
  tsv.Url = build.Query(parameters = params, invoker = "Samples", method = "mRNASeq")
  params[["format"]] = "json"
  json.Url = build.Query(parameters = params, invoker = "Samples", method = "mRNASeq")

  csv.Data = download.Data(csv.Url, format = "csv", NULL)
  tsv.Data = download.Data(tsv.Url, format = "tsv", NULL)
  json.Data = download.Data(json.Url, format = "json", NULL)

  expect_is(csv.Data, "data.frame")
  expect_is(tsv.Data, "data.frame")
  expect_is(json.Data, "list")

  expect_more_than(nrow(csv.Data), 0)
  expect_more_than(nrow(tsv.Data), 0)
  expect_more_than(length(json.Data), 0)

})

test_that("Downloader does not break when result is empty", {

  csv.Url = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=csv&gene=PTEN%2CRUNX1%2CTP53&cohort=BLCA&sample_type=NB&protocol=RSEM&page=1&page_size=250&sort_by=gene"
  tsv.Url = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=tsv&gene=PTEN%2CRUNX1%2CTP53&cohort=BLCA&sample_type=NB&protocol=RSEM&page=1&page_size=250&sort_by=gene"
  json.Url = "http://firebrowse.org/api/v1/Samples/mRNASeq?format=json&gene=PTEN%2CRUNX1%2CTP53&cohort=BLCA&sample_type=NB&protocol=RSEM&page=1&page_size=250&sort_by=gene"

  expect_error(download.Data(csv.Url, format = "csv", NULL))
  expect_error(download.Data(tsv.Url, format = "tsv", NULL))
  expect_error(download.Data(json.Url, format = "json", NULL))

})
