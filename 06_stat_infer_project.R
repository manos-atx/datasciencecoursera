
n <- 40
lambda <- 0.2
mu <- 1/lambda
sigma <- 1/lambda

iter <- 1000

set.seed(1)
mc <- matrix(rexp(iter*n, lambda), nrow = iter, ncol = n)

mus <- apply(mc, 1, mean)
vars <- apply(mc, 1, var)

shapiro.test(mus)
shapiro.test(vars)

library(ggplot2)

ggplot(data.frame(means = mus), aes(means)) +
  geom_histogram()

ggplot(data.frame(variances = vars), aes(variances)) +
  geom_histogram()

library(datasets)

str(ToothGrowth)
summary(ToothGrowth)

tapply(ToothGrowth$len, ToothGrowth$supp, mean)
tapply(ToothGrowth$len, ToothGrowth$dose, mean)
tapply(ToothGrowth$len, list(ToothGrowth$supp, ToothGrowth$dose), mean)


t.test(ToothGrowth$len[ToothGrowth$supp == 'VC'], ToothGrowth$len[ToothGrowth$supp == 'OJ'],
       alternative = "greater")
t.test(len ~ supp, ToothGrowth)

t.test(ToothGrowth$len[ToothGrowth$dose == 0.5], ToothGrowth$len[ToothGrowth$dose == 1])
t.test(ToothGrowth$len[ToothGrowth$dose == 0.5], ToothGrowth$len[ToothGrowth$dose == 2])
t.test(ToothGrowth$len[ToothGrowth$dose == 1], ToothGrowth$len[ToothGrowth$dose == 2])


