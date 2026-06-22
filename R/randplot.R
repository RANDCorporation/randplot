#' randplot
#'
#' The randplot package provides a ggplot2 theme and functions to make graphics in RAND style.
#'
#' @docType package
#' @name randplot
NULL

.onLoad <- function(libname, pkgname) {
  .rand_load_fonts()
}
