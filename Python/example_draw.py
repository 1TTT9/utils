%matplotlib inline
from pylab import *
import os, sys, time
import numpy as np

def myy(t):    return 1-np.sin(t*math.pi*0.5)
def myx(t):    return 1-np.cos(t*math.pi*0.5)


npts = 2* pow(10,7)
t1 = np.arange(0, 1, 1./20)
t2 = np.arange(0, 1, 1./npts)
fig, ax = plt.subplots(figsize=(14,8))
ax.plot(myx(t1), myy(t1), color="blue", label=u'test1')
ax.plot(myx(t2), myy(t2), color="red", label=u'test2')
ax.set_xlabel('x')
ax.set_ylabel('y')
title('')
plt.legend()
show()


def writeFile(fname="big.in"):
	time_start = time.time()
	with open(fname, 'wb') as fd:
	    for t in t2:
	        fd.write("%f\t%f\n" % (myx(t), myy(t)))

	print os.stat(fname).st_size, "(bytes)"
	print "time spent: %4.1f" % (time.time()-time_start)


def drawFile(fname="big.in"):
	tmpx = [];tmpy = []
	time_start = time.time()

	with open(fname, 'rb') as fd:    
	    while True:
	        line = fd.readline()
	        if not line:
	            break
	     
	        dx,dy = line.split('\t')
	        tmpx.append(float(dx))
	        tmpy.append(float(dy))
	    
	fig, ax = plt.subplots(figsize=(14,8))
	ax.plot(tmpx,tmpy, color="blue", label=u'test1')
	ax.set_xlabel('x')
	ax.set_ylabel('y')
	title('')
	plt.legend()
	show()

	print "time spent: %4.1f" % (time.time()-time_start)