#! /usr/bin/python3
#    Copyright (C) 2020-2021 by Kevin D. Woerner
# 2021-03-16 kdw  updated
# 2020-04-12 kdw  created
from Kw import *
from Kwplanets import *

degs = [uni_rand(PI) - PI / 2, uni_rand(TAU) - TAU / 2,
         uni_rand(PI) - PI / 2, uni_rand(TAU) - TAU / 2 ]
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

pa("A=(", degs[0])
pa(",", degs[1])
pa(") B=(", degs[2])
pa(",", degs[3])
print(")")

hh = [0,0];
print("        DISTANCE    A-to-B-dir  B-to-A-dir")
print("EARTH: ", end='')
dd = ellipsoid_distance(EARTH_FLATNESS, *degs, hh);
pp(dd, *hh);
print("BALL:  ", end='')
dd = ellipsoid_distance(0, *degs, hh);
pp(dd, *hh);
print("SPHERE:", end='')
dd = sphere_distance(*degs, hh);
pp(dd, *hh);
