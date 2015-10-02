#' Return the API version this package was build for
#'
#' Returns the API version this package was build for, should match with version
#' at \url{http://firebrowse.org/api-docs}.
#'
#' @examples
#' API.Version()
#'
#' @return A character
#'
#' @export
API.Version = function(){
  number = "1.1.17"
  beta = T
  ret = ifelse(beta, paste("v", number, ":beta", sep=""), paste("v", number, sep=""))
  return(ret)
}


# Forms the version string for the API
reduce.API.Verion = function(version.String){
  version.String = substring(version.String, 1, 2)
  return(version.String)
  }

# Return the basic URL
Base.Url = function(){
  return("http://firebrowse.org/api")
}


# Puts together all parameters into string, which is later used to query the API
build.Query = function(parameters, invoker , method, mass = F){

  base.URL = Base.Url()
  api.Version = API.Version()
  api.Version = reduce.API.Verion(api.Version)

  url = paste(base.URL, api.Version, invoker, method, sep="/")
  if(mass == T){
    idx = which(names(parameters) != "format")
    mass.Q = paste(parameters[[idx]], collapse = "%2C")
    query = paste(mass.Q, "?format=", parameters[["format"]], collapse = "", sep = "")
    query = query[query != ""]
    final.Query = paste(url, "/", paste(unlist(query), collapse = "&"), sep="")
  } else{
    query = lapply(names(parameters), function(nam){
      if(parameters[[nam]][1] != "")
        return(paste(nam, "=", paste(parameters[[nam]], collapse = "%2C"), sep=""))
      else
        return("")
    })
    query = query[query != ""]
    final.Query = paste(url, "?", paste(unlist(query), collapse = "&"), sep="")
  }
  return(final.Query)
  }
