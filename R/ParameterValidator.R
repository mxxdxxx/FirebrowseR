# validet.Parameters tries to stop the execution, if maleformed arguments are
# provided, which could later blow the quiery.
validet.Parameters = function(params){

  if(params[["format"]] == "json" & !requireNamespace("jsonlite", quietly = TRUE)) {
    stop("The package 'jsonlite' is needed...", call. = FALSE)
  }

}
