#' RAND color palettes for data visualization
#'
#' Access colors from the RAND color palettes.
#'
#' @details
#' Three types of palettes are provided, matching RAND's brand guidelines:
#'
#' **Categorical** — use to distinguish discrete, unordered data:
#' - `RandCatPal`: 9 colorblind-safe colors.
#'
#' **Sequential** — use when data has a natural order (low to high). Lighter
#' colors represent lower values; darker colors represent higher values:
#' - `RandSeqYellowBluePal`: yellow to blue.
#' - `RandSeqYellowPurplePal`: yellow to purple.
#' - `RandSeqBluePal`: light blue to ink.
#' - `RandSeqPinkPurplePal`: pink to purple.
#'
#' **Diverging** — use when data goes from negative to positive, or when
#' highlighting differences from a meaningful midpoint:
#' - `RandDivTealOrangePal`: teal to orange.
#' - `RandDivBlueOrangePal`: blue to orange.
#' - `RandDivSteelSalmonPal`: steel to salmon.
#' - `RandDivInkSalmonPal`: ink to salmon (digital only).
#'
#' `RandGrayPal` is a palette of nine standardized gray shades for internal use.
#'
#' `show_rand_pal()` accepts any palette name (as a string) and displays its
#' colors as a color strip.
#'
#' @section Palettes:
#' Use any palette in a plot by passing it to `ggplot2::scale_color_manual()` or
#' `ggplot2::scale_fill_manual()`. Do not mix colors from multiple palettes in a
#' single visualization.
#'
#' @param palette_name One of `"RandCatPal"`, `"RandSeqYellowBluePal"`,
#'   `"RandSeqYellowPurplePal"`, `"RandSeqBluePal"`, `"RandSeqPinkPurplePal"`,
#'   `"RandDivTealOrangePal"`, `"RandDivBlueOrangePal"`,
#'   `"RandDivSteelSalmonPal"`, `"RandDivInkSalmonPal"`, or `"RandGrayPal"`.
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
#' show_rand_pal("RandCatPal")
#' show_rand_pal("RandSeqBluePal")
#' show_rand_pal("RandDivTealOrangePal")
#' }
#' @rdname rand_pal
#' @export
RandCatPal <- c(
  "#41378F",
  "#F0A734",
  "#9C3391",
  "#AFBBE8",
  "#677CC2",
  "#A67EB3",
  "#88BACE",
  "#DA8473",
  "#EDCC48"
)

# Sequential palettes ---------------------------------------------------------

#' @rdname rand_pal
#' @export
RandSeqYellowBluePal <- c(
  "#E3F0A4",
  "#B5E19F",
  "#86D0A0",
  "#58BDA2",
  "#2BA7A5",
  "#0090A4",
  "#05769F",
  "#235C93",
  "#314282"
)

#' @rdname rand_pal
#' @export
RandSeqYellowPurplePal <- c(
  "#FAE8A3",
  "#F6CB88",
  "#EFAD75",
  "#E4906C",
  "#D4746B",
  "#BF5B6F",
  "#A64574",
  "#883279",
  "#68217C"
)

#' @rdname rand_pal
#' @export
RandSeqBluePal <- c(
  "#E1E7FD",
  "#C9D1F0",
  "#B2BAE3",
  "#9CA4D5",
  "#888FC8",
  "#7479BA",
  "#6263AC",
  "#504D9E",
  "#41378F"
)

#' @rdname rand_pal
#' @export
RandSeqPinkPurplePal <- c(
  "#FEE0DA",
  "#F1C6C4",
  "#E3ACB1",
  "#D393A2",
  "#C17B97",
  "#AE648E",
  "#984D87",
  "#813882",
  "#68217C"
)

# Diverging palettes ----------------------------------------------------------

#' @rdname rand_pal
#' @export
RandDivTealOrangePal <- c(
  "#106D89",
  "#3C909C",
  "#69B2AE",
  "#98D3C2",
  "#E6E9E2",
  "#E4BF7C",
  "#D29454",
  "#BE6938",
  "#A43D2B"
)

#' @rdname rand_pal
#' @export
RandDivBlueOrangePal <- c(
  "#465CAF",
  "#5185C3",
  "#6DACD2",
  "#99CFE1",
  "#E3EAE4",
  "#E4BF7C",
  "#D29454",
  "#BE6938",
  "#A43D2B"
)

#' @rdname rand_pal
#' @export
RandDivSteelSalmonPal <- c(
  "#546091",
  "#7281AB",
  "#92A3C6",
  "#B6C8E0",
  "#E3EAE5",
  "#EFB69D",
  "#D29179",
  "#B56C58",
  "#98483A"
)

#' @rdname rand_pal
#' @export
RandDivInkSalmonPal <- c(
  "#5B54AF",
  "#747AC5",
  "#929FDA",
  "#B5C4ED",
  "#E3EAE5",
  "#EFB69D",
  "#D78E74",
  "#BE664E",
  "#A43D2B"
)

# Gray palette ----------------------------------------------------------------

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

# show_rand_pal ---------------------------------------------------------------

#' @rdname rand_pal
#' @export
show_rand_pal <- function(palette_name) {
  palette_names <- c(
    "RandCatPal",
    "RandSeqYellowBluePal",
    "RandSeqYellowPurplePal",
    "RandSeqBluePal",
    "RandSeqPinkPurplePal",
    "RandDivTealOrangePal",
    "RandDivBlueOrangePal",
    "RandDivSteelSalmonPal",
    "RandDivInkSalmonPal",
    "RandGrayPal"
  )

  if (!(palette_name %in% palette_names)) {
    stop(paste0(
      "\"", palette_name, "\" is not a valid palette. ",
      "Choose one of: ", paste(palette_names, collapse = ", ")
    ))
  }

  palette <- get(palette_name)
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
