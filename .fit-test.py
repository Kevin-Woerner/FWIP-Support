#! /usr/bin/python3
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-07-16 kdw  updated
# 2020-04-12 kdw  created
from Kw import *

slope = 2#129/64.0;
intercept = 4#.00001;
eps = 0.001
arr = []
for ii in [ 0, 0.5, 2, 3, 4 ]:
   arr.extend([ii,slope * ii + intercept + 0.0*gau_rand()])

for ii in range(2,len(arr),2):
   print("({:10.6f},{:10.6f})".format(arr[ii], arr[ii + 1]))

for gg in range(-20,21,1):
   ff = gg * eps
   narr = arr.copy()
   coef = [0,0,0]
   narr[1] += ff
   err = fit_minmax(int ((len(narr) + 1) / 2), narr, coef)
   print("({:10.6f},{:10.6f})".format(narr[0], narr[1]), end='')
   print("{:12.9f}  {:12.9f}*x{:+12.9f} {:12.9f}"
      .format(err, coef[1], coef[0], coef[2]))
