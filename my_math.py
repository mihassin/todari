def binomial(n, k):
	if( k<0 or k>n):
		return 0
	if(n == k or k == 0):
		return 1
	return factorial(n) / (factorial(k)*factorial(n-k))

def binomial_fancy(n,k):
	if k == 0 or n == k:
		return 1
	if k == 1:
		return n
	if k > (n-k):
		return binomial_fancy(n, n-k)
	return variation(n,k) / factorial(k)

def factorial(n):
	if n == 0:
		return 1
	res = n
	for i in range(1, n):
		res *= i
	return res

def fact_recursive(n):
	if n == 0:
		return 1
	return n*fact_recursive(n-1)

def variation(n,k):
	res = 1
	for i in range(k):
		res *= n-i
	return res

def pwr(a, n):
	if n < 0:
		return 1/pwr(a,abs(n))
	if n == 0:
		return 1
	res = a
	for i in range(n-1):
		res *= a
	return res

def bin_dist(n,k,p):
	return binomial(n,k)*pwr(p,k)*pwr(1-p,n-k)