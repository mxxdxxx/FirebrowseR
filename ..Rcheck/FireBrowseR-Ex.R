pkgname <- "FireBrowseR"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('FireBrowseR')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("Analyses.CopyNumber.Genes.All")
### * Analyses.CopyNumber.Genes.All

flush(stderr()); flush(stdout())

### Name: Analyses.CopyNumber.Genes.All
### Title: Retrieve all data by genes Gistic2 results.
### Aliases: Analyses.CopyNumber.Genes.All

### ** Examples

format = "csv"
cohort = "PRAD"
gene = "PTEN"
tcga_participant_barcode = c("TCGA-J4-A67O", "TCGA-G9-6496")
page = 1
page_size = 250
sort_by = "cohort"

obj = Analyses.CopyNumber.Genes.All(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

gene = ""
obj = Analyses.CopyNumber.Genes.All(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

format = "json"
obj = Analyses.CopyNumber.Genes.All(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)



cleanEx()
nameEx("Analyses.CopyNumber.Genes.Amplified")
### * Analyses.CopyNumber.Genes.Amplified

flush(stderr()); flush(stdout())

### Name: Analyses.CopyNumber.Genes.Amplified
### Title: Retrieve Gistic2 significantly amplified genes results.
### Aliases: Analyses.CopyNumber.Genes.Amplified

### ** Examples

format = "csv"
cohort = ""
gene = "PTEN"
q = 0.05
page = 1
page_size = 250
sort_by = "cohort"

obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)

gene = "PFN3"
obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)

format = "json"
obj = Analyses.CopyNumber.Genes.Amplified(format = format,
                                                cohort = cohort,
                                                gene = gene,
                                                q = q,
                                                page = page,
                                                page_size = page_size,
                                                sort_by = sort_by)



cleanEx()
nameEx("Analyses.CopyNumber.Genes.Deleted")
### * Analyses.CopyNumber.Genes.Deleted

flush(stderr()); flush(stdout())

### Name: Analyses.CopyNumber.Genes.Deleted
### Title: Retrieve Gistic2 significantly deleted genes results.
### Aliases: Analyses.CopyNumber.Genes.Deleted

### ** Examples

format = "csv"
cohort = ""
gene = "PTEN"
q = 0.05
page = 1
page_size = 250
sort_by = "cohort"

obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                              cohort = cohort,
                                              gene = gene,
                                              q = q,
                                              page = page,
                                              page_size = page_size,
                                              sort_by = sort_by)

gene = "PFN3"
obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                              cohort = cohort,
                                              gene = gene,
                                              q = q,
                                              page = page,
                                              page_size = page_size,
                                              sort_by = sort_by)

format = "json"
obj = Analyses.CopyNumber.Genes.Deleted(format = format,
                                              cohort = cohort,
                                              gene = gene,
                                              q = q,
                                              page = page,
                                              page_size = page_size,
                                              sort_by = sort_by)



cleanEx()
nameEx("Analyses.CopyNumber.Genes.Focal")
### * Analyses.CopyNumber.Genes.Focal

flush(stderr()); flush(stdout())

### Name: Analyses.CopyNumber.Genes.Focal
### Title: Retrieve focal data by genes Gistic2 results.
### Aliases: Analyses.CopyNumber.Genes.Focal

### ** Examples

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

