#' Checks if an R documentation file supplies one or more examples
#' @param  rd_filename name of an R documentation (.Rd) file. These are located in a package its 'man' folder
#' @return TRUE or FALSE
#' @examples
#'   filename <- find_path("f_with_examples.Rd")
#'   testit::assert(has_examples_in_rd(filename))
#'   filename <- find_path("f_without_examples.Rd")
#'   testit::assert(!has_examples_in_rd(filename))
#'
#' @export
#' @author Richel Bilderbeek
has_examples_in_rd <- function(rd_filename) {
  if (!file.exists(rd_filename)) {
    stop("rd_filename does not exist")
  }
  doc <- tools::parse_Rd(rd_filename)
  testit::assert(class(doc) == "Rd")
  tags <- goodpracticeeighteen::rd_tags(doc)
  has_examples <- "\\examples" %in% tags
  has_examples
}




#' Checks if an R documentation file supplies one or more examples
#' @param  rd_filenames names of R documentation (.Rd) files. These are commonly located in a package its 'man' folder
#' @return a vector of which every element may be TRUE, FALSE or NA
#' @examples
#'   filenames <- find_paths(c("f_with_examples.Rd", "f_without_examples.Rd"))
#'   testit::assert(has_examples_in_rds(filenames) == c(TRUE, FALSE))
#' @export
#' @author Richel Bilderbeek
has_examples_in_rds <- function(rd_filenames) {

  v <- rep(NA, times = length(rd_filenames))
  i <- 1
  for (filename in rd_filenames) {
    tryCatch(
      v[i] <- has_examples_in_rd(filename),
      error = function(msg) {
        # Nothing
      }
    )
    i <- i + 1
  }
  v
}
