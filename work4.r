library(caret)
library(lmridge)
data(longley)

plot(lm(Employed ~ ., data = longley))

longley <- longley[, -5]

set.seed(333)

indices <- createDataPartition(longley$Employed, p = 0.5, list = FALSE)

train <- longley[indices, ]
test <- longley[-indices, ]

lambda_seq <- list()
for(n in 0:25)
{
    lambda_seq <- append(lambda_seq, 10^(-3 + 0.2 * n))
}

fit <- lmridge(Employed ~ ., data = train, K = lambda_seq)

res <- predict(fit, test)

mse_seq <- list()
for(n in seq_len(ncol(res)))
{
    mse <- mean((test$Employed - res[n])^2)
    mse_seq[[as.character(n)]] <- mse
}
plot(lambda_seq, sapply(mse_seq, unlist), type = "b", xlab = "lambda", ylab = "MSE")