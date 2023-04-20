# Load the data from file
data <- read.table("reglab1.txt", header = TRUE)

# Fit a linear regression model with all variables
model1 <- lm(z ~ ., data = data)

# Fit a linear regression model with only one variable x
model2 <- lm(z ~ x, data = data)

# Fit a linear regression model with variables x and y
model3 <- lm(z ~ x + y, data = data)

# Fit a linear regression model with variables x and y
model4 <- lm(z ~ y, data = data)

# Fit a linear regression model with variables x, y, and x^2
model5 <- lm(z ~ x + y + I(x^2), data = data)

# Compare the models based on their performance
print(summary(model1))
print(summary(model2))
print(summary(model3))
print(summary(model4))
print(summary(model5))
