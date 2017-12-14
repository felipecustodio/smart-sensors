#!/usr/bin/env python
'''
Parse Weka cluster coordinates
'''
import sys
import operator
import numpy as np

if (len(sys.argv) < 2):
    print("Usage: parse_cluster.py file.obj")
    exit()

file = sys.argv[1]
cluster = open(file, "r")

x = []
y = []
z = []

print("x,y,z")
for line in cluster:
  if "x : " in line:
    print(line.split()[2], end=',')
  if "y : " in line:
    print(line.split()[2], end=',')
  if "z : " in line:
    print(line.split()[2])