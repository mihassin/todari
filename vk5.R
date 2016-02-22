tas <- function(n, a, b) {
	x = runif(n)
	y = (b-a)*x + a
	hist(y)
}

exp <- function(n) {
	x = runif(n)
	y = -log(x)
	hist(y)	
}

exp2 <- function(n) {
	x = runif(n)
	y = -log(x)
	(sum(y<=2)/n)
	hist(y)	
}