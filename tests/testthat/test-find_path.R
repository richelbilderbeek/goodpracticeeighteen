context("find_path")

test_that("find_path: basic test", {
  path <- find_path("f_with_examples.Rd")
  expect_true(file.exists(path))
})

test_that("find_path: error on absent file", {
  expect_error(
    find_path("inva.lid"),
    "cannot find 'inva.lid'"
  )
})

test_that("find_paths: use", {

  filename1 <- "f_with_examples.Rd"
  filename2 <- "f_without_examples.Rd"
  path1 <- find_path(filename1)
  path2 <- find_path(filename2)
  paths <- find_paths(c(filename1, filename2))
  expect_equal(paths[1], path1)
  expect_equal(paths[2], path2)
})
