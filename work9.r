data(cars)

model <- lm(dist ~ speed, data = cars)
summary(model)

speed <- data.frame(c(40))
colnames(speed) <- c("speed")
distance <- predict(model, speed)
print(paste("Predicted dist:", distance))