# This function actually retrives the data, it might be extended if needed
# for other objects
download.Data = function(url, format){

  if(format == "csv"){
    result = tryCatch({
      read.table(url, header = T, sep = ",", stringsAsFactors = F)
    }, warning = function(w) {
      NULL
    })
  }

  if(format == "tsv"){
    result = tryCatch({
      read.table(url, header = T, sep = "\t", stringsAsFactors = F)
    }, warning = function(w) {
      NULL
    })
  }

  if(format == "json"){
    result = tryCatch({
      result = jsonlite::fromJSON(url, simplifyDataFrame = F,
                                  simplifyVector = F,
                                  simplifyMatrix = F)
    }, warning = function(w) {
      NULL
    })
    if(length(result[[1]]) == 0 )
      result = NULL
  }

  return(result)
}
