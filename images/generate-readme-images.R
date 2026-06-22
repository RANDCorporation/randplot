library(ggplot2)
library(randplot)

img_dir <- dirname(sys.frame(1)$ofile)
if (!nchar(img_dir)) img_dir <- "images"

save_plot <- function(p, filename, width = 6, height = 4) {
  ggsave(file.path(img_dir, filename), p,
         width = width, height = height, dpi = 120, bg = "white")
}

# Categorical -----------------------------------------------------------------
p_cat <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 2, alpha = 0.8) +
  scale_color_manual(values = RandCatPal) +
  labs(
    title = "Iris sepal dimensions by species",
    x = "Sepal length (cm)",
    y = "Sepal width (cm)"
  ) +
  theme_rand()

save_plot(p_cat, "cat-scatter.png")

# Sequential ------------------------------------------------------------------
p_seq <- ggplot(mtcars, aes(x = wt, y = mpg, color = hp)) +
  geom_point(size = 3) +
  scale_color_gradientn(colors = RandSeqBluePal) +
  labs(
    title = "Fuel efficiency by weight and horsepower",
    x = "Weight (1,000 lbs)",
    y = "Miles per gallon",
    color = "Horsepower"
  ) +
  theme_rand()

save_plot(p_seq, "seq-scatter.png")

# Diverging -------------------------------------------------------------------
set.seed(42)
regions <- c(
  "Northeast", "Midwest", "South", "West",
  "Mountain", "Pacific", "Great Plains", "Southwest"
)
div_data <- data.frame(
  region = factor(regions, levels = regions[order(rnorm(8))]),
  change = c(3.2, -1.8, 5.4, -4.1, 2.0, -0.5, 1.3, -3.7)
)

p_div <- ggplot(div_data, aes(x = change, y = region, fill = change)) +
  geom_col() +
  geom_vline(xintercept = 0, color = "#333333", linewidth = 0.4) +
  scale_fill_gradientn(
    colors = RandDivTealOrangePal,
    limits = c(-6, 6),
    guide = "none"
  ) +
  labs(
    title = "Change from national average (%)",
    x = NULL,
    y = NULL
  ) +
  theme_rand()

save_plot(p_div, "div-bar.png")

message("Images written to ", img_dir)
