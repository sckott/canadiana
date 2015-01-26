cabase <- function() "http://search.canadiana.ca"

makeurl <- function(url, x) if(is.null(x)) paste0(url, "/search") else paste0(url, "/", x)

ca_GET <- function(url, args, ...) {
  res <- httr::GET(url, query=args, ...)
  httr::stop_for_status(res)
  text <- httr::content(res, as = "text")
  jsonlite::fromJSON(text, simplifyVector = FALSE, simplifyDataFrame = TRUE)
}

cacomp <- function (l) Filter(Negate(is.null), l)

get_meta <- function(x){
  x[c('request','page','pages','next_page',
      'hits','hits_per_page','hits_from','hits_to',
      'version','pubmin','pubmax')]
}

parse_facet <- function(z){
  list(contributor = fparser(z$contributor, c("contrib","count")),
       lang = fparser(z$lang, c("lang","count")),
       collection = fparser(z$collection, c("coll","count")),
       media = fparser(z$media, c("format","count"))
  )
}

fparser <- function(x, nms){
  if(length(x) == 0){
    NULL
  } else {
    nums <- seq(1, length(x), by=2)
    nums <- do.call("c", lapply(nums, function(b) c(b, b)))
    do.call(rbind, lapply(split(x, nums), function(v){
      setNames(data.frame(v, stringsAsFactors = FALSE), nms)
    }))
  }
}

# parse_docs <- function(z){
#   tt <- lapply(z, function(w){
#     lapply(w, function(v){
#       if(length(v) == 1) unlist(v) else v
#     })
#   })
#   do.call(rbind_fill, tt)
# }
