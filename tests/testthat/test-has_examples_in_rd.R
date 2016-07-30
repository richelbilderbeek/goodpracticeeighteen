context("has_examples_in_rd")

test_that("has_examples_in_rd: detect example", {
  filename <- paste0(getwd(), "/../../man/f_with_examples.Rd")
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})


test_that("has_examples_in_rd: detect example of the function itself", {
  filename <- paste0(getwd(), "/../../man/has_examples_in_rd.Rd")
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})

test_that("has_examples_in_rd: detect examples are absent", {
  filename <- paste0(getwd(), "/../../man/f_without_examples.Rd")
  testit::assert(file.exists(filename))
  expect_false(has_examples_in_rd(filename))
})
