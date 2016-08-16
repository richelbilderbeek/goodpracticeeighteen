#' Copy of tools::RdTags. Because tools::RdTags
#' is not an exported function, I duplicated its code.
#' @param rd a parsed .Rd file, as produced by tools::parse_Rd
#' @return the tags in the parsed .Rd file
#' @examples
#'   rd_filename <- find_path("f_with_examples.Rd")
#'   doc <- tools::parse_Rd(rd_filename)
#'   testit::assert(class(doc) == "Rd")
#'   tags <- rd_tags(doc)
#'   testit::assert("\\examples" %in% tags)
#' @export
#' @author Richel Bilderbeek
rd_tags <- function(rd)
{
  res <- sapply(rd, attr, "Rd_tag")
  if (!length(res))
    res <- character()
  res
}
