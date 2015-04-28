#Update
The Firebrowse API changed to version 1.1.1. beta. And some changes took place

## New Methods
`Analyses.mRNASeq.Quartiles` was added, which serves the quartiles and extrema
for a gene of interest. Using these values, boxplots can directly be drawn from
the data.

## Description Updates
Some method descriptions received an update, therefor I incorporated all new
descriptions, too me they seem more clearly. If you struggle please take a look
at the version history for the old descriptions

## No header returned
Now, if you iterate over pages, for the second and all further pages no header
is returned. This means that you have to incoporate the colnames from the first
page returned. Plase see take a look at the vignette for an example.

## Not fixed
The `Analyses.FeatureTable` function still returns an additional column, if the
`columns` parameter is used. This column is called `_id` and  removed by the
implementation, so no need to hazzle.

## Known Bugs
If you use the `Metadata.Counts` method and specify the `data_type` parameters,
the API returns an error. The implementation is catching this and returns a
`NULL` object. This bug is known.
