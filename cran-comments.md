## Test environments
* local: OS X 10.10.2, R 3.2.0
* travis-ci: Ubuntu 12.04 LTS, R version 3.2.0
* devtools::build_win(), from devtools 1.7.0


### local
No errors, no warnings, no notes


### travis-ci
No errors, no warnings, no notes


### build_win
No errors, no warnings, 1 note:
* checking CRAN incoming feasibility ... NOTE
Maintainer: 'Mario Deng <mariodeng@googlemail.com>'
New submission


##Overall
No errors, no warnings, 1 note

##Personal note
curl needs to be put into suggestions, elsewise the json dowload, using the
jsonlite package, does not work. Could there possibly be a wrong declaration of
suggest/requires for curl within the jsonlite package?


## Downstream dependencies
Non, first version.
