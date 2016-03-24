# validet.Parameters tries to stop the execution, if maleformed arguments are
# provided, which could later blow the quiery.
validate.Parameters = function(params, to.Validate = ""){

  if(params[["format"]] == "json" & !requireNamespace("jsonlite", quietly = TRUE)) {
    stop("The package 'jsonlite' is needed...", call. = FALSE)
  }

  empty = lapply(to.Validate, function(x){
    nchar(params[[x]]) == 0
  })
  if(!F %in% unlist(empty) & length(unlist(empty)) > 0){
    msg = paste("At least one of these parameters must be given:",
                      paste(to.Validate, collapse = " OR "))
    stop(msg)
  }
}
