##############################################
# Viikko 1                                   #
# Tilastollinen päättely R-ohjelmistolla     #
##############################################



##############################################
# Tehtävä 1
print("Tehtävä 1")
# a
a <- 5 + 12
a

# b
a <- a * 3
a

# c
b <- a ** 3
b

# d
d <- log(b)
d

# e
d <- d ** (1/3)
d

# f
e <- cos(d)
e

#g
a+b+d+e



##############################################
# Tehtävä 2

# R:ssä on funktiot c() ja t() ja muuttuja
# nimien c ja t voi aiheuttaa sekaannusta.
# Huomattakoon kuitenkin, että kääntäjän
# kannalta tämä ei ole oleellista eli
# c ja t voidaan käyttää muuttujien niminä,
# mutta se haittaa lähinnä koodin luettavuutta.
#
# Lisää aiheesta: 
# http://adv-r.had.co.nz/Style.html
# http://c2.com/cgi/wiki?GoodVariableNames



##############################################
# Tehtävä 3

# Operaattori %% toimii kuten c-ohjelmointikielen
# % operaattori. Kyseessä on modulo-operaattori
# eli operaattori joka laskee vasemmanpuoleisen 
# operandin jakojäännöksen oikeanpuoleisella 
# operandilla jaettaessa.
# Jakoyhtälö a = b*q + r
# Tällöin:
# > a %% q
# [1] r 



##############################################
# Tehtävä 4

# Operaattori %/% toimii kuten c-kielen kokonais-
# lukujen jako eli se palauttaa jakolaskun
# kokonaisosan.
# Jakoyhtälö a = b*q + r
# Tällöin:
# > a %/% q
# [1] b 



##############################################
# Tehtävä 5
print("Tehtävä 5")
# a
v1 <- c(12, 2, -5, 6, 34)
v1

# b
v2 <- seq(0, 100, by=5) 
v2

# c
v3 <- c(v1, v2)
v3

# d
v4 <- v3[v3 > 3 & v3 < 50]
v4

# e
v4[v4 %% 10 == 0]



##############################################
# Tehtävä 6
print("Tehtävä 6")

A <- matrix(c(3, 5, 6, 0.5, sqrt(5), 16, 0, 2, 0), ncol=3, nrow=3, byrow=1)
A



##############################################
# Tehtävä 7
print("Tehtävä 7")

B <- t(A) %*% c(1,1,0)
B



##############################################
# Tehtävä 8
print("Tehtävä 8")

I <- diag(3)
I
print("Testataan: AI = I")
A%*%I == A

# Toimii kuten tavallinen matriisitulo
A%*%I

# Molempien matriisien vastaavat solut kerrotaan
# keskenään.
# A*c(1,1,0) taas kertoo jokaisen sarakkeen solut
# vastaavilla vektorin (1,1,0) soluilla 
# eli: 
#       [,1]     [,2]       [,3]
# [1,]  3.0*1 5.000000*1    6*1
# [2,]  0.5*1 2.236068*1   16*1
# [3,]  0.0*0 2.000000*0    0*0
A*I



##############################################
# Tehtävä 9
print("Tehtävä 9")

# c(runif(20, min=1, max=20)): 
# tasainen jakauma välillä 1-20 ja otoksen koko 20.
# Täten vastaus vaihtelee
C <- matrix(c(runif(20, min=1, max=20)), ncol=4)
length(C[C<5])



##############################################
# Tehtävä 10
print("Tehtävä 10")

C[C<5] <- 12
C



##############################################
# Tehtävä 11
print("Tehtävä 11")

C[c(T,T,T,T,F),c(F,T,T,T)]



##############################################
# Tehtävä 12
print("Tehtävä 12")

D <- matrix(1:100, ncol=2)
D[D %% 2 == 0] <- NA
D



##############################################
# Tehtävä 13
print("Tehtävä 13")

D[is.na(D)] <- 0
D

# Lisäpohdittava:
# > 1 == NA
# [1] NA
