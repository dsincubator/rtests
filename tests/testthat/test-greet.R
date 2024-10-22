test_that("works", {
  expect_equal(greet(), "hello world")
})

test_that("works", {
  expect_equal(greet(name = "mauro"), "hello mauro")
})
