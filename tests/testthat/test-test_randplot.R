

# Adding one example test

library(ggplot2)

data <- data.frame(a = rnorm(1000))

p <- ggplot(data = data, mapping = aes(x = a)) +
  geom_histogram() +
  theme_rand()

test_that("plot is created", {
  expect_s3_class(p, class = "ggplot")
})
