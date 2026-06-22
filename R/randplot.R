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

.onAttach <- function(libname, pkgname) {
  f <- .randplot_env$font
  if (f == "ABCMonumentGrotesk") {
    packageStartupMessage("randplot: using ABC Monument Grotesk.")
  } else {
    packageStartupMessage(
      "randplot: using ", f, ". ",
      "To configure ABC Monument Grotesk, call rand_font_setup()."
    )
  }
}
