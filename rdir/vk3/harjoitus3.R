##############################################
# Viikko 3                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")

# a)
keskiarvo <- function(y) {
	return(sum(y)/length(y))
}

# b)
values <- c(5,46,9,8,5,4,3,12,7,8,9,2,4)
mean(values)
keskiarvo(values)



##############################################
# Tehtävä 2
print("Tehtävä 2")

# a)
varianssi <- function(y) {
	yhat <- keskiarvo(y)
	kerroin <- 1/(length(y) - 1)
	return( kerroin*sum((y - yhat)**2) )
}

# b)
var(values)
varianssi(values)



##############################################
# Tehtävä 4
print("Tehtävä 4")

# a)
kertoma <- function(n) {
	result <- 1
	for(i in 1:n) {
		result <- result * i
	}
	return(result)
}

# b)
factorial(10)
kertoma(10)



##############################################
# Tehtävä 4
print("Tehtävä 4")

# a)
tulo <- function(y) {
	result <- 1
	for(yi in y) {
		result <- result * yi
	}
	return(result)
}
tulo(c(5,4,3))

# b)
prod(values)
tulo(values)



##############################################
# Tehtävä 5
print("Tehtävä 5")

# a)
random_integers <- function(N=1, a=0, b=1) {
	values <- runif(n=N, min=a, max=b)
	int_values <- round(values)
	return(int_values)
}
luvut <- random_integers(10000, 0, 5)
table(luvut)
barplot(table(luvut), main="Tehtävä 5 a)")

# b)
random_integers2 <- function(N=1, a=0, b=1) {
	values <- runif(n=N, min=a-0.5, max=b+0.499999) 
	int_values <- round(values)
	return(int_values)
}

# c)
luvut <- random_integers2(10000, 0, 5)
table(luvut)
barplot(table(luvut), main="Tehtävä 5 c)")



##############################################
# Tehtävä 6
print("Tehtävä 6")

A <- matrix(1:50, nrow=5)
# a)
a <- c(0,0,0,0,0,0,0,0,0,0)
for(i in 1:ncol(A)) {
	a[i] <- tulo(A[,i])
}
a

# b)
sapply(1:ncol(A), function(j) tulo(A[,j]))

# c)
apply(A, 2, tulo)



##############################################
# Tehtävä 7
print("Tehtävä 7")

# a)
ot <- read.csv2(file='OT2014.csv', stringsAsFactors=0)

# b)
ot_tyytyv <- as.matrix(ot[,16:22])

# c)
tyytyv <- apply(ot_tyytyv, 1, mean, na.rm=TRUE)

# d)
mean(tyytyv, na.rm=TRUE)
var(tyytyv, na.rm=TRUE)
hist(tyytyv, main="Tehtävä 7")

# e)
# Suurin osa tyytyv arvoista painottuu arvon 2 puolin ja toisin.
# Arvon 2 selitys on Melko tyytyväinen ja tyytyv vektorin keskiarvo on 2.28608
# mikä sijaitsee Melko tyytyväisen ja En tyytyväinen enkä tyytymätön välissä, mutta
# pyöristyy kuitenkin Melko tyytäisen puolelle.



##############################################
# Tehtävä 8
print("Tehtävä 8")

# a)
table(ot$q3_10)
plot(ot$q3_10)

# b)
vaikeudet <- factor(ot$q3_10, labels=c("Erittäin paljon","Melko paljon","Jonkin verran","Melko vähän","Ei lainkaan"))

# c)
table(vaikeudet)
plot(vaikeudet, main="Missä määrin sinulla on vaikeuksia saada rahat riittämään?",col=c("red","orange", "yellow", "green", "blue"))



##############################################
# Tehtävä 9
print("Tehtävä 9")

# a)
sukupuoli <- factor(ot$q5_2, labels=c("Nainen", "Mies"))

# b)
taulukko <- table(vaikeudet, sukupuoli)
taulukko

# c)
rivisummat <- apply(taulukko, 1, sum)
taulukko2 <- cbind(taulukko, rivisummat)
taulukko2

# d)
sarakesummat <- apply(taulukko2, 2, sum)
taulukko2 <- rbind(taulukko2, sarakesummat)
taulukko2

# e)
taulukko2
addmargins(taulukko)



##############################################
# Tehtävä 10
print("Tehtävä 10")

# a) 
vektoriprosentit <- function(x) {
	n <- sum(x)
	return(round((100*(x/n)),1))
}
apply(taulukko, 2, vektoriprosentit)

# b)
t(apply(taulukko, 1, vektoriprosentit))

# c)
# sarakkeille
prop.table(taulukko, 2)
# riveille
prop.table(taulukko, 1) 



##############################################
# Tehtävä 11

# a)
# Sarakeprosentit kertovat, miten yhden sukupuolen edustajat ovat jakautuneet eri
# tulotasojen välillä. Jos vertailemme sarakeprosentteja sukupuolten välillä,
# näemme miten sukupuoleten suhteelliset osuudet eroavat
# Esim. 12.9 % naisista vastasi Erittäin paljon, kun taas 10.7 % mieheistä

# b)
# Naisilla Erittäin paljon - Jonkin verran on suuremmat suhteelliset osuudet, kun taas
# Miehillä Melko vähän ja Ei lainkaan on suuremmat suhteelliset osuudet.
# Sukupuolella vaikuttaisi olevan merkistystä



##############################################
# Tehtävä 12
print("Tehtävä 12")

# a)
tutkinto <- factor(ot$q1_1, labels=c("Alempi YO", "Ylempi YO", "AMK", "Ylempi AMK"))

# b)
tapply(ot$q1_12, tutkinto, function(x) round(mean(x, na.rm=TRUE)))
tapply(ot$q1_12, tutkinto, median, na.rm=TRUE)
