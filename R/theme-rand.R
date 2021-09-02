#' Apply the RAND theme
#'
#' This is the RAND ggplot2 theme. It controls the display of ggplot2 charts.
#'
#' @details
#' Use `theme_rand()` like other ggplot2 themes by adding `theme_rand()` to your plot.
#'
#' @export
#'
#' @examples
#' \dontrun{
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
#' }
theme_rand <- function() {
  dark_gray <- RandGrayPal[9]
  gray <- RandGrayPal[6]
  light_gray <- RandGrayPal[2]
  font <- "Helvetica"

  ggplot2::theme(
    # Plot
    plot.margin = ggplot2::margin(4, 16, 4, 16),

    # Text
    text = ggplot2::element_text(
      color = dark_gray,
      family = font,
      lineheight = 1.03,
      size = 12
    ),

    # Title
    plot.title = ggplot2::element_text(
      face = "bold",
      size = 18
    ),
    plot.title.position = "plot",

    # Subtitle
    plot.subtitle = ggplot2::element_text(
      face = "bold",
      size = 12,
      margin = ggplot2::margin(t = 4)
    ),

    # Caption
    plot.caption = ggplot2::element_text(hjust = 0),
    plot.caption.position = "plot",

    # Axes
    axis.line = ggplot2::element_line(color = light_gray, size = 0.5),
    axis.line.y = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(size = 12,
                             color = dark_gray),
    axis.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 4)),
    axis.ticks.y = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_line(color = light_gray),
    axis.title = ggplot2::element_text(face = "bold"),
    axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = 16, b = 8)),
    axis.title.y.left = ggplot2::element_text(margin = ggplot2::margin(r = 16)),
    axis.title.y.right = ggplot2::element_text(margin = ggplot2::margin(l = 16)),

    # Legend
    legend.background = ggplot2::element_blank(),
    legend.justification = "left",
    legend.key = ggplot2::element_blank(),
    legend.key.width = ggplot2::unit(1, "cm"),
    legend.box.margin = ggplot2::margin(t = 8, r = 0, b = 24, l = 0),
    legend.box.spacing = ggplot2::unit(0, "cm"),
    legend.margin = ggplot2::margin(t = 0, r = 0, b = 0, l = -8),
    legend.spacing = ggplot2::unit(0, "cm"),
    legend.position = "top",
    legend.title = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(size = 10,
                                        margin = ggplot2::margin(r = 8)),

    # Strip
    strip.background = ggplot2::element_blank(),
    strip.text.y = ggplot2::element_text(angle = 0),
    strip.text = ggplot2::element_text(face = "bold",
                              size = 14),

    # Grid lines
    panel.border = ggplot2::element_blank(),
    panel.background = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.minor.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color = light_gray),
    panel.grid.minor.y = ggplot2::element_blank(),
    panel.spacing.x = ggplot2::unit(2, "lines"),
    panel.spacing.y = ggplot2::unit(3, "lines"),
    plot.background = ggplot2::element_blank()
  )
}

