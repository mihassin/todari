####################################################
# Tilastollinen p‰‰ttely R-ohjelmistolla kev‰t 2016
# Viikko 2
# mallivastaukset

####################################################
# Teht‰v‰ 1
# a)
ot <- read.csv2('OT2014.csv', stringsAsFactors = F)
ot[1:10, 1:5]

# b)
# Koodi sukupuolelle on q5_2 (nainen=1, mies=2) 
# ja koodi palkkamuuttujalle on q1_12

# c)
# Tunnusluvut erikseen 
# Huom. argumentin na.rm arvoksi tarvitaan TRUE,
# jotta seuraavat funktiot eiv‰t huomioi puuttuvia arvoja
mean(ot$q1_12, na.rm = TRUE)
median(ot$q1_12, na.rm = TRUE)
min(ot$q1_12, na.rm = TRUE)
max(ot$q1_12, na.rm = TRUE)

# Tunnusluvut yhdell‰ funktiolla
summary(ot$q1_12)

# d)
#Naiset
mean(ot$q1_12[ot$q5_2 == 1], na.rm = TRUE)
#Miehet
mean(ot$q1_12[ot$q5_2 == 2], na.rm = TRUE)

# e)
# Muuttujan q1_5b koodauksessa 
# "Luonnontieteellinen ala" = 9 ja "Teknillistieteellinen ala" = 18
# Huomatkaa osa-aineiston valinnassa k‰ytetyt sulut.
median(ot$q1_12[ot$q5_2 == 1 & (ot$q1_5b == 9 | ot$q1_5b == 18)], na.rm = TRUE)

####################################################
# Teht‰v‰ 2
# a- ja b-kohtien laskemiseen on olemassa monta mahdollista tapaa.
# T‰ss‰ esitet‰‰n, kuinka ne voidaan laskea sum-funktiota k‰ytt‰m‰ll‰. 
# a)
# >= 5000e/kk arviot
sum(ot$q1_12 > 5000, na.rm = TRUE)

# < 5000e/kk arviot
sum(ot$q1_12 <= 5000, na.rm = TRUE)

# b)
# Puuttuvat vastaukset
sum(is.na(ot$q1_12))

# c)
hist(ot$q1_12[ot$q1_12 <= 5000])

####################################################
# Teht‰v‰ 3
# a)
mean(ot$q1_11b, na.rm = TRUE)

# Keskiarvo noin 3.38, joka vastaa likimain tasoa
# "Eiv‰t hyv‰t eik‰ huonot". T‰m‰n perusteella opiskelijoilla
# n‰ytt‰isi olevan siis melko neutraali k‰sitys mahdollisuuksistaan
# ulkomaalaisilla tyˆmarkkinoilla.

# b)
# Katsotaan, kuinka moni kyselyyn osallistuneista on vastannut 
# "En osaa sanoa" (koodattu arvolle 9)
sum(ot$q1_11b == 9, na.rm = TRUE)

# Osallistujista 514, eli l‰hes joka seitsem‰s, on vastannut EOS.
# Koska EOS on koodattu muuttujaan numeerisesti, v‰‰rist‰v‰t ne
# muuttujalle laskettua keskiarvoa. Korjataan asia merkitsem‰ll‰
# EOS:t puuttuviksi arvoiksi.
ot$q1_11b[ot$q1_11b == 9] <- NA
sum(ot$q1_11b == 9, na.rm = TRUE)

# Nyt muuttujassa on pelk‰st‰‰n asteikon 1-5 numeerisia arvoja.
# Lasketaan keskiarvo uudelleen.
mean(ot$q1_11b, na.rm = TRUE)

# Nyt keskiarvon havaitaan olevan l‰hell‰ tasoa
# "Melko hyv‰t". Siisp‰ opiskelijat jotka osasivat arvioida 
# mahdollisuutensa pitiv‰t niit‰ keskim‰‰rin melko hyvin‰.

####################################################
# Teht‰v‰ 4
# a)
curve(log(x/(1-x)), from = 0, to = 1)

# b)
abline(a = 0, b = 0, col = "blue")

# c)
# T‰ss‰ merkkin‰ on k‰ytetty teht‰v‰nannossa mainittua
# esimerkkiarvoa pch = 19. Muutkin arvot tietenkin kelpaavat.
points(x = 0.5, y = 0, col = 'red', pch = 19)

####################################################
# Teht‰v‰ 5
# a)
rbinom(n = 1, size = 10, prob = 1/2)
# Huom: Yht‰ hyvin k‰y
rbinom(n = 10, size=1, prob=1/2)
# Huom: N‰iss‰ kaksi eri koodia tuottaa erilaisen, mutta silti saman
#       vastauksen. On hyv‰ huomata, ett‰ yksitt‰isi‰ heittoja voi simuloida
#       joko heittokohtaisesti tai heittosarja kerrallaan
# Huom: Kaiken malliset viritykset k‰ytt‰en sample()-funktiota tai 
#	  vastaavia ovat t‰ysin kelpoja, kunhan koodi tuottaa oikean tuloksen.

# b)
sum(rbinom(n=100, size=10, prob=1/2))
#  Huom: T‰ss‰ lopputuloksen pit‰isi olla kokolailla 500

# c)
sum(rbinom(n=10000, size=10, prob=1/2))
# Huom: T‰ss‰ lopputuloksen pit‰isi olla kokolailla 50000

####################################################
# Teht‰v‰ 6
# a)
rnorm(n = 1, mean = 100, sd = 15)

# b)
result <- rnorm(n = 10000, mean = 100, sd = 15)

# c)
hist(result, freq = FALSE, ylim = c(0, 0.03))

# d)
# Funktion piirt‰mist‰ varten tarvitaan tarpeeksi monta pistett‰
# v‰lilt‰ (40, 160). Helpoin tapa m‰‰ritt‰‰ t‰llaiset pisteet on
# k‰ytt‰‰ funktiota seq().
pisteet <- seq(from = 40, to = 160, by = 0.1)
lines(x = pisteet, y = dnorm(pisteet , mean = 100, sd = 15), col = "red")

####################################################
# Teht‰v‰ 7
# a)
iris2 <- iris

# b)
iris2$Petal.Ratio <- iris2$Petal.Length/iris2$Petal.Width
iris2$Sepal.Ratio <- iris2$Sepal.Length/iris2$Sepal.Width

# c)
# Esimerkiss‰ v‰rit ja merkit ovat
# vihre‰ - 15 - setosa
# oranssi - 16 - versicolor
# sininen - 17 - virginica
# Lajikohtaiset merkit saadaan aivan samalla tavalla
# kuin lajikohtaiset v‰rit
iris_colors <- c("green", "orange", "blue")
iris_points <- 15:17
plot(Petal.Ratio~Sepal.Ratio, data = iris2, col = iris_colors[Species], pch = iris_points[Species])

####################################################
# Teht‰v‰ 8
boxplot(Sepal.Ratio ~ Species, data=iris2)
boxplot(Petal.Ratio ~ Species, data=iris2)

