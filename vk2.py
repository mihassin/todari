import numpy as np

sample_space = np.array(["A", "B", "C", "D", "E"])

def pwr(a, n):
	if n < 0:
		return("negative exponents not supported yet!")
	if n == 0:
		return 1
	res = a
	for i in range(n-1):
		res *= a
	return res

def factorial(n):
	res = n
	for i in range(1, n):
		res *= i
	return res

def combn():
	n = len(sample_space)
	for i in range(n-1):
		for j in range(i+1, n):
			print("{ " + sample_space[i] + ", "+ sample_space[j] + " }")

def n_combn(n, k):
	m = n - k + 1
	num = m
	denom = 1
	for i in range(m+1, n+1):
		num *= i
	for j in range(1, k+1):
		denom *= j
	return num / denom

def dice(n):
	score = 0
	for i in range(n):
		roll = np.random.randint(1,7)
		if roll >= 5:
			score += 1
	return float(score) / n

def superdice():
	score = 0
	for i in range(100):
		score += dice(10000000)
		print("Kierros "+str(i)+": " + str(score))
	return score / 100.0

def main():
	print(factorial(5))
	print(n_combn(52,4))
	
if __name__ == '__main__':
	main()