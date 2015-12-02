---
title: "FirebrowseR - An 'API' Client for Broads 'Firehose' Pipeline"
author: "Mario Deng"
date: "2015-05-04"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{FirebrowseR - An 'API' Client for Broads 'Firehose' Pipeline}
  %\VignetteEngine{knitr::rmarkdown}
  %\usepackage[utf8]{inputenc}
---

# Firebrowser
An API Client for Broads Firehose pipeline.

## Introduction
FirebrowseR is an API client for the [Firehose Pipeline](http://gdac.broadinstitute.org/), provided by the [Broad Institute](https://www.broadinstitute.org/), which generates the most data sets used by [TCGA](https://tcga-data.nci.nih.gov/tcga/). To access the data provided by the Firehose Pipeline the Broad Institute provides several tools. One of these tools is the [Firebrowser](http://firebrowse.org/), which also serves a [Web-API](http://firebrowse.org/api-docs/). This API is queried by this R package, FirebrowseR, giving you easy access to genomic data sets. Therefor you don't have to download each data set on it's own, from TCGA or Firehose.

## Scope of FirebrowseR
This package is designed to give easy access to Firehose/TCGA data sets for R programmers. Therefor it's implementing all functions provided by the Firebrowse API, which lets one comfortable query and download data sets. This package does not provide any additional functions, methods or tools to (pre-) process, analyze or evaluate the data sets named below.

## Structure of the API
The [API](http://firebrowse.org/api-docs/) divides into four categories, namely:

1. Samples
    * Gives access to data types which did not receive a functional analysis.
1. Analyses
    * Data sets included here a pre-processed, since the RAW-data would be too big.
1. Archives
    * Allows one to download big compressed archives, including the larger data sets.
1. Metadata
    * Here one can assess all information needed to design and build cohorts etc..
    
Here you can find everyhing which is also available at the TCGA or the Firehose pipeline, but 

## Getting around
FirebrowseR provides all functions displayed in the [API-Documentation](http://firebrowse.org/api-docs/), having exactly the same names and arguments. Also each function has its own help page, accessible by `?function_name`, giving explanations and examples needed for this function. Further four additional data frames are provided; namely

* data_types,
    * Needed for: `Metadata.Counts` and `Archives.StandardData`
* tools,
    * Needed for: `Samples.miRSeq`, `Analyses.Mutation.MAF`,
    `Analyses.Mutation.SMG` and `Archives.StandardData`
* protocols and
    * Needed for: `Samples.mRNASeq`, `Archives.StandardData`
* sample.Types.
    * Needed to extract the definitions of _Code_ and _Short.Letter.Code_

supplying additional information, which maybe required for some queries but not provided by the API.


## Usage

### Example, Breast Cancer mRNA expression
In this first example we are going to analyze mRNA expression data of breast cancer. We take a look at some genes well known to be differentially expressed within this entity of cancer.
At first, we have to design our cohort. The method `Metadata.Cohorts` returns all cohort identifiers and their corresponding description. Within the description we search for "breast", yielding to identifier for breast cancer.

```r
require(FirebrowseR)
cohorts = Metadata.Cohorts() # Download all available cohorts
cancer.Type = cohorts[grep("breast", cohorts$description, ignore.case = T), 1]
print(cancer.Type)
```

Now that we know that the breast cancer samples are identified be `BRCA`, we can retrieve a list of all patients associated with this identifier.

```r
brca.Pats = Samples.ClinicalTier1(cohort = cancer.Type)
dim(brca.Pats)
```

The code above, looking at the dimensions of the returned data frame, indicates that there are only 250 patients, which does not correspond the number given at the [Firebrowse website](http://firebrowse.org/). This is due to the fact, that the Firebrowse API returns the data by pages, with a default page size of 250 entries (this holds for all functions/queries). The global limit for the page size is 2000.
We can resolve this issue by iterating over the pages, until we receive a data frame with less than the page size (250) entries. Also we need to adopt the column names from the first frame, since the API does not return column names for page > 1.

```r
all.Received = F
page.Counter = 1
brca.Pats = list()
while(all.Received == F){
  brca.Pats[[page.Counter]] = Samples.ClinicalTier1(cohort = cancer.Type,
                                                    page = page.Counter)
  if(page.Counter > 1)
    colnames(brca.Pats[[page.Counter]]) = colnames(brca.Pats[[page.Counter-1]])
  
  if(nrow(brca.Pats[[page.Counter]]) < 250){
    all.Received = T
  } else{
    page.Counter = page.Counter + 1
  }
}
brca.Pats = do.call(rbind, brca.Pats)
dim(brca.Pats)
```

Now we got all patients (1080).
Here we reduce the number of patients to the once who died. We only do this to keep the runtime short, downloading mRNA expression data for a thousand patients would take a lot of time, later on.

```r
brca.Pats = brca.Pats[ which(brca.Pats$vital_status == 1), ]
```

Here we define a vector containing genes known to be differentially expressed in breast cancer and download the mRNA expression data for these genes and our patients.

```r
diff.Exp.Genes = c("ESR1", "GATA3", "XBP1", "FOXA1", "ERBB2", "GRB7", "EGFR",
                   "FOXC1", "MYC")
all.Found = F
page.Counter = 1
mRNA.Exp = list()
page.Size = 1000 # using a bigger page size is faster
while(all.Found == F){
  mRNA.Exp[[page.Counter]] = Samples.mRNASeq(gene = diff.Exp.Genes,
                                             tcga_participant_barcode =
                                               brca.Pats$tcga_participant_barcode,
                                             page_size = page.Size,
                                             page = page.Counter)
  
  if(page.Counter > 1)
    colnames(mRNA.Exp[[page.Counter]]) = colnames(mRNA.Exp[[page.Counter-1]])
  if(nrow(mRNA.Exp[[page.Counter]]) < page.Size)
    all.Found = T
  else
    page.Counter = page.Counter + 1
}
mRNA.Exp = do.call(rbind, mRNA.Exp)
dim(mRNA.Exp)
```

We only keep the samples having a primary tumor and corresponding normal tissue available. Normal tissue is encoded by `NT` and tumor tissue by `TP`. Some Firehose functions require these identifiers or numbers. Since the API does not provide a function to decode the meaning of these identifiers, the data frame `sample.Type` included in this package does.

```r
# Patients with normal tissue
normal.Tissue.Pats = which(mRNA.Exp$sample_type == "NT")
# get the patients barcodes
patient.Barcodes = mRNA.Exp$tcga_participant_barcode[normal.Tissue.Pats] 
# Subset the mRNA.Exp data frame, keeping only the pre-selected barcodes AND
# having a sample type of NT or TP
mRNA.Exp = mRNA.Exp[which(mRNA.Exp$tcga_participant_barcode %in% patient.Barcodes &
                            mRNA.Exp$sample_type %in% c("NT", "TP")), ]
```

Now we can use the famous ggplot2 package to plot the expression.

```r
require(ggplot2)
p = ggplot(mRNA.Exp, aes(factor(gene), z.score))
p +
  geom_boxplot(aes(fill = factor(sample_type))) +
  # we drop some outlier, so plot looks nicer, this also causes the warning
  scale_y_continuous(limits = c(-1, 5)) +
  scale_fill_discrete(name = "Tissue")
```

### Example, Clustering cancer entities by SMGs

In 2013 Kandoth et al. published a wonderful manuscript showing that cancer entities can by distinguished by a mutational profile of significant mutated genes (SMGs). Therefor thei download the data from the TCGA by hand and worked it up. This can now be done by calling the API.

