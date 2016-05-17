y1 <- c(0, .3, .5, .1, .1)
y2 <- c(.1, .4, .3, .2, 0)
x <- c(1, 2, 3, 4, 5)
png(filename="y1.png")
plot(x, y1, main="Pistetodennäköisyysfunktio", xlab="y", ylab="f(y; 1)", type="h")
dev.off()
png(filename="y2.png")
plot(x, y2, main="Pistetodennäköisyysfunktio", xlab="y", ylab="f(y; 2)", type="h")
dev.off()

y4<-c(.1, .2)
y5<-c(.1, 0)
x<-c(1, 2)
png(filename="theta1.png")
plot(x, y4, main="Uskottavuusfunktio",xlab=expression(paste(theta)),ylab=expression(plain("L(")~theta~plain("; 4)")))
dev.off()


png(filename="theta2.png")
plot(x, y5, main="Uskottavuusfunktio", xlab=expression(paste(theta)),ylab=expression(plain("L(")~theta~plain("; 5)")))
dev.off()

#plot(x,y,xlab=expression(paste(theta)),ylab=expression(plain("L(")~theta~plain("; 1)")), type="h")
