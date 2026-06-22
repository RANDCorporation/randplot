# Internal package state ---------------------------------------------------------

.randplot_env <- new.env(parent = emptyenv())
.randplot_env$font <- "sans"

# Public API -------------------------------------------------------------------

#' Get the active randplot font family
#'
#' Returns the font family name that `theme_rand()` will use by default. This
#' is `"ABCMonumentGrotesk"` after a successful `rand_font_setup()`, or
#' `"sans"` if no font has been configured.
#'
#' @return A character string: the active font family name.
#' @seealso [rand_font_setup()]
#' @export
rand_font <- function() {
  .randplot_env$font
}

#' Configure ABC Monument Grotesk for randplot
#'
#' Registers ABC Monument Grotesk with showtext and saves the font location for
#' future sessions. After calling this once, randplot will load the font
#' automatically every time the package is loaded — no further setup needed.
#'
#' @param path Path to either:
#'   - A directory containing the ABC Monument Grotesk OTF/TTF files
#'     (e.g. the `Monument Grotesk/` folder from the DINAMO download), or
#'   - A zip archive from DINAMO (the OTF files are extracted automatically
#'     to a persistent location in your R user data directory).
#'
#' @return Invisibly returns `"ABCMonumentGrotesk"`.
#' @seealso [rand_font()]
#' @export
rand_font_setup <- function(path) {
  if (!requireNamespace("sysfonts", quietly = TRUE) ||
      !requireNamespace("showtext", quietly = TRUE)) {
    stop(
      "Packages 'sysfonts' and 'showtext' are required. ",
      "Install them with: install.packages(c('sysfonts', 'showtext'))"
    )
  }

  if (grepl("\\.zip$", path, ignore.case = TRUE)) {
    path <- .extract_monument_zip(normalizePath(path, mustWork = TRUE))
  } else {
    path <- normalizePath(path, mustWork = TRUE)
  }

  .register_monument(path)

  config_file <- .font_config_path()
  dir.create(dirname(config_file), recursive = TRUE, showWarnings = FALSE)
  writeLines(path, config_file)

  message("ABC Monument Grotesk configured. Path saved for future sessions.")
  invisible("ABCMonumentGrotesk")
}

# Internal helpers -------------------------------------------------------------

.font_config_path <- function() {
  file.path(tools::R_user_dir("randplot", "config"), "font_path.txt")
}

.extract_monument_zip <- function(zip_path) {
  dest <- tools::R_user_dir("randplot", "data")
  font_dir <- file.path(dest, "ABCMonumentGrotesk")

  if (!dir.exists(font_dir)) {
    dir.create(font_dir, recursive = TRUE)
    entries <- utils::unzip(zip_path, list = TRUE)$Name
    otf_entries <- entries[grepl("(^|/)ABCMonumentGrotesk-[^/]+\\.otf$", entries)]
    utils::unzip(zip_path, files = otf_entries, exdir = font_dir, junkpaths = TRUE)
  }
  font_dir
}

.register_monument <- function(font_dir) {
  regular    <- file.path(font_dir, "ABCMonumentGrotesk-Regular.otf")
  bold       <- file.path(font_dir, "ABCMonumentGrotesk-Bold.otf")
  italic     <- file.path(font_dir, "ABCMonumentGrotesk-RegularItalic.otf")
  bolditalic <- file.path(font_dir, "ABCMonumentGrotesk-BoldItalic.otf")

  if (!file.exists(regular)) {
    # Fallback: variable TTF at the zip root
    regular <- file.path(font_dir, "ABCMonumentGroteskVariable.ttf")
    bold <- italic <- bolditalic <- NULL
    if (!file.exists(regular)) {
      stop("ABCMonumentGrotesk-Regular.otf not found in: ", font_dir)
    }
  }

  args <- list(family = "ABCMonumentGrotesk", regular = regular)
  if (!is.null(bold)       && file.exists(bold))       args$bold <- bold
  if (!is.null(italic)     && file.exists(italic))     args$italic <- italic
  if (!is.null(bolditalic) && file.exists(bolditalic)) args$bolditalic <- bolditalic

  do.call(sysfonts::font_add, args)
  showtext::showtext_auto()
  .randplot_env$font <- "ABCMonumentGrotesk"
}

.register_inter <- function() {
  sysfonts::font_add_google("Inter", "Inter")
  showtext::showtext_auto()
  .randplot_env$font <- "Inter"
}

# Called from .onLoad ----------------------------------------------------------

.rand_load_fonts <- function() {
  if (!requireNamespace("sysfonts", quietly = TRUE) ||
      !requireNamespace("showtext", quietly = TRUE)) {
    return(invisible(NULL))
  }

  config_file <- .font_config_path()
  if (file.exists(config_file)) {
    path <- trimws(readLines(config_file, warn = FALSE))
    if (nchar(path) > 0 && dir.exists(path)) {
      ok <- tryCatch({ .register_monument(path); TRUE }, error = function(e) FALSE)
      if (ok) return(invisible(NULL))
    }
  }

  # No Monument Grotesk configured (or it failed) — fall back to Inter.
  tryCatch(.register_inter(), error = function(e) invisible(NULL))
}
