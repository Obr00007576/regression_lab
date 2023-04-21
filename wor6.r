library(datasets)
library(zoo)
library(base)
data(JohnsonJohnson)

jj_data <- as.data.frame(JohnsonJohnson)
jj_quater <- list()

for(i in 1:4)
{
    jj_quater[[i]] <- jj_data[seq(i, 84, 4), ]
}
jj_quater <- as.data.frame(jj_quater)
jj_quater[["time"]] <- seq(1960, 1980)
colnames(jj_quater) <- c("Q1", "Q2", "Q3", "Q4", "Time")

q1_model = lm(Q1 ~ Time, data = jj_quater)
q2_model = lm(Q2 ~ Time, data = jj_quater)
q3_model = lm(Q3 ~ Time, data = jj_quater)
q4_model = lm(Q4 ~ Time, data = jj_quater)
time2016 <- as.data.frame(seq(2016, 2016))
colnames(time2016) <- c("Time")
res1 = predict(q1_model, time2016)[[1]]
res2 = predict(q2_model, time2016)[[1]]
res3 = predict(q3_model, time2016)[[1]]
res4 = predict(q4_model, time2016)[[1]]
print(paste("Quater1 in 2016 pred:", res1))
print(paste("Quater2 in 2016 pred:", res2))
print(paste("Quater3 in 2016 pred:", res3))
print(paste("Quater4 in 2016 pred:", res4))
print(paste("In total:", res1+res2+res3+res4))

All_quaters <- as.data.frame(seq(1, nrow(jj_data)))
colnames(All_quaters) <- c("Q")
all_model = lm(x ~ All_quaters$Q, data = jj_data)

av_estimate = as.data.frame(seq(1960, 2016))
colnames(av_estimate) <- c("Time")
q1_av = mean(predict(q1_model, av_estimate))
q2_av = mean(predict(q2_model, av_estimate))
q3_av = mean(predict(q3_model, av_estimate))
q4_av = mean(predict(q4_model, av_estimate))
print(paste("Quater1 average from 1960 to 2016:", q1_av))
print(paste("Quater2 average from 1960 to 2016:", q2_av))
print(paste("Quater3 average from 1960 to 2016:", q3_av))
print(paste("Quater3 average from 1960 to 2016:", q4_av))