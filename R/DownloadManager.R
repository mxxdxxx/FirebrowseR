# This function actually retrives the data, it might be extended if needed
# for other objects
download.Data = function(url, format, page){

  if(is.null(page)){
    use.Header = T
  } else if(page == ""){
    use.Header = T
  } else if(page == 1){
    use.Header = T
  } else if(page > 1){
    use.Header = F
  }

  if(format == "csv"){
    result = tryCatch({
      read.csv(url, header = use.Header, stringsAsFactors = F)
    }, warning = function(w) {
      return(NULL)
    }, error = function(e){
      return(NULL)
    })
  }

  if(format == "tsv"){
    result = tryCatch({
      read.table(url, header = use.Header, sep = "\t", quote = "\"", stringsAsFactors = F)
    }, warning = function(w) {
      return(NULL)
    }, error = function(e){
      return(NULL)
    })
  }

  if(format == "json"){
    result = tryCatch({
      result = jsonlite::fromJSON(url, simplifyDataFrame = F,
                                  simplifyVector = F,
                                  simplifyMatrix = F)
    }, warning = function(w) {
      return(NULL)
    }, error = function(e){
      return(NULL)
    })
    if(length(result[[1]]) == 0 )
      result = NULL
  }

  return(result)
}
