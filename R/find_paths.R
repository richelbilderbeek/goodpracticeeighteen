#' Finds the full path of a file
#' @param filename the name of a file
#' @return the full path of the filename if an existing file could be found, stops otherwise
#' @examples
#'   path <- find_path("has_examples_in_rd.Rd")
#'   testit::assert(file.exists(path))
#' @author Richel Bilderbeek
#' @export
find_path <- function(filename) {
<<<<<<< HEAD
  full_path_filename <- system.file(
    "inst/extdata", filename, package = "goodpracticeeighteen"
  )
  if (!file.exists(full_path_filename)) {}
    stop(
=======

  full_path <- system.file(
     "extdata", filename, package = "goodpracticeeighteen"
   )

  if (file.exists(full_path)) {
    return(full_path)
  }

  stop("cannot find '", filename, "'")
>>>>>>> b87369c1499112dfe4116f302ce8e7fefed32f83
  full_path_filename
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
  filenames <- as.vector(
    vapply(
      filenames,
      goodpracticeeighteen::find_path,
      FUN.VALUE = "string"
    )
  )
  filenames
}
