# This function actually retrives the data, it might be extended if needed
# for other objects
download.Data = function(url, format, page = NULL){

  if(exists("page")){
    if(is.null(page)){
      use.Header = T
    } else if(page == ""){
      use.Header = T
    } else if(page == 1){
      use.Header = T
    } else if(page > 1){
      use.Header = F
    }
  } else {
    use.Header = T
  }
  
  response = httr::GET(url)
  if (response$status_code == 200) {
    content = httr::content(response, as="text", encoding="UTF-8")
    connection = textConnection(content)
    if (content != "") {
      # CSV
      if(format == "csv"){
        result = tryCatch({
          read.csv(connection, header = use.Header, stringsAsFactors = F)
        }, warning = function(w) {
          warning(w)
          return(NULL)
        }, error = function(e){
          stop(e)
          return(NULL)
        })
      }
      # TSV
      if(format == "tsv"){
        result = tryCatch({
          read.table(connection, header = use.Header, sep = "\t", quote = "\"", stringsAsFactors = F)
        }, warning = function(w) {
          warning(w)
          return(NULL)
        }, error = function(e){
          stop(e)
          return(NULL)
        })
      }
      # JSON
      if(format == "json"){
        result = tryCatch({
          result = jsonlite::fromJSON(content, simplifyDataFrame = F,
                                      simplifyVector = F,
                                      simplifyMatrix = F)
        }, warning = function(w) {
          warning(w)
          return(NULL)
        }, error = function(e){
          stop(e)
          return(NULL)
        })
        if(length(result[[1]]) == 0 )
          result = NULL
      }
      close(connection)
      return(result)
    } else {
      stop("No samples matching your query")
    }
  } else {
    warning(paste("The API responded with code ", response$status_code),
            ". Your query might be to big", sep="")
  }
  return(NULL)
}
