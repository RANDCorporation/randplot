
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

test_that("theme_rand defaults to ABC Monument Grotesk", {
  expect_equal(theme_rand()$text$family, "ABC Monument Grotesk")
})
