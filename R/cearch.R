#' Search Canadiana
#'
#' @export
#' @import httr jsonlite
#'
#' @param q (character) Query terms, full text field
#' @param au (character) Author/creator names, full text field
#' @param ti (character) Titles, full text field
#' @param su (character) Subject headings/keywords, full text field
#' @param contributor (character) Contributor code
#' @param media (character) Media type, one of text, image, audio, video, data, or plaintext
#' @param lang (character) Document language, a 3 letter code from ISO 693-3,
#' \url{http://www-01.sil.org/iso639-3/codes.asp}
#' @param set (character) Index subset
#' @param type (character) Type of record, one of any, document, series, page, or
#' default (document and series)
#' @param key (character) Record unique key
#' @param pkey (character) Record parent key
#' @param df (character) Date from
#' @param dt (character) Date to
#' @param sort (character) Sort direction, one of oldest or newest
#' @param page (integer) Page number
#' @param ... Curl options passed on to \code{\link[httr]{GET}}
#' @examples \dontrun{
#' out <- cearch(q="railroads")
#' out$meta
#' out$facet
#' head(out$docs)
#'
#' # various search egs
#' cearch("rail*")$meta
#' cearch("rail yards")$meta
#' cearch('"rail yards" -railway')$meta
#' cearch('rail yard | car')$meta
#' cearch('su:railroads')$meta
#' cearch(su="railroads")$meta
#' cearch(su="railroads", q="su:Newfoundland")$meta
#'
#' # By language
#' cearch(lang="spa")$meta
#'
#' # By record type
#' cearch(type="page")$meta
#'
#' # dates
#' cearch(q="railroads", df=1800, dt=1820)$meta
#'
#' # sorting
#' cearch(q="railroads", df=1800, dt=1820, sort="oldest")$docs
#'
#' # paging
#' cearch(q="railroads", page=2)$meta
#' }

cearch <- function(q = NULL, au = NULL, ti = NULL, su = NULL, contributor = NULL,
  media = NULL, lang = NULL, set = NULL, type = NULL, key = NULL, pkey = NULL, df = NULL,
  dt = NULL, sort = NULL, page=NULL, ...)
{
  args <- cacomp(list(q = q, au = au, ti = ti, su = su, contributor = contributor,
                      media = media, lang = lang, set = set, t = type, key = key,
                      pkey = pkey, df = df, dt = dt, sort = sort, fmt = "json"))
  res <- ca_GET(makeurl(cabase(), page), args, ...)
  list(meta=get_meta(res), facet=parse_facet(res$facet), docs=res$docs)
}
