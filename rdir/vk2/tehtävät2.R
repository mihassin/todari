# tehtävä 1
# a)
ot = read.csv2(file = "OT2014.csv", stringsAsFactors = F)
print(ot[1:10,1:5])
# b) sukupuoli = [Q5_2] ja palkkakysymys = [Q1_12]
# c)
mean(ot$q1_12, na.rm = T)
print(mean(ot$q1_12, na.rm = T))
median(ot$q1_12, na.rm = T)
print(median(ot$q1_12, na.rm = T))
min(ot$q1_12, na.rm = T)
print(min(ot$q1_12, na.rm = T))
max(ot$q1_12, na.rm = T)
print(max(ot$q1_12, na.rm = T))
# d)
mean(ot$q1_12[ot$q5_2 == 1], na.rm = T)
print(mean(ot$q1_12[ot$q5_2 == 1], na.rm = T))
# e)
median(ot$q1_12[ot$q5_2 == 2 & ot$q1_5b == 9 | 18], na.rm = T)
print(median(ot$q1_12[ot$q5_2 == 2 & ot$q1_5b == 9 | 18], na.rm = T))
# tehtävä 2
# a)
sum(ot$q1_12 > 5000, na.rm = T)
print(sum(ot$q1_12 > 5000, na.rm = T))
sum(ot$q1_12 <= 5000, na.rm = T)
print(sum(ot$q1_12 <= 5000, na.rm = T))
# b)
sum(is.na(ot$q1_12))
print(sum(is.na(ot$q1_12)))
# c)
hist(ot[ot$q1_12 <= 5000,]$q1_12)
# tehtävä 3
# a) tulos on n. 3.4 joten ei kovin hyvät, en osaa sanoa (9) sotkee tulosta
mean(ot$q1_11b, na.rm = T)
print(mean(ot$q1_11b, na.rm = T))
# b) tulos on n. 2.4, joten huomattavasti paremmat
ot$q1_11b[ot$q1_11b == 9] <- NA
mean(ot$q1_11b, na.rm = T)
# tehtävä 4
# a)
curve(log(x/(1-x)), from = 0, to = 1)
# b)
abline(h=0, col = "blue")
# c)
points(0.5, 0, pch = 19, col = "red")
# tehtävä 5
# a)
sample.space <- c(0,1)
theta = 0.5
N = 10
flips <- sample(sample.space, size = N, replace = T, prob = c(theta, 1-theta))
print(flips)
# b) 507 kruunaa
flips100 <- rbinom(n=100, N, theta)
print(sum(flips100))
# c) 49944 kruunaa
flips10000 <- rbinom(n=10000, N, theta)
print(sum(flips10000))
# tehtävä 6
# a)
rnorm(n = 1,mean = 100, sd = 15)
# b)
result = rnorm(n = 10000,mean = 100, sd = 15)
# c)
hist(result, freq = F, ylim = c(0, 0.03))
# d)

