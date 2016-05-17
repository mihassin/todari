f <- function(x, b) {
	return(x^4*(1-x)^6-b)
}

x <- seq(0,1,by=0.0001)
p<-4/10

png(filename="h5t6a.png")
c5 <- 0.5
b5 <- c5 * p^4 * (1-p)^6

vali <- seq(0.232489,0.58524, by=0.0001)

plot(x, f(x,b5),main="c=0.5", xlab=expression(theta),ylab=NA, xlim=c(0.05,0.95),type="l")
abline(h=0)
lines(vali,0*vali, col="blue")
points(c(0.232489,0.58524),c(0,0),pch=19,col="red")
dev.off()


png(filename="h5t6b.png")
c1 <- 0.1
b1 <- c1 * p^4 * (1-p)^6

vali <- seq(0.128493,0.725028, by=0.0001)

plot(x, f(x,b1),main="c=0.1", xlab=expression(theta),ylab=NA, xlim=c(0.05,0.95),type="l")
abline(h=0)
lines(vali,0*vali, col="blue")
points(c(0.128493,0.725028),c(0,0),pch=19,col="red")
dev.off()