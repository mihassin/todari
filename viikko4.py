import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as colors
import matplotlib.cm as cm
from scipy.integrate import simps

'''
N = 9
menMeans = (20, 35, 30, 35, 27)
menStd = (2, 3, 4, 1, 2)

ind = np.arange(N)  # the x locations for the groups
width = 0.35       # the width of the bars

fig, ax = plt.subplots()
rects1 = ax.bar(ind, menMeans, width, color='r', yerr=menStd)

womenMeans = (25, 32, 34, 20, 25)
womenStd = (3, 5, 2, 3, 3)
rects2 = ax.bar(ind + width, womenMeans, width, color='y', yerr=womenStd)

# add some text for labels, title and axes ticks
ax.set_ylabel('Scores')
ax.set_title('Scores by group and gender')
ax.set_xticks(ind + width)
ax.set_xticklabels(('2', '3', '4', '5', '6', '7', '8', '9', '10'))
'''

def contains(arr, item):
	for i in arr:
		if item == i:
			return True
	return False


def t_1_pic(S):
	fig, ax = plt.subplots()
	Ntotal = 24
	N, bins, patches = ax.hist(S,9)
	fracs = N.astype(float)/N.max()
	norm = colors.Normalize(fracs.min(), fracs.max())
	for thisfrac, thispatch in zip(fracs, patches):
		color = cm.jet(norm(thisfrac))
		thispatch.set_facecolor(color)
	ax.set_title('S:n Pistetodennäköisyysfunktio ja pistetodennäköisyydet histogrammina')
	ax.set_ylabel('kappalemäärä')
	ax.set_xlabel('X+Y')
	plt.plot([2,3,4,5,6,7,8,9,10], [1,2,3,4,4,4,3,2,1], 'ro')
	plt.xlim(1,11)
	plt.ylim(0,5)
	plt.show()



def t_1():
	X = np.array([1,2,3,4,5,6])
	Y = np.array([1,2,3,4])
	S = np.array([])
	for i in range(len(X)):
		for j in range(len(Y)):
			print("(" + str(X[i]) + ", " + str(Y[j]) +")")
	for i in range(len(X)):
		for j in range(len(Y)):
			S = np.append(S, X[i] + Y[j])
			print("S = " + str(X[i]) + " + " + str(Y[j]) + " = " + str(X[i] + Y[j]))
	S = np.sort(S)
	for i in range(len(S)):
		print(S[i])
	s = dict()
	for i in S:
		keys = list(s.keys())
		if contains(keys, i):
			s[i] = s[i] + 1
		else:
			s[i] = 1
	summ = 0
	for key in s.keys():
		summ += s[key]
		print(str(key) + ": " + str(s[key]))
	print(summ)
	return S, s

#Simple poly-function
def f2(x):
	return (1/36)*(9 - np.power(x,2))


def t_6a():
	t = np.arange(-3.0,3.1,0.1)
	y = np.zeros(np.shape(t))
    #xplus = np.arange(3.0,4.0,0.1)
	xminus = -xplus
	x = np.zeros(np.shape(xplus))

	plt.plot(t, f2(t), 'r', 
	         xplus, x, 'r',
	     	 xminus, x, 'r',
	     	 t, y, 'k', 
	     	 y, t, 'k')
	plt.ylim(-.1,np.max(f2(t))+0.01)
	plt.xlim(-3.9,3.9)
	plt.show()

#Integral value for f2 from -1 to 1
def t_6b():
	x = np.array([-1,0,1])
	y1 = f2(x)
	I1 = simps(y1,x)
	print(I1)

#Probability density function with lambda := lm and variable x
def exp_dist_f(lm,x):
	return lm*np.e**(-lm*x)

#PDF exp_dist_f integrate from k to k+1
def exp_dist_int_len1(lm,x):
	return (np.e**(-lm*x))*(1-np.e**(-lm))
