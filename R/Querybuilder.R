# Return the basic URL
Base.Url = function(){
  return("http://firebrowse.org/api")
}

# Returns the current API version
API.Version = function(){
  number = 1
  return(paste("v", number, sep=""))
}

# Puts together all parameters into string, which is later used to query the API
build.Query = function(parameters, invoker , method, mass = F){

  base.URL = Base.Url()
  api.Version = API.Version()

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
