import numpy as np
import matplotlib.pyplot as plt

def t1f(x):
	a = 0.5*np.e
	exp = -np.abs(x)
	return a**exp

def t1():
	x = np.linspace(-20, 20, 1000000, endpoint=True)
	f = t1f(x)
	print(f.max())
	plt.plot(x, f, color='blue', linewidth=1.0, linestyle="-", label=r'$f(x)=\frac{1}{2}e^{-|x|}$')
	plt.xlim(x.min(), x.max())
	plt.ylim(-0.05, f.max()*1.05)
	plt.yticks([0, 0.25,0.5,0.75,1], [r'$0$', r'$1/4$', r'$1/2$', r'$3/4$', r'$-1$'])
	plt.legend(loc='upper left')
	ax = plt.gca()
	ax.spines['right'].set_color('none')
	ax.spines['top'].set_color('none')
	ax.xaxis.set_ticks_position('bottom')
	ax.spines['bottom'].set_position(('data',0))
	ax.yaxis.set_ticks_position('left')
	ax.spines['left'].set_position(('data', 0))
	plt.show()