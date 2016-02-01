import numpy as np
import sys

def next_state(x):
	if(x<0):
		print("invalid arguments")
	return np.mod((41*x+7), 100)

def next_val(x):
	if(x<0):
		print("invalid arguments")
	return np.floor(next_state(x)/10)

def possible_next_rnd(prev):
	if(prev>10 or prev<0):
		print("invalid arguments")
	n = prev*10
	for i in range(n,n+10):
		print(next_val(i))

def main(x, y):
	res = np.array(next_val(x))
	state = next_state(x)
	for i in range(y-1):
		res = np.append(res, next_val(state))
		state = next_state(state)
	print(res)

possible_next_rnd(2)

if __name__ == '__main__':
	a = int(sys.argv[1])
	b = int(sys.argv[2])
	main(a,b)