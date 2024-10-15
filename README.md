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

### [Basic structure](https://mastering-shiny.org/scaling-testing.html#basic-structure) 

File, test, expectation.

### [Basic workflow](https://mastering-shiny.org/scaling-testing.html#basic-workflow)

In R/load_file.R

```r
load_file <- function(name, path) {
  ext <- tools::file_ext(name)
  switch(ext,
    csv = vroom::vroom(path, delim = ",", col_types = list()),
    tsv = vroom::vroom(path, delim = "\t", col_types = list()),
    validate("Invalid file; Please upload a .csv or .tsv file")
  )
}
```

In tests/testthat/tests/test-load_file.R

```r
test_that("load_file() handles all input types", {
  # Create sample data
  df <- tibble::tibble(x = 1, y = 2)
  path_csv <- tempfile()
  path_tsv <- tempfile()
  write.csv(df, path_csv, row.names = FALSE)
  write.table(df, path_tsv, sep = "\t", row.names = FALSE)
  
  expect_equal(load_file("test.csv", path_csv), df)
  expect_equal(load_file("test.tsv", path_tsv), df)
  expect_error(load_file("blah", path_csv), "Invalid file")
})
```

Different ways to run tests:

* Interactively: Ctrl/Cmd + Enter line by line.
* Whole test block: Ctrl/Cmd + Enter on `test_that( ...`.
* Whole test: `devtools::test_file()` or shortcut.
* Whole package: `devtools::test()` or shortcut.


## Resources 

- Tidyverse design principles
