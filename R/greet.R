#' Greet
#'
#' @param name String. Your name.
#'
#' @return String
#' @export
#'
#' @examples
#' greet()
#' greet("mauro")
greet <- function(name = NULL) {
  name <- name %||% "world"
  paste("hello", name)
}
