% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/has_examples_in_rd.R
\name{has_examples_in_rds}
\alias{has_examples_in_rds}
\title{Checks if an R documentation file supplies one or more examples}
\usage{
has_examples_in_rds(rd_filenames)
}
\arguments{
\item{rd_filenames}{names of R documentation (.Rd) files. These are commonly located in a package its 'man' folder}
}
\value{
a vector of which every element may be TRUE, FALSE or NA
}
\description{
Checks if an R documentation file supplies one or more examples
}
\examples{
  filenames <- find_paths(c("f_with_examples.Rd", "f_without_examples.Rd"))
  testit::assert(has_examples_in_rds(filenames) == c(TRUE, FALSE))
}
\author{
Richel Bilderbeek
}

