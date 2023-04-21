library(datasets)
data(sunspot.year)

plot(sunspot.year, main = "Sunspot Data", xlab = "Year", ylab = "Sunspot Number")

reg <- lm(sunspot.year ~ time(sunspot.year))

abline(reg, col = "red")