context("rd_tags")

test_that("rd_tags: use", {
  rd_filename <- find_path("f_with_examples.Rd")
  doc <- tools::parse_Rd(rd_filename)
  expect_true(class(doc) == "Rd")
  tags <- rd_tags(doc)
  expect_true("\\examples" %in% tags)
})
