##############################################
# Viikko 4                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")

# a)
ot <- read.csv2(file='OT2014.csv', stringsAsFactors=0)

menot <- subset(ot, select=paste("q3_7a1_", 1:9, sep=""))

ql <- c("q3_6_1a", "q3_6_1b", "q3_6_2a", "q3_6_2b")
tulot <- subset(ot, select=c(ql, paste("q3_6_", 3:11, sep="")))

# b)
kaikkimenot <- apply(menot, 1, sum)

kaikkitulot <- apply(tulot, 1, sum)

# c)
budjetti <- kaikkitulot - kaikkimenot
ot <- data.frame(ot, budjetti)
summary(budjetti)



##############################################
# Tehtävä 2
print("Tehtävä 2")

# a)
ot$q5_1 <- as.Date(paste(ot$q5_1, "-1", sep=""))
summary(ot$q5_1)

# b)
ot$q5_1 <- as.numeric(format(ot$q5_1, "%Y"))

# c)
ika <- 2013 - ot$q5_1



##############################################
# Tehtävä 3
print("Tehtävä 3")

# a)
ikaryhma <- cut(ika, breaks=c(0,22,25,28,31,100))

# b)
ikaryhma <- factor(ikaryhma, labels=c("0-22", "22-25", "25-28", "28-31", "31-100"))

# c)
table(ikaryhma)
plot(ikaryhma, main="Ikäryhmät",col=c("red","orange", "yellow", "green", "blue"))



##############################################
# Tehtävä 4
print("Tehtävä 4")

# a)
tapply(budjetti, ikaryhma, mean, na.rm=TRUE)
tapply(budjetti, ikaryhma, median, na.rm=TRUE)
tapply(budjetti, ikaryhma, function(x) median(x, na.rm=1)/mean(x, na.rm=1))
#    0-22     22-25     25-28     28-31    31-100 
# 0.1879171 0.3715263 0.1116811 0.2715335 0.4707040
# Suhde on suurimmillaan ikäryhmällä 31-100 ja
# pienimmillään ikäryhmällä 25-28

# b)
boxplot(budjetti ~ ikaryhma)
# Ikäryhmät, joissa suhde on suurinta: boxplotin pallot ovat enemmän erillään ja 
#                            pienintä: pallot ovat enemmän kasassa.
# Suurimman tapauksessa, myös muutama pallo on karannut korkeammalle.
# Mediaanin ja keskiarvon suurin ero on ikäryhmällä 25-28. Taustalla voi olla syynä parempi
# palkkaiset työtehtävät

# c)
budjetti <- budjetti
budjetti[budjetti > 6000] <- NA
tapply(budjetti, ikaryhma, mean, na.rm=TRUE)
tapply(budjetti, ikaryhma, median, na.rm=TRUE)
tapply(budjetti, ikaryhma, function(x) median(x, na.rm=1)/mean(x, na.rm=1))
boxplot(budjetti ~ ikaryhma, main="Budjetti ikäryhmittäin", col=c("red", "orange", "yellow", "green", "blue"))

# d)
# Keskiarvo: Jokaisen ikäryhmän keskiarvobudjetti pieneni ja ikäryhmien välisten budjettien erot pienenivät
# Mediaani: Myös mediaanit pienenivät, mutta eivät niin paljon kuin keskiarvot
# Esim: ikaryhma 25-28  budjetti(kaikki) budjetti(< 6000) muutos(erotuksen itseisarvo - Manhanttan etäisyys)
#       keskiarvo       1925.1248        430.0830         1495.0420
#       mediaani        215.0            198.88           16.12
# Mediaani olisi parempi tunnusluku tässä tilanteessa, koska se ei ole yhtä altis yksittäisille suurille luvuille



##############################################
# Tehtävä 5
print("Tehtävä 5")

# a)
luotettavuusvali <- function(data, p=0.95, na.rm=FALSE) {
	if(na.rm==TRUE) {
		data <- data[!is.na(data)]
	}
	ybar <- mean(data)
	s <- sd(data)
	n <- length(data)
	t <- qt((1-p)/2, df=n-1, lower=0)
	vali <- c(ybar - t*(s/sqrt(n)), ybar + t*(s/sqrt(n)))
	return(vali)
}
luotettavuusvali(ot$budjetti[!is.na(ot$budjetti)])

# b)
t.test(ot$budjetti)$conf.int



##############################################
# Tehtävä 6

# a)
x <- seq(-5,5,by=0.01)
plot(x, dnorm(x),xlab="x", ylab="tiheysfunktio", type="l")

# b)
items <- c(1,3,6,10,20,50)
colors <- c("purple", "blue", "green", "yellow", "orange", "red")
for(i in 1:length(items)) lines(x, dt(x, df=items[i]), col=colors[i])



##############################################
# Tehtävä 7

kuva <- function(N=100) {
	# a)
	x <- c()
	#for(i in 1:200) x <- c(x, luotettavuusvali(rnorm(n=N)))
	x <- sapply(1:200, function (x) luotettavuusvali(rnorm(n=N)))
	x <- matrix(x, nrow=2)

	# b)
	p <- length(x[x[1,] < 0 & x[2,] > 0])/4
	plot(NULL, main=paste("n = ", N, ", actual: " ,p , "%", sep=""),xlab="x", ylab="y", ylim=c(-1,1), xlim=c(0,200))

	# c)
	for(i in 1:ncol(x)) segments(i, x[1,i], i, x[2,i])

	# d)
	y0 <- seq(0,200,by=0.01)
	lines(y0, 0*y0, col="red")
	return(x)
}

# e)
x <- kuva()
# Näyttäisi siltä, että suurin osa ~95% janoista peittää y=0 suoran

##############################################
# Tehtävä 8
print("Tehtävä 8")

length(x[x[1,] <= 0 & x[2,] >= 0])/2
print(paste(length(x[x[1,] < 0 & x[2,] > 0])/4, "%", sep="" ))



##############################################
# Tehtävä 9

x50 <- kuva(50)
x500 <- kuva(500)

# Kun n kasvaa, niin luottamusvälin pituus lyhenee. Eli kasvattamalla otoksen 
# kokoa saamme lyhyempiä 95% luottamustason luottamusvälejä.
# Jos voisimme kasvattaa otoksen kokoa rajatta, luottamusväli lähetyisi
# todellista parametri pistettä. 