png(filename="tilv6.png")
x <- c(56,42,72,36,63,47,55,49,38,42,68,60)
y <- c(147,125,160,118,149,128,150,145,115,140,152,155)
z <- seq(min(x)-3,max(x)+3,by=0.01)
b <- 1764.67/1550.67
a <- mean(y)-b*mean(x)
plot(x,y,main="Aineisto ja PNS-suora",type="p")
lines(z,a+(b*z),col="red")
dev.off()