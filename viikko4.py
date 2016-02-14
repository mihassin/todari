import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import simps

def f2(x):
	return (1/36)*(9 - np.power(x,2))

def t_6a():
	t = np.arange(-3.0,3.1,0.1)
	y = np.zeros(np.shape(t))
    xplus = np.arange(3.0,4.0,0.1)
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

def t_6b():
	x = np.array([-1,0,1])
	y1 = f2(x)
	I1 = simps(y1,x)
	print(I1)

def exp_dist_f(lm,x):
	return lm*np.e**(-lm*x)

def exp_dist_int_len1(lm,x):
	return (np.e**(-lm*x))*(1-np.e**(-lm))

def t_7c(x):
 return "asd"