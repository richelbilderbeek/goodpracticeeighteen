context("has_examples_in_rd")

test_that("has_examples_in_rd: detect example", {
  filename <- ""
  tryCatch(
    filename <- paste0(devtools::package_file(), "/man/f_with_examples.Rd"),
    error = function(msg) { skip(msg$message)}
  )
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})


test_that("has_examples_in_rd: detect example of the function itself", {
  filename <- ""
  tryCatch(
    filename <- paste0(devtools::package_file(), "/man/has_examples_in_rd.Rd"),
    error = function(msg) { skip(msg$message)}
  )
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})

test_that("has_examples_in_rd: detect examples are absent", {
  filename <- ""
  tryCatch(
    filename <- paste0(devtools::package_file(), "/man/f_without_examples.Rd"),
    error = function(msg) { skip(msg$message)}
  )
  testit::assert(file.exists(filename))
  expect_false(has_examples_in_rd(filename))
})

test_that("has_examples_in_rd: abuse", {
  expect_error(
    has_examples_in_rd("inva.lid"),
    "has_examples_in_rd: rd_filename does not exist"
  )
})
