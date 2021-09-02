#' RAND color palettes for data visualization
#'
#' Access colors from the RAND color palettes.
#'
#' @details
#' `RandCatPal` is a palette of nine colorblind-safe colors for discrete data. Some of the colors in the `RandCatPal` palette are similar to people with some kinds of colorblindness, but the colors are still distinguishable.
#'
#' `RandGrayPal` is a palette of nine colorblind-safe shades of gray. It is provided for easier access to a standardized palette of grays, so it isn't necessarily well-suited for visualization.
#'
#' `show_rand_pal()` accepts one of "RandCatPal" or "RandGrayPal" and shows its colors.
#'
#' @section Palettes:
#' Use `RandCatPal` or `RandGrayPal` in a plot by passing one of them to `ggplot2::scale_color_manual()` or `ggplot2::scale_fill_manual()`.
#' \describe{
#'   \item{RandCatPal}{
#'     \itemize{
#'       \item #61c6c6
#'       \item #ce8644
#'       \item #c1536b
#'       \item #595a5a
#'       \item #e2c755
#'       \item #597cbe
#'       \item #45aF84
#'       \item #7995a5
#'       \item #af61a7
#'     }
#'   }
#'   \item{RandGrayPal}{
#'     \itemize{
#'       \item #f1f1f1
#'       \item #d7d7d7
#'       \item #bdbdbd
#'       \item #a4a4a4
#'       \item #8c8c8c
#'       \item #747474
#'       \item #5e5e5e
#'       \item #484848
#'       \item #333333
#'     }
#'   }
#' }
#'
#' @param palette_name One of "RandCatPal" or "RandGrayPal"
#' @rdname rand_pal
#' @name rand_pal
NULL
#'
#' @examples
#' \dontrun{
#' # Use RandCatPal in a plot ----------------------------------------
#' library(tidyverse)
#' library(scales)
#' library(gapminder)
#' library(randplot)
#'
#' gdp <-
#'   gapminder %>%
#'   filter(continent == "Oceania")
#'
#' ggplot(gdp, aes(x = year,
#'                 y = gdpPercap,
#'                 color = country)) +
#'   geom_line() +
#'   scale_x_continuous(expand = c(0, 0)) +
#'   scale_y_continuous(
#'     expand = c(0, 0),
#'     labels = dollar_format(),
#'     limits = c(0, max(gdp$gdpPercap) + 10000),
#'     position = "right"
#'   ) +
#'   scale_color_manual(values = RandCatPal) +
#'   xlab(NULL) +
#'   ylab("GDP per capita") +
#'   theme_rand()
#'
#'
#' # Preview palette colors ------------------------------------------
#'
#' # RandCatPal colors
#' show_rand_pal("RandCatPal")
#'
#' # RandGrayPal colors
#' show_rand_pal("RandGrayPal")
#' }
#' @rdname rand_pal
#' @export
RandCatPal <- c(
  "#61c6c6",
  "#ce8644",
  "#c1536b",
  "#595a5a",
  "#e2c755",
  "#597cbe",
  "#45aF84",
  "#7995a5",
  "#af61a7"
)

#' @rdname rand_pal
#' @export
RandGrayPal <- c(
  "#f1f1f1",
  "#d7d7d7",
  "#bdbdbd",
  "#a4a4a4",
  "#8c8c8c",
  "#747474",
  "#5e5e5e",
  "#484848",
  "#333333"
)

#' @rdname rand_pal
#' @export
show_rand_pal <- function(palette_name) {
  palette_names <- c("RandCatPal", "RandGrayPal")

  if (!(palette_name %in% palette_names)) {
    stop(paste0("Try \"RandCatPal\" or \"RandGrayPal\" instead of \"", palette_name, "\""))
  }

  palette <- get(palette_name) # Convert string to a variable, see https://cran.r-project.org/doc/FAQ/R-FAQ.html#How-can-I-turn-a-string-into-a-variable_003f
  palette_length <- length(palette)
  palette_vec <- 1:palette_length

  graphics::image(x = palette_vec,
        y = 1,
        z = as.matrix(palette_vec),
        col = palette,
        xlab = palette_name,
        ylab = "",
        xaxt = "n",
        yaxt = "n",
        bty = "n")
}
