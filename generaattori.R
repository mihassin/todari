seuraava_tila <- function(x) {
	if (x < 0) {
		return("invalid arguments")
	}
	return((41*x + 7) %% 100)
}

seuraava_luku <- function(x) {
	if (x < 0) {
		return("invalid arguments")
	}
	return(floor(seuraava_tila(x)/10))
}

sarja <- function(x, y) {
	tulos <- seuraava_luku(x)
	tila <- seuraava_tila(x)
	while(length(tulos) < y) {
		tulos <- c(tulos, seuraava_luku(tila))
		tila <- seuraava_tila(tila)
	}
	return(tulos)
}

