## Test environments
* local: OS X 10.10.2, R 3.2.0
* travis-ci: Ubuntu 12.04 LTS, R version 3.2.0
* devtools::build_win(), from devtools 1.7.0


### devtools::check(), local
Status: 2 NOTEs
1) * checking dependencies in R code ... NOTE
Namespace in Imports field not imported from: ‘curl’
  All declared Imports should be used.
2) * checking top-level files ... NOTE
Non-standard files/directories found at top level:
  ‘README.html’ ‘data-raw’
  
1) curl needs to be imported for the read.table() function, when used to download
from a web server
2) This just defines my RAW-Data


### R CMD check results, travis-ci
I added R_BUILD_ARGS="--no-manual" to the env, elsewise travis requires a pdf
and does not accept a html version only.


### R CMD check results, local
No Errors, no warnings, same notes as in local
http://win-builder.r-project.org/llUx8ad9GRgL/00check.log


##Overall
There were no ERRORs or WARNINGs. 


## Downstream dependencies
Non, first version.
