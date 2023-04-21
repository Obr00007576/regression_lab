library(datasets)
data("EuStockMarkets")

plot(EuStockMarkets, main = "Stock Market Prices")
legend("topleft", colnames(EuStockMarkets), col = 1:4, lty = 1)

results <- data.frame()
date <- as.data.frame(seq(1, nrow(EuStockMarkets)))
colnames(date) <- c("date")

for (i in 1:4) {
  lm_model <- lm(EuStockMarkets[, i] ~ date$date)
  results <- rbind(results, c(colnames(EuStockMarkets)[i], summary(lm_model)$adj.r.squared))
}

print(results)
lm_model_all <- lm(EuStockMarkets ~ date$date)
print(summary(lm_model_all))