gene = ""
obj = Analyses.CopyNumber.Genes.Focal(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

format = "json"
obj = Analyses.CopyNumber.Genes.Focal(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)



cleanEx()
nameEx("Analyses.CopyNumber.Genes.Thresholded")
### * Analyses.CopyNumber.Genes.Thresholded

flush(stderr()); flush(stdout())

### Name: Analyses.CopyNumber.Genes.Thresholded
### Title: Retrieve all thresholded by genes Gistic2 results.
### Aliases: Analyses.CopyNumber.Genes.Thresholded

### ** Examples

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

gene = ""
obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

format = "json"
obj = Analyses.CopyNumber.Genes.Thresholded(format = format,
                                cohort = cohort,
                                gene = gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)



cleanEx()
nameEx("Analyses.Mutation.MAF")
### * Analyses.Mutation.MAF

flush(stderr()); flush(stdout())

### Name: Analyses.Mutation.MAF
### Title: Retrieve MutSig final analysis MAF.
### Aliases: Analyses.Mutation.MAF

### ** Examples

format = "json"
cohort = ""
tool = "MutSig2CV"
gene = ""
tcga_participant_barcode = ""
column = ""
page = 1
page_size = 250
sort_by = c("gene")

obj = Analyses.Mutation.MAF(format = format,
                                cohort = cohort,
                                tool = tool,
                                gene =gene,
                                tcga_participant_barcode = tcga_participant_barcode,
                                column = column,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

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

gene = c("TP53", "RUNX1")
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



cleanEx()
nameEx("Analyses.Mutation.SMG")
### * Analyses.Mutation.SMG

flush(stderr()); flush(stdout())

### Name: Analyses.Mutation.SMG
### Title: Retrieve Significantly Mutated Genes (SMG).
### Aliases: Analyses.Mutation.SMG

### ** Examples

format = "json"
cohort = "PRAD"
tool = "MutSig2CV"
rank = ""
gene = ""
q = "0.01"
page = 1
page_size = 250
sort_by = "q"


parameters = list(format = format,
                  cohort = cohort,
                  tool = tool,
                  rank = rank,
                  gene = gene,
                  q = q,
                  page = page,
                  page_size = page_size,
                  sort_by = sort_by)

obj = Analyses.Mutation.SMG(format = format,
                                cohort = cohort,
                                tool = tool,
                                rank = rank,
                                gene = gene,
                                q = q,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

format = "tsv"
obj = Analyses.Mutation.SMG(format = format,
                                cohort = cohort,
                                tool = tool,
                                rank = rank,
                                gene = gene,
                                q = q,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

gene = c("TP53", "SPOP")
q = 0.05
obj = Analyses.Mutation.SMG(format = format,
                                cohort = cohort,
                                tool = tool,
                                rank = rank,
                                gene = gene,
                                q = q,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)
gene = ""
obj = Analyses.Mutation.SMG(format = format,
                                cohort = cohort,
                                tool = tool,
                                rank = rank,
                                gene = gene,
                                q = q,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)



cleanEx()
nameEx("Archives.StandardData")
### * Archives.StandardData

flush(stderr()); flush(stdout())

### Name: Archives.StandardData
### Title: Retrieve standard data archives.
### Aliases: Archives.StandardData

### ** Examples

format = "tsv"
date = "2014_12_06"
cohort = "BRCA"
data_type = "CopyNumber"
level = 3
page = 1
page_size = 250

obj = Archives.StandardData(format = format,
                                date = date,
                                cohort = cohort,
                                data_type = data_type,
                                level = level,
                                page = page,
                                page_size = page_size)

cohort = "PRAD"
data_type = "MAF"
level = 3
obj = Archives.StandardData(format = format,
                                date = date,
                                cohort = cohort,
                                data_type = data_type,
                                level = level,
                                page = page,
                                page_size = page_size)



cleanEx()
nameEx("Metadata.Centers")
### * Metadata.Centers

flush(stderr()); flush(stdout())

### Name: Metadata.Centers
### Title: Retrieve map of center name(s) to display name(s).
### Aliases: Metadata.Centers

### ** Examples

format = "csv"
center = c("intgen.org", "jhu-usc.edu")
obj = Metadata.Centers(format = format, center = center)



cleanEx()
nameEx("Metadata.ClinicalTier1")
### * Metadata.ClinicalTier1

flush(stderr()); flush(stdout())

### Name: Metadata.ClinicalTier1
### Title: Retrieve names of all available clinical data elements (CDEs).
### Aliases: Metadata.ClinicalTier1

### ** Examples

format = "csv"
obj = Metadata.ClinicalTier1(format = format)

format = "tsv"
obj = Metadata.ClinicalTier1(format = format)



cleanEx()
nameEx("Metadata.Cohort")
### * Metadata.Cohort

flush(stderr()); flush(stdout())

### Name: Metadata.Cohort
### Title: Retrieve cohort description.
### Aliases: Metadata.Cohort

### ** Examples

format = "csv"
cohort = c("PRAD", "BRCA")

obj = Metadata.Cohort(format = format,
                       cohort = cohort)

format = "tsv"
cohort = c("PRAD", "BRCA")

obj = Metadata.Cohort(format = format,
                       cohort = cohort)



cleanEx()
nameEx("Metadata.Cohorts")
### * Metadata.Cohorts

flush(stderr()); flush(stdout())

### Name: Metadata.Cohorts
### Title: Retrieve map of cohort abbreviation(s) to cohort name(s).
### Aliases: Metadata.Cohorts

### ** Examples

format = "csv"
cohort = c("PRAD", "BRCA")

obj = Metadata.Cohorts(format = format,
                       cohort = cohort)

format = "tsv"
cohort = c("PRAD", "BRCA")

obj = Metadata.Cohorts(format = format,
                       cohort = cohort)



cleanEx()
nameEx("Metadata.Counts")
### * Metadata.Counts

flush(stderr()); flush(stdout())

### Name: Metadata.Counts
### Title: Retrieve sample counts.
### Aliases: Metadata.Counts

### ** Examples

format = "csv"
date = "2015_02_04"
cohort = c("PRAD", "BRCA")
sample_type = ""
data_type = ""
totals = TRUE
obj = Metadata.Counts(format = format,
                               date = date,
                               cohort = cohort,
                               sample_type = sample_type,
                               data_type = data_type,
                               totals = totals)

format = "tsv"
cohort = c("PRAD", "BRCA")
sample_type = "Tumor"
data_type = c("methylation", "maf")
totals = TRUE

obj = Metadata.Counts(format = format,
                               date = date,
                               cohort = cohort,
                               sample_type = sample_type,
                               data_type = data_type,
                               totals = totals)



cleanEx()
nameEx("Metadata.Dates")
### * Metadata.Dates

flush(stderr()); flush(stdout())

### Name: Metadata.Dates
### Title: Retrieve list of Firehose standard data and analyses dates.
### Aliases: Metadata.Dates

### ** Examples

format = "csv"
obj = Metadata.Dates(format = format)

format = "tsv"
obj = Metadata.Dates(format = format)



cleanEx()
nameEx("Metadata.HeartBeat")
### * Metadata.HeartBeat

flush(stderr()); flush(stdout())

### Name: Metadata.HeartBeat
### Title: Simple way to discern whether API server is up and running
### Aliases: Metadata.HeartBeat

### ** Examples

format = "csv"
obj = Metadata.HeartBeat(format = format)



cleanEx()
nameEx("Metadata.Platforms")
### * Metadata.Platforms

flush(stderr()); flush(stdout())

### Name: Metadata.Platforms
### Title: Retrieve map of platform code(s) to platform name(s).
### Aliases: Metadata.Platforms

### ** Examples

format = "csv"
obj = Metadata.Platforms(format = format)

format = "tsv"
obj = Metadata.Platforms(format = format)
platform = c("454", "ABI", "biotab")
obj = Metadata.Platforms(format = format,
                         platform = platform)



cleanEx()
nameEx("Metadata.SampleType.Barcode")
### * Metadata.SampleType.Barcode

flush(stderr()); flush(stdout())

### Name: Metadata.SampleType.Barcode
### Title: Return a sample type code to short letter code mapping.
### Aliases: Metadata.SampleType.Barcode

### ** Examples

format = "csv"
tcga_participant_barcode = c("TCGA-GF-A4EO-06",
                             "TCGA-EL-A3D5-01A-22D-A202-08")
obj = Metadata.SampleType.Barcode(format = format,
                                  tcga_participant_barcode = tcga_participant_barcode)



cleanEx()
nameEx("Metadata.SampleType.Code")
### * Metadata.SampleType.Code

flush(stderr()); flush(stdout())

### Name: Metadata.SampleType.Code
### Title: Translate from numeric sample type code to short letter code.
### Aliases: Metadata.SampleType.Code

### ** Examples

format = "csv"
code = c(50, 60)
obj = Metadata.SampleType.Code(format = format, code = code)



cleanEx()
nameEx("Metadata.SampleType.ShortLetterCode")
### * Metadata.SampleType.ShortLetterCode

flush(stderr()); flush(stdout())

### Name: Metadata.SampleType.ShortLetterCode
### Title: Translate from sample type short letter code to numeric code.
### Aliases: Metadata.SampleType.ShortLetterCode

### ** Examples

format = "csv"
short_letter_code = c("TR", "TR")
obj = Metadata.SampleType.ShortLetterCode(format = format,
short_letter_code = short_letter_code)



cleanEx()
nameEx("Metadata.SampleTypes")
### * Metadata.SampleTypes

flush(stderr()); flush(stdout())

### Name: Metadata.SampleTypes
### Title: Return a sample type code to short letter code mapping.
### Aliases: Metadata.SampleTypes

### ** Examples

format = "csv"
obj = Metadata.SampleTypes(format = format)

format = "tsv"
obj = Metadata.SampleTypes(format = format)



cleanEx()
nameEx("Samples.ClinicalTier1")
### * Samples.ClinicalTier1

flush(stderr()); flush(stdout())

### Name: Samples.ClinicalTier1
### Title: Retrieve clinical pick tier 1 data.
### Aliases: Samples.ClinicalTier1

### ** Examples

format = "json"
cohort = ""
tcga_participant_barcode = ""
tier1_cde_name = ""
page = 1
page_size = 250
sort_by = "cohort"

obj = Samples.ClinicalTier1(format = format,
                                cohort = cohort,
                                tcga_participant_barcode = tcga_participant_barcode,
                                tier1_cde_name = tier1_cde_name,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

format = "csv"
obj = Samples.ClinicalTier1(format = format,
                                cohort = cohort,
                                tcga_participant_barcode = tcga_participant_barcode,
                                tier1_cde_name = tier1_cde_name,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)

tcga_participant_barcode = "TCGA-GF-A4EO"
obj = Samples.ClinicalTier1(format = "tsv",
                                cohort = cohort,
                                tcga_participant_barcode = tcga_participant_barcode,
                                tier1_cde_name = tier1_cde_name,
                                page = page,
                                page_size = page_size,
                                sort_by = sort_by)



cleanEx()
nameEx("Samples.mRNASeq")
### * Samples.mRNASeq

flush(stderr()); flush(stdout())

### Name: Samples.mRNASeq
### Title: Retrieve mRNASeq data
### Aliases: Samples.mRNASeq

### ** Examples

format = "json"
gene = c("AKT3", "RB1", "MAP3K1")
cohort = "BRCA"
tcga_participant_barcode = ""
sample_type = "NT"
protocol = "RSEM"
page = 1
page_size = 250
sort_by = "gene"
obj = Samples.mRNASeq(format = format, gene, cohort, tcga_participant_barcode,
                          sample_type, protocol, page, page_size, sort_by)
# returns a list from json

obj = Samples.mRNASeq(gene = c("TP53", "RUNX1"))
# returns a data frame, default



cleanEx()
nameEx("Samples.miRSeq")
### * Samples.miRSeq

flush(stderr()); flush(stdout())

### Name: Samples.miRSeq
### Title: Retrieve miRSeq data
### Aliases: Samples.miRSeq

### ** Examples

format = "json"
mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p","hsa-mir-221-3p",
        "hsa-mir-10b-5p","hsa-mir-608","hsa-mir-324-5p")
cohort = "BRCA"
tcga_participant_barcode = ""
tool = "miRseq_Mature_Preprocess"
sample_type = "NT"
page = 1
page_size = 250
sort_by = "mir"

# Get results in json format/list
obj = Samples.miRSeq(format = format,
                        mir = mir,
                        cohort = cohort,
                        tcga_participant_barcode = tcga_participant_barcode,
                        tool = tool,
                        sample_type = sample_type,
                        page = page,
                        page_size = page_size,
                        sort_by = sort_by)

# Nor as CSV
format = "csv"
mir = c("hsa-mir-1285-3p", "hsa-mir-125a-5p")
obj = Samples.miRSeq(format = format,
                        mir = mir,
                        cohort = cohort,
                        tcga_participant_barcode = tcga_participant_barcode,
                        tool = tool,
                        sample_type = sample_type,
                        page = page,
                        page_size = page_size,
                        sort_by = sort_by)

# And just by miR IDs, without any other restrictions
obj = Samples.miRSeq(mir = c("hsa-mir-1285-3p","hsa-mir-125a-5p"))



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
