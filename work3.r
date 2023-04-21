data <- read.table("cygage.txt", header = TRUE)

model <- lm(calAge ~ Depth + Weight, data = data)

print(summary(model))