#' Get individual record
#'
#' @export
#'
#' @param id (character) Record key
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' item("oocihm.00001")
#' }

item <- function(id, ...)
{
  ca_GET(paste0(cabase(), "/view/", id), list(fmt = "json"), ...)
}
