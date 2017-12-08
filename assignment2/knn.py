#!/usr/bin/env python
import random
import math
import operator

mesh = open("Felipe1.obj")
vertex = []

# read vertex data from obj
for line in mesh:
	if "vt" in line:
		vertex.append(line.split()[1])
		vertex.append(line.split()[2])

# generate point cloud matrix
cloud = [[vertex[y] for x in range(2)] for y in range(len(vertex))]

print("POINT CLOUD:")
for value in cloud:
	print(value[0], end=', ')
	print(value[1])

# KNN
