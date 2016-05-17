##############################################
# Viikko 5                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")

# a)
ot <- read.csv2(file='OT2014.csv', stringsAsFactors=0)
sarake_nimet <- paste("q1_8", letters[1:7], sep="")
ot_tyytyv <- subset(ot, select=sarake_nimet)

# b)
puuttuvat <- sapply(1:nrow(ot_tyytyv), function(x) sum(is.na(ot_tyytyv[x,])))

# c)
length(puuttuvat[puuttuvat >= 4])
table(puuttuvat)



##############################################
# Tehtävä 2
print("Tehtävä 2")

# a)
ot$tyytyvaisyys <- apply(ot_tyytyv,1 ,mean, na.rm=1)

# b)
ot$tyytyvaisyys2 <- rowMeans(ot_tyytyv, na.rm=1)
all.equal(ot$tyytyvaisyys, ot$tyytyvaisyys2)

# c)
ot$tyytyvaisyys[puuttuvat >= 4] <- NA
sum(is.na(ot$tyytyvaisyys))



##############################################
# Tehtävä 3
print("Tehtävä 3")

# a)
t_testisuure <- function(data, mu=2.2, na.rm=0) {
	if(na.rm==1) {
		data <- data[!is.na(data)]
	}
	y <- mean(data)
	s <- sd(data)
	n <- length(data)
	return((y - mu) / (s / sqrt(n)))
}
tt <- t_testisuure(ot$tyytyvaisyys, na.rm=1)
tt

# b)
n <- length(ot$tyytyvaisyys[!is.na(ot$tyytyvaisyys)])
p <- 2*(1-pt(tt, df=n-1))
p

# c)
t.test(ot$tyytyvaisyys, mu=2.2)
# p-arvo poikeaa, mutta laskemalla tehtävänannon huomautuksella 2
2*pt(-tt,df=n-1)



##############################################
# Tehtävä 4

# a)
x <- seq(-8, 8, by=0.01)
plot(x,dt(x,df=n-1), main="Tehtävä 4", ylab=NA,type='l')

# b)
abline(v=qt(0.025, df=n-1, lower=0), col="red")
abline(v=qt(0.975, df=n-1, lower=0), col="red")

# c)
abline(v=tt, col="blue")

# d)
# Ei-kriittinen alue on punaisten pylväiden välinen alue. Näiden ulkopuolella on kriittinen alue.
# Kuvasta näemme, että t-testisuureen arvon mukainen pylväs ei sisälly punaisten pylväiden väliin,
# vaan oikeammanpuoleisesta pylväästä oikealle. t-testisuureen arvo on siis kriittisellä alueella.



##############################################
# Tehtävä 5
print("Tehtävä 5")

# a)
otos <- rt(100, df=n-1)

# b)
abline(v=otos, col="purple")

# c)
# Muutama viivaa näyttää olevan kriittisellä alueella,
# mutta ei yhtä kaukana kuin sininen viiva t-testisuureen arvo

# d)
alpha <- qt(0.025, df=n-1, lower=0)
length(otos[otos > alpha | otos < -alpha])



##############################################
# Tehtävä 6

# a)
otokset <- replicate(100, rnorm(n, mean=2.2, sd=sd(ot$tyytyvaisyys, na.rm=1)))

# b)
z <- apply(otokset, 2, t_testisuure)

# c)
plot(x, dnorm(x),main="Tehtävä 6", ylab=NA, type='l')

# d)
abline(v=qnorm(0.025, lower=0), col="red")
abline(v=qnorm(0.975, lower=0), col="red")

# e)
abline(v=z, col="purple")

# f)
# Tulos on samankaltainen kuin tehtävässä 4
# eli muutama viiva on kriittisellä alueella.
# Otokset ovat jakaumasta ja niiden keruuseen liittyy satunnaisuus.
# Tämä satunnaisuus välittyy kuvassa, kun testaamme sitä oikeaa odotusarvoa vasten.
# Siis yksittäisen havainnon ottamiseen jakaumasta liittyy satunnaisuutta kiinteällä odotusarvolla
# ja otoksen keskiarvo poikkeaa siten odotusarvosta satunnaisuuden määräämänä. Toisinaan (harvoin)
# otos on sellainen, että sen keskiarvo poikkeaa suuresti eli se on kriittisellä alueella



##############################################
# Tehtävä 7
print("Tehtävä 7")

# a)
t_testi <- function(y, s, n, mu) {
	t_testisuure <- (y-mu)/(s/sqrt(n))
	p_arvo <- 2*(1-pt(t_testisuure, df=n-1))
	# t.test() mukainen p-arvo 
	# p_arvo <- 2*pt(-t_testisuure, df=n-1)
	tt <- qt((1-0.95)/2, df=n-1, lower=0)
	vali <- c(y - tt*(s/sqrt(n)), y + tt*(s/sqrt(n)))
	luottamusvali_95 <- sum(vali)/length(vali)
	return(c(t_testisuure, p_arvo, luottamusvali_95))
}

# b)
t_testi(mean(ot$tyytyvaisyys, na.rm=1), sd(ot$tyytyvaisyys, na.rm=1), n, 2.2)
t.test(ot$tyytyvaisyys, mu=2.2)



##############################################
# Tehtävä 8
print("Tehtävä 8")

# a)
ot$q5_2 <- factor(ot$q5_2, labels=c("nainen", "mies"))

# b)
n1 <- sum(!is.na(ot$tyytyvaisyys[ot$q5_2 == "nainen"]))
n2 <- sum(!is.na(ot$tyytyvaisyys[ot$q5_2 == "mies"]))
s1 <- sd(ot$tyytyvaisyys[ot$q5_2 == "nainen"], na.rm=1)
s2 <- sd(ot$tyytyvaisyys[ot$q5_2 == "mies"], na.rm=1)
sp <- sqrt(((n1 - 1)*s1**2 + (n2 - 1)*s2**2) / (n1 + n2 - 2))
sp

# c)
y1 <- mean(ot$tyytyvaisyys[ot$q5_2 == "nainen"], na.rm=1)
y2 <- mean(ot$tyytyvaisyys[ot$q5_2 == "mies"], na.rm=1) 
tt <- (y1-y2)/(sp*sqrt(1/n1 + 1/n2))
tt

# d)
p <- 2*(1-pt(tt, df=(n1+n2-2)))
p

# e)
t.test(tyytyvaisyys~q5_2, data=ot, subset= q5_2 == "nainen" | q5_2 == "mies", var.equal=TRUE)
# Nollahypoteesi voidaan hylätä, sillä p-arvo on kyllin pieni



##############################################
# Tehtävä 9
print("Tehtävä 9")

O <- matrix(c(120, 80, 140, 60), ncol=2)
chisq.test(O, corr=F)
# p-arvo = 0.03603, joka on kyllin suuri ettei nollahypoteesia tarvitse hylätä
# Siis toisin kuin esim. 5.24 emme hylkää nollahypoteesia



##############################################
# Tehtävä 10
print("Tehtävä 10")

punainen <- c(73, 94-73)
vihreä <- c(71, 86-71)
sininen <- c(61, 74-61)
taulu <- matrix(c(punainen, vihreä, sininen), ncol=3)
chisq.test(taulu, corr=F)
# p-arvo p-value = 0.6404
# Emme hylkää nollahypoteesia