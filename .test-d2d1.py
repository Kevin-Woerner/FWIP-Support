#! /usr/bin/python3
#    Copyright (C) 2020-2021 by Kevin D. Woerner
# 2021-03-07 kdw  outut change
# 2020-04-08 kdw  created
import Kw

lim = 200
def fifi(f1, f2):
   for ii in range(lim):
      print("{:12s}".format(f1.__name__), end='')
      print(" {:3d}".format(ii), end='')
      pt = [0,0]
      f1(ii, pt)
      print(" ({:3.0f},{:3.0f} )".format(pt[0], pt[1]), end='')
      jj = f2(pt[0], pt[1])
      print(" {:3d} {:3d}".format(jj, jj - ii))

fifi(Kw.d1spiral_d2, Kw.d2spiral_d1)
fifi(Kw.d1lt_d2, Kw.d2lt_d1)
fifi(Kw.d1ur_d2, Kw.d2ur_d1)
fifi(Kw.d1diamond_d2, Kw.d2diamond_d1)
