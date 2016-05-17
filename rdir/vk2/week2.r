#!/usr/bin/env R -f #:1
# Voidaan ajaa asettamalla x bitti (chmod +x tää tiedosto) ja sitten komentoriviltä kuin mikä tahansa scripti.

#ex 1
#a
data <- read.table(file = "OT2014.csv",  sep = ";", header = T, quote = "\"", stringsAsFactors = FALSE)
data[0:10,0:5]

#b
# q5_2 sukupuoli 1: nainen, 2: mies
# q1_12 tulot

#c
mean(data$q1_12, na.rm=T)
median(data$q1_12, na.rm=T)
min(data$q1_12, na.rm=T)
max(data$q1_12, na.rm=T)

# d
mean((data[data$q5_2 == 1,])$q1_12, na.rm=T)
mean((data[data$q5_2 == 2,])$q1_12, na.rm=T)

# e
mean(data[data$q5_2 == 1,][data$q1_5b %in% c(10,18),]$q1_12, na.rm=T)


# 2
# a
length(data[data$q1_12 > 5000,]$q1_12)
length(data[data$q1_12 <= 5000,]$q1_12)
# b
sum(is.na(data$q1_12))
# c
hist(data[data$q1_12 <= 5000,]$q1_12)


# 3
mean(data[data$q1_11b,]$q1_11b,na.rm=T)
# reilu 2, eli voimakkasti painottunut melko hyvat ja eivät hyvät eikä huonot kohdalle, eli kokevat melko hyviksi. Tosin keskivarvohan ei kerro kaikkea.
data$q1_11b[data$q1_11b == 9] = NA
mean(data[data$q1_11b,]$q1_11b,na.rm=T)

# Ei merkittävää eroa; 9 poistuminen, pienensi keskiarvoa ja siten sai tuloksen vielä positiivisemmaksi. Eli, ne joilla on käsitys, kuvittelevat mahdollisuuksiensa olevan hyvät.


# 4
# a
a <- function(x) {
 log(x/(1-x))
}
curve(a, from=0, to=1)

# b
abline(h=0)

# c
points(x=0.5, y=0, pch=19)


# 5
# a
rbinom(10, size=1, prob=1/2)

# b
sum(rbinom(10, size=100, prob=1/2))

# c
sum(rbinom(10, size=10000, prob=1/2))


# 6
# a
rnorm(1, mean=100, sd=15)

# b
result <- rnorm(10000, mean=100, sd=15)

# c
hist(result, freq = FALSE, ylim=c(0, 0.03))

# d
xs <- seq(40,160)
ys <- dnorm(xs, mean = 100, sd = 15)
lines(xs, ys)

# 7
# a
iris2 <- iris

# b
iris2$Sepal.Ratio <- iris2$Sepal.Length/iris2$Sepal.Width
iris2$Petal.Ratio <- iris2$Petal.Length/iris2$Petal.Width

# c
levels(iris2$Species)
# joo, en keksinyt kivempia värejä...
icolors <- c("pink", "orange", "yellow")
plot(Petal.Ratio ~ Sepal.Ratio, data=iris2, col=icolors[Species])


# 8
boxplot(iris2$Petal.Ratio ~ iris$Species)
boxplot(iris2$Sepal.Ratio ~ iris$Species)

