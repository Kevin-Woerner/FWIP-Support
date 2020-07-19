#! /usr/bin/python3
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-04-12 kdw  created
from Kw import *
from Kwplanets import *

degs = [uni_rand(PI), uni_rand(TAU),
         uni_rand(PI), uni_rand(TAU)]
ii = 0
for ar in sys.argv[1:]:
   degs[ii] = deg2rad(float(ar))
   ii += 1

def pa(st, ang):
   print("{}{:12.7f}".format(st, rad2deg(ang)), end='')

def pp(distance, *args):
   print("{:10.7f}".format(distance), end='');
   for ar in args:
      pa(" ", ar)
   print("")

pa("(", degs[0])
pa(",", degs[1])
pa(") (", degs[2])
pa(",", degs[3])
print(")")

dd = sphere_d(*degs);
pp(dd);
hh = [0,0];
dd = ellipsoid_distance(EARTHFLATNESS, *degs, hh);
pp(dd, *hh);
dd = ellipsoid_distance(0, *degs, hh);
pp(dd, *hh);
dd = sphere_distance(*degs, hh);
pp(dd, *hh);
