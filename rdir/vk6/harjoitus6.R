##############################################
# Viikko 6                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")

# a)
ot <- read.csv2(file='OT2014.csv', stringsAsFactors=0)
ot_luot <- subset(ot, select=paste("q1_13", letters[1:5], sep=""))
ot$luottamus <- apply(ot_luot, 1, mean, na.rm=1)

# b)
fit <- lm(ot$q1_12~ot$luottamus)
fit

# c)
plot(ot$luottamus, ot$q1_12, main='Tehtävä 1',xlab='luottamus',ylab='palkka',type='p')



##############################################
# Tehtävä 2
print("Tehtävä 2")

# a)
x <- c(1,5)
y <- fit$coefficients[1] + fit$coefficients[2]*x
lines(x,y,  col="green")

# b)
summary(fit)
# Näemme taulukosta parametrien estimoidun keskihajonnan, virheen, t-arvon ja p arvon.
# Parametreja ovat y-akselin leikkauspiste ja kulmakerroin. Kulmakerroin on negatiivinen
# kuten sen keskihajonta ja virhe, mikä ei ole yllättävää, sillä kuvasta näemme, että
# suora on laskeva. p-arvot ovat myös melko pieneniä mikä on ilmeistä, sillä tarkastelemme
# parametrien estimaatteja.

# c)
plot(predict(fit), residuals(fit), main="Tehtävä 2")
plot(predict(fit), residuals(fit), type="hist", main="Tehtävä 2 histogrammi")
qqnorm(residuals(fit))
qqline(residuals(fit), col=2, lwd=2, lty=2)
# Ensimmäisessä kuvassa näemme miten residuaalit ja ennusteet istuvat keskenään ja suurinta
# poikkeusta on kuvan oikeassa ylälaidassa.
# Toisessa kuvasssa näemme miten residuaalit istuvat suoralle. Suurimmat muutokset ovat 
# suoran päässä. Residuaaleihin liittyvät mallioletukset näyttävät toteutuvan.



##############################################
# Tehtävä 3
print("Tehtävä 3")
confint(fit, level=0.95)
# Tulostuvassa taulukossa (Intercept) vastaa hypoteesin kysyttyä parametria.
# Sen luottamusväli on [3337.9229 3583.9986] ja näemme selvästi, että luku 3350
# sisältyy tälle välille, joten emme voi hylätä nollahypoteesia kysytyllä luottamustasolla.



##############################################
# Tehtävä 4
print("Tehtävä 4")
y <- c(76,72,89,144,158,92,156,109,138,100,51,107,129,65,121)
z <- c(21.6,24.2,23.1,23.6,27.1,22.2,26.0,23.3,25.8,24.4,21.8,23.8,22.9,21.8,25.2)
fit <- lm(y~z)
plot(z,y, main="Tehtävä 4", type="p")
x<-c(min(z), max(z))
lines(x, fit$coefficients[1]+fit$coefficients[2]*x, col=2)
summary(fit)
# Tässä mallissa tehty virhe on suurempaa kuin esimerkin 6.1-6.3. Lisäksi
# katsomalla kuvaa näemme, että suora istuu paremmin x:n ja y:n kanssa
# ja z:n ja y:n tilanteessa tarvittaisiin polynomikäyrää pikemmin kuin suoraa.
# Näin ollen x on parempi selittäjä havainnoille y.



##############################################
# Tehtävä 5
print("Tehtävä 5")

# a)
valkoisia_korissa <- sample(0:5, size=1000000, replace=TRUE)

# b)
valkoisia_nostettu <- sapply(valkoisia_korissa, function(x) sum(rbinom(n=7,size=1,prob=x/5)))

# c)
otokset<-valkoisia_korissa[valkoisia_nostettu == 2]
tb <-table(otokset)/length(otokset)
tb
plot(tb, main="Tehtävä 5")
# Tulos näyttäisi täsmäävän esimerkin 10.1 kanssa



##############################################
# Tehtävä 6
print("Tehtävä 6")

# a)
rbern <- function(n, prob) {
	return(rbinom(n=n, size=1, prob=prob))
} 

# b)
tutkimussimulaatio <- function(n) {
	kieli_p <- 166/(166+703)
	muu_p <- 199/(199+2154)
	kielittutkimus <- rbern(n=n, prob=0.5)
	aktiiviset <- numeric(n)
	for(i in 1:n) {
		if(kielittutkimus[i] == 1) {
			aktiiviset[i] <- rbern(n=1, prob=kieli_p)
		} else {
			aktiiviset[i] <- rbern(n=1, prob=muu_p)
		}
	}
	return(sum(aktiiviset[kielittutkimus == 1])/sum(aktiiviset))
}

# c)
tutkimussimulaatio(100)
tutkimussimulaatio(10000)
tutkimussimulaatio(1000000)



##############################################
# Tehtävä 7
print("Tehtävä 7")

# a)
tutkimussimulaatio2 <- function(n) {
	kieli_p <- 166/(166+703)
	muu_p <- 199/(199+2154)
	kielittutkimus <- rbern(n=n, prob=0.5)
	aktiiviset <- numeric(n)
	n_kt <- sum(kielittutkimus)
	aktiiviset[which(kielittutkimus==1)] <- rbern(n=n_kt, prob=kieli_p)
	aktiiviset[which(kielittutkimus==0)] <- rbern(n=n-n_kt, prob=muu_p)
	return(sum(aktiiviset[kielittutkimus == 1])/sum(aktiiviset))
}

# b)
tutkimussimulaatio2(1000000)

# c)
system.time(tutkimussimulaatio(1000000))
system.time(tutkimussimulaatio2(1000000))
# tutkimussimulaatio2 oli huomattavasti nopeampi



##############################################
# Tehtävä 8
print("Tehtävä 8")

# a)
tutkimussimulaatio3 <- function(n) {
	kt_p <- 166/(166+703)
	muu_p <- 199/(199+2154)
	kielitutkimus <- rbinom(n=1,size=n,prob=0.5)
	kt_akt <- rbinom(n=1,size=kielitutkimus, prob=kt_p)
	muu_akt <- rbinom(size=n-kielitutkimus,n=1, prob=muu_p)
	return(kt_akt/(kt_akt+muu_akt))
}

# b)
tutkimussimulaatio3(1000000)

# c)
system.time(tutkimussimulaatio2(1000000))
system.time(tutkimussimulaatio3(1000000))
# tutkimussimulaatio3 oli nopeampi kuin tutkimussimulaatio2,
# mutta testikoneellani n=1000000 ei antanut oikeaa kuvaa nopeudesta.
# system.time(tutkimussimulaatio2(10000000))
#    user  system elapsed 
#   2.055   0.044   2.099
# system.time(tutkimussimulaatio3(10000000000))
#    user  system elapsed 
#       0       0       0
# Nyt näemme, että tutkimussimulaatio3 selviytyy n=1e10 ongelmitta, mutta
# tutkimussimulaatio2 jo n=1e7 alkaa vaikuttamaan.
# Tämä johtuu algoritmien aikavaativuuksista, johon vaikuttavat vektoreiden
# käsittely ja looppaaminen, joka on riippuvainen syötteen koosta.
# tutkimussimulaatio3 hyödyntää vakioaikaisia komentoja ( vakioaika O(1) ),
# jolloin todelliseksi rajaksi asettuu tila (n:n koko, esim. testikoneellani 1e11 overflowasi)