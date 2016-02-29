t3 <- function(n) {
	p <- 1/6
	kr <- sum(rbinom(n,1,p))
	x <- kr/n
	virhe <- abs(x-p)
	return(virhe)
}