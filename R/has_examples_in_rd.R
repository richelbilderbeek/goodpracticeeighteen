#' Checks if an R documentation file supplies one or more examples
#' @param  rd_filename name of an R documentation (.Rd) file. These are located in a package its 'man' folder
#' @return TRUE or FALSE
#' @examples
#'   filename <- paste0(getwd(), "/man/has_examples_in_rd.Rd")
#'   if (file.exists(filename)) {
#'     testit::assert(has_examples_in_rd(filename))
#'   }
#' @export
#' @author Richel Bilderbeek
has_examples_in_rd <- function(rd_filename) {
  if (!file.exists(rd_filename)) {
    stop("has_examples_in_rd: rd_filename does not exist")
  }
  doc <- tools::parse_Rd(rd_filename)
  testit::assert(class(doc) == "Rd")
  tags <- tools:::RdTags(doc)
  has_examples <- "\\examples" %in% tags
  has_examples
}
