data <- read.table("reglab2.txt", header = TRUE)
Y <- data[, 1]
X <- data[, 2:5]

subsets <- list()
rss_vals <- list()

for (i in 1:4) 
{
    subsets[[i]] <- combn(1:4, i, simplify = FALSE)
    rss_vals[[i]] <- rep(0, choose(4, i))
    for (j in 1:length(subsets[[i]])) 
    {
        subset_j <- as.matrix(X[, subsets[[i]][[j]]])
        model <- lm(Y ~ subset_j)
        rss_vals[[i]][j] <- sum(model$residuals^2)
    }
}

cat("All feature subsets with their corresponding RSS values:\n")
for (i in 1:4) 
{
    for (j in 1:length(subsets[[i]])) 
    {
        outcol <- toString(colnames(X[subsets[[i]][[j]]]))
        print(paste("Subste:", outcol, ":", rss_vals[[i]][j]))
    }
}