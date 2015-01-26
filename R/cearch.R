#' Search Canadiana
#'
#' @export
#' @import httr jsonlite
#'
#' @param query Query terms
#'
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' out <- cearch(query="railroads")
#' out$meta
#' out$facet
#' head(out$docs)
#' }
cearch <- function(query, ...) {
  args <- cacomp(list(q = query, fmt = "json"))
  ca_GET(cabase(), args, ...)
}
