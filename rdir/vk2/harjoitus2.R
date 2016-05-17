##############################################
# Viikko 2                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")

# a)
ot <- read.csv2(file='OT2014.csv', stringsAsFactors=0)
ot[1:10, 1:5]

# b)
# Sukupuoli
# koodi: [Q5_2] arvo: nainen = 1 ja mies = 2

# Paljonko uskot saavasi palkkaa bruttona (ennen verojen vähentämistä
# vuoden kuluttua valmistumisestasi? (euroa kuukaudessa)
# koodi: [Q1_12]

# c)
palkat <- ot$q1_12[!is.na(ot$q1_12)]
mean(palkat)
median(palkat)
min(palkat)
max(palkat)

# d)
naiset <- ot[ot$q5_2 == 1,]
naisten_palkat <- naiset$q1_12[!is.na(naiset$q1_12)]
mean(naisten_palkat)

miehet <- ot[ot$q5_2 == 1,]
miesten_palkat <- miehet$q1_12[!is.na(miehet$q1_12)]
mean(miesten_palkat)

# e)
luotek_naiset <- naiset[naiset$q1_5b == 9 | naiset$q1_5b == 18,]
luotek_naisten_palkat <- luotek_naiset$q1_12[!is.na(luotek_naiset$q1_12)]
mean(luotek_naisten_palkat)



##############################################
# Tehtävä 2
print("Tehtävä 2")

# a)
palkat <- ot$q1_12
yli5000 <- palkat[palkat > 5000]
print(paste("Enemmän kuin 5000 e/kk:", length(yli5000)))

enin5000 <- palkat[palkat <= 5000]
print(paste("Enintään 5000 e/kk:", length(enin5000)))

# b)
puuttuu <- palkat[is.na(palkat)]
print(paste("Tiedot puuttuvat",length(puuttuu),"vastanneelta."))

# c)
hist(enin5000, main="Tehtävä 2 c)", xlab="Vastaajat", ylab="Palkat")



##############################################
# Tehtävä 3
print("Tehtävä 3")

# a)
mean(ot$q1_11b, na.rm=1)

# > mean(ot$q1_11b, na.rm=1)
# [1] 3.378409
# Arvo on väliltä Melko huonot ja Eivät hyvät eivätkä huonot, lähempänä Eivät hyvät eivätkä huonot arvoa. 
#
# Tosin mukana on arvot En osaa sanoa = 9
# ja arvon suhteellinen frekvenssi on 514/3620 = 0.142
# Ilman En osaa sanoa arvoja:
# > mean(ot$q1_11b[ot$q1_11b != 9], na.rm=1)
# [1] 2.417166
# Tulos on väliltä Eivät hyvät eivätkä huonot ja Melko hyvät, lähempänä Melko hyvät arvoa.
#
# Eli näemme, että En osaa sanoa arvot kiskovat keskiarvoa kohti. En osaa sanoa on ongelmallinen:
# esim havainnoilla 5,5,5,9 keskiarvo on 6. Ilmeisesti En osaa sanoa arov on valittu aineiston pohjalta.

# b)
tmp <- ot$q1_11b
tmp[tmp == 9] <- NA
mean(tmp, na.rm=1)
# > mean(tmp, na.rm=1)
# [1] 2.417166
# Muuttamalla En osaa sanoa arvot NA:ksi keskiarvo liikkuu kohti hyvää verrattuna a)-kohtaan



##############################################
# Tehtävä 4

# a)
curve(log(x/(1-x)), from=0, to=1, main="Tehtävä 4")

# b)
abline(h=0, col='blue')

# c)
points(x=0.5, y=0, col="red", pch=19)



##############################################
# Tehtävä 5
print("Tehtävä 5")

# a)
rbinom(10, 1, 0.5)

# b)
a <- rbinom(100, 1, 0.5)
sum(a[a==1])

# c)
b <- rbinom(1000, 1, 0.5)
sum(b[b==1])



##############################################
# Tehtävä 6
print("Tehtävä 6")

# a)
rnorm(mean=100, sd=15, n=1)

# b)
result <- rnorm(mean=100, sd=15, n=10000)
#result

# c)
hist(result, main="Tehtävä 6", freq=FALSE, ylim=c(0,0.03))

# d)
lines(x=seq(40,160),dnorm(x=seq(40,160), mean=100, sd=15))



##############################################
# Tehtävä 7

# a)
iris2 <- iris

# b)
iris2$Sepal.Ratio <- iris2$Sepal.Length / iris2$Sepal.Width
iris2$Petal.Ratio <- iris2$Petal.Length / iris2$Petal.Width

# c)
iris_colors = c("red", "green", "blue")
iris_dots = c(0, 1, 2)
plot(Sepal.Ratio~Petal.Ratio, data=iris2, main="Tehtävä 7", col=iris_colors[Species], pch=iris_dots[Species])



##############################################
# Tehtävä 8

boxplot(iris2$Petal.Ratio~iris2$Species, main="Tehtävä 8: Petal.Ratio")
boxplot(iris2$Sepal.Ratio~iris2$Species, main="Tehtävä 8: Sepal.Ratio")