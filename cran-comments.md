## Test environments
* local: OS X 10.10.2, R 3.2.0
* travis-ci: Ubuntu 12.04 LTS, R version 3.2.0
* devtools::build_win(), from devtools 1.7.0


### local


### travis-ci
I added R_BUILD_ARGS="--no-manual" to the env, elsewise travis requires a pdf
and does not accept a html version only.


### build_win


##Overall
There were no ERRORs or WARNINGs. 


## Downstream dependencies
Non, first version.
