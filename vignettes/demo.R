## ------------------------------------------------------------------------
library(goodpracticeeighteen)

## ------------------------------------------------------------------------
filename <- find_path("f_with_examples.Rd")
testit::assert(has_examples_in_rd(filename))
filename <- find_path("f_without_examples.Rd")
testit::assert(!has_examples_in_rd(filename))

## ------------------------------------------------------------------------
filenames <- find_paths(c("f_with_examples.Rd", "f_without_examples.Rd"))
testit::assert(has_examples_in_rds(filenames) == c(TRUE, FALSE))

