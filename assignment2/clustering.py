#!/usr/bin/env python
import sys
import operator
import matplotlib.pyplot as plt
import numpy as np

import networkx as nx

if (len(sys.argv) < 2):
    print("Usage: clustering.py file.obj")
    exit()

file = sys.argv[1]
mesh = open(file)
vertex = {}

# read vertex data from obj
lines = 0
for line in mesh:
    if "v " in line:
        x = float(line.split()[1])
        y = float(line.split()[2])
        z = float(line.split()[3])
        # ground offset
        if (z * 100) > -4.0:
            vertex[x, y] = z
            lines += 1

print("Total points = " + str(lines))
print("Generating graph...")

graph = nx.complete_graph(lines)
position = networkx.spring_layout(graph,dim=3)
print(position)
