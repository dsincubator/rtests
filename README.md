# rtests

This meetup overviews writing tests in R, as part of the package development workflow. 

<img src=https://github.com/user-attachments/assets/bdab4d90-c1f0-4bfc-89d5-749b976cf466 width=500>

https://r-pkgs.org/whole-game.html#review

## Importance

* Good tests make your code more reliable and easier to maintain.  
* Writing tests is easiest when you use the structure of an R package, and the tools designed to build R packages. 

## Audience

Data scientists with some experience writing R code and functions but little or no experience writing tests in R packages.

## Objectives

- Infrastructure: Set up an R package and the infrastructure for tests.
- Anathomy: Notice the components of a test.
- Structure: Understand how to organize tests.
- Workflow: Run tests in multiple ways
- Report coverage.
- Test Driven Development (TDD).

## Demo

### Infrastructure

```r
usethis::create_package()
usethis::create_upkeep_issue()
```

### Anathomy

```
test_that("as.vector() strips names", {
  x <- c(a = 1, b = 2)
  expect_equal(as.vector(x), c(1, 2))
})
```

> A test starts by declaring the intent (“as.vector() strips names”) then uses regular R code to generate some test data. The test data is then compared to the expected result using a expectation, a function that starts with expect_. The first argument is some code to run, and the second argument describes the expected result: here we verify that the output of as.vector(x) equals c(1, 2).
> -- https://mastering-shiny.org/scaling-testing.html

### Workflow

In R/fun.R

```r
fun <- function(data) {
  stopifnot(is.data.frame(data)

  data
}
```

In tests/testthat/tests/test-load_file.R 

```r
test_that("does what you expect", {
  # Arrange
  data <- data.frame(x = 1)

  # Act
  out <- fun(data)

  # Assert
  expect_equal(out, expected = data)
  expect_error(fun(1), "not TRUE")  # or expect_snapshot_error(fun(1))
})
```

* Structure: File, test, expectation.

* Key expectations.

* Different ways to run tests:
  * Interactively
  * Whole test block
  * Whole test
  * Whole package

* [Keyboard shrotcuts](https://mastering-shiny.org/scaling-testing.html#keyboard-shortcuts)

## Resources 

- Tidyverse design principles
