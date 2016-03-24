#' Obtain identities of TCGA consortium member centers.
#' 
#' By default this function returns a table of all consortium members in TCGA, aka centers; it provides both the HTTP domain and full organizational name of each center.  A subset of this table may be obtained by explicitly specifying one or more domain names.
#'
#' @param format Format of result. Default value is json. While json,tsv,csv are available. 
#' @param center Narrow search to one or more TCGA centers from the scrollable list. Multiple values are allowed bcgsc.ca,broad.mit.edu,broadinstitute.org,genome.wustl.edu,hgsc.bcm.edu,hms.harvard.edu,hudsonalpha.org,intgen.org,jhu-usc.edu,jhu.edu,lbl.gov,mdanderson.org,mskcc.org,nationwidechildrens.org,pnl.gov,rubicongenomics.com,sanger.ac.uk,systemsbiology.org,ucsc.edu,unc.edu,vanderbilt.edu.
#' 
#' @export
Metadata.Centers = function(format = "json",
                             center = ""
                             ){
                             
  parameters = list(format = format,
                    center = center)
  
  validate.Parameters(params = parameters)

  url = build.Query(parameters = parameters,
                    invoker = "Metadata",
                    method = "Centers")
  ret = download.Data(url, format)

  return(ret)

}
