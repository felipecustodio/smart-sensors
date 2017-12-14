#!/usr/bin/env python
'''
Export OBJ as point cloud
'''
import sys
import operator

if (len(sys.argv) < 2):
    print("Usage: obj2points.py file.obj")
    exit()

file = sys.argv[1]
mesh = open(file)

vertex = {}

# read vertex data from obj
print("x,y,z")
for line in mesh:
    if "v " in line:
        x = float(line.split()[1])
        y = float(line.split()[2])
        z = float(line.split()[3])
        # ground offset
        if (z * 100) > -4.0:
            vertex[x, y] = z
            print(str(x*100) + "," + str(y*100) + "," + (z*100))