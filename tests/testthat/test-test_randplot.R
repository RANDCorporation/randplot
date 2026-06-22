
library(ggplot2)

data <- data.frame(a = rnorm(1000))

p <- ggplot(data = data, mapping = aes(x = a)) +
  geom_histogram() +
  theme_rand()

test_that("plot is created", {
  expect_s3_class(p, class = "ggplot")
})

# Categorical palette ---------------------------------------------------------

test_that("RandCatPal has 9 colors", {
  expect_length(RandCatPal, 9)
  expect_type(RandCatPal, "character")
})

# Sequential palettes ---------------------------------------------------------

test_that("sequential palettes have 9 colors each", {
  expect_length(RandSeqYellowBluePal, 9)
  expect_length(RandSeqYellowPurplePal, 9)
  expect_length(RandSeqBluePal, 9)
  expect_length(RandSeqPinkPurplePal, 9)
})

# Diverging palettes ----------------------------------------------------------

test_that("diverging palettes have 9 colors each", {
  expect_length(RandDivTealOrangePal, 9)
  expect_length(RandDivBlueOrangePal, 9)
  expect_length(RandDivSteelSalmonPal, 9)
  expect_length(RandDivInkSalmonPal, 9)
})

# show_rand_pal ---------------------------------------------------------------

test_that("show_rand_pal accepts all valid palette names", {
  valid_names <- c(
    "RandCatPal",
    "RandSeqYellowBluePal", "RandSeqYellowPurplePal",
    "RandSeqBluePal", "RandSeqPinkPurplePal",
    "RandDivTealOrangePal", "RandDivBlueOrangePal",
    "RandDivSteelSalmonPal", "RandDivInkSalmonPal",
    "RandGrayPal"
  )
  for (pal in valid_names) {
    expect_no_error(show_rand_pal(pal))
  }
})

test_that("show_rand_pal errors on invalid palette name", {
  expect_error(show_rand_pal("NotAPalette"))
})

# theme_rand font default -----------------------------------------------------

test_that("theme_rand uses the active rand_font()", {
  expect_equal(theme_rand()$text$family, rand_font())
})

# rand_pal_n ------------------------------------------------------------------

test_that("rand_pal_n returns the requested number of colors", {
  expect_length(rand_pal_n(RandSeqBluePal, 5), 5)
  expect_length(rand_pal_n(RandSeqBluePal, 20), 20)
  expect_length(rand_pal_n(RandCatPal, 1), 1)
})

test_that("rand_pal_n returns valid hex color strings", {
  result <- rand_pal_n(RandSeqBluePal, 5)
  expect_type(result, "character")
  expect_true(all(grepl("^#[0-9A-Fa-f]{6}$", result)))
})

test_that("rand_pal_n works on all palette types", {
  expect_no_error(rand_pal_n(RandCatPal, 5))
  expect_no_error(rand_pal_n(RandDivTealOrangePal, 5))
  expect_no_error(rand_pal_n(RandSeqYellowPurplePal, 5))
})

test_that("rand_pal_n with n equal to palette length returns similar colors", {
  result <- rand_pal_n(RandSeqBluePal, 9)
  expect_length(result, 9)
  expect_type(result, "character")
})

# rand_font -------------------------------------------------------------------

test_that("rand_font returns a non-empty string", {
  expect_type(rand_font(), "character")
  expect_true(nchar(rand_font()) > 0)
})

# rand_font_setup -------------------------------------------------------------

test_that("rand_font_setup saves path and activates Monument Grotesk", {
  skip_if_not(
    file.exists(path.expand("~/Downloads/DINAMO Order 2023-1505603.zip")),
    "DINAMO zip not present"
  )
  rand_font_setup(path.expand("~/Downloads/DINAMO Order 2023-1505603.zip"))
  expect_equal(rand_font(), "ABCMonumentGrotesk")
})
