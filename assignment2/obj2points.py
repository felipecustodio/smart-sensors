#!/usr/bin/env python
from sklearn.neighbors import KNeighborsClassifier
import sys
import operator

if (len(sys.argv) < 2):
	print("Usage: obj2points.py file.obj")
	exit()

file = sys.argv[1]
mesh = open(file)

vertex = {}

# read vertex data from obj
for line in mesh:
	if "v " in line:
		x = float(line.split()[1])
		y = float(line.split()[2])
		z = float(line.split()[3])
		# ground offset
		if ((z * 100) > -4.0):
			vertex[x,y] = z

# process data
neigh = KNeighborsClassifier(n_neighbors=3)



