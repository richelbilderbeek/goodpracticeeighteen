context("f")

test_that("f_with_examples: use", {
  expect_output(f_with_examples(), "Hello")
})

test_that("f_without_examples: use", {
  expect_output(f_without_examples(), "Hello")
})
