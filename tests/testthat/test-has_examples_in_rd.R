context("has_examples_in_rd")

test_that("has_examples_in_rd: detect example", {
  filename <- find_path("f_with_examples.Rd")
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})


test_that("has_examples_in_rd: detect example of the function itself", {
  filename <- find_path("has_examples_in_rd.Rd")
  testit::assert(file.exists(filename))
  expect_true(has_examples_in_rd(filename))
})

test_that("has_examples_in_rd: detect examples are absent", {

  filename <- find_path("f_without_examples.Rd")
  testit::assert(file.exists(filename))
  expect_false(has_examples_in_rd(filename))
})

test_that("has_examples_in_rd: abuse", {
  expect_error(
    has_examples_in_rd("inva.lid"),
    "has_examples_in_rd: rd_filename does not exist"
  )
})

test_that("has_examples_in_rds: use", {

  filenames <- find_paths(c("f_with_examples.Rd", "f_without_examples.Rd"))
  testit::assert(file.exists(filenames[1]))
  testit::assert(file.exists(filenames[2]))

  expect_true(
    all.equal(has_examples_in_rds(filenames), c(TRUE, FALSE))
  )
})
