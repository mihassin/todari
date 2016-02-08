def binomial(n, k):
	if( k<0 or k>n):
		return 0
	if(n == k or k == 0):
		return 1
	return factorial(n) / (factorial(k)*factorial(n-k))

def factorial(n):
	res = n
	for i in range(1, n):
		res *= i
	return res

def pwr(a, n):
	if n < 0:
		return("negative exponents not supported yet!")
	if n == 0:
		return 1
	res = a
	for i in range(n-1):
		res *= a
	return res

def bin_dist(n,k,p):
	return binomial(n,k)*pwr(p,k)*pwr(1-p,n-k)