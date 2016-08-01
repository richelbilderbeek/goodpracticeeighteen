#' Finds the full path of a file
#' @param filename the name of a file
#' @return the full path of the filename if an existing file could be found, stops otherwise
#' @examples
#'   path <- find_path("has_examples_in_rd.Rd")
#'   testit::assert(file.exists(path))
#' @author Richel Bilderbeek
#' @export
find_path <- function(filename) {

  # Check local inst/extdata first
  prefixes <- c(
    "/home/richel/GitHubs/goodpracticeeighteen/inst/extdata/",               # nolint
    "/home/p230198/GitHubs/goodpracticeeighteen/inst/extdata/",              # nolint
    "/home/travis/build/richelbilderbeek/goodpracticeeighteen/inst/extdata/" # nolint
  )
  for (prefix in prefixes) {
    full_path <- paste0(prefix, filename)
    if (file.exists(full_path)) {
      return(full_path)
    }
  }

  # Check the library its candidate
  # From https://github.com/csgillespie/efficientR/issues/28
  #   p <- system.file(paste0("extdata/", filename), package = "goodpracticeeighteen") # nolint
  #   if (file.exists(p)) {                                               # nolint
  #     return (p)                                                        # nolint
  #   }                                                                   # nolint
  stop(
    "find_path: ",
    "cannot find '", filename, "'"
  )
}


#' Finds the full path of files
#' @param filenames the names of files
#' @return the full path of the filenames if an existing file could be found, stops otherwise
#' @examples
#'   filenames <- goodpracticeeighteen::find_paths(
#'     c("f_with_examples.Rd", "f_without_examples.Rd")
#'   )
#'   testit::assert(file.exists(filenames[1]))
#'   testit::assert(file.exists(filenames[2]))
#' @author Richel Bilderbeek
#' @export
find_paths <- function(filenames) {
  filenames <- as.vector(sapply(filenames, goodpracticeeighteen::find_path)) # nolint Why doesn't this work?
  filenames
}