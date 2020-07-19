#! /bin/bash
#    Copyright (C) 2015-2020 by Kevin D. Woerner
# 2020-01-29 kdw  circle funcs
# 2020-01-28 kdw  work on funcs w/ array args
# 2020-01-27 kdw  rework II
# 2020-01-26 kdw  rework
# 2019-04-04 kdw  tweak
# 2017-06-01 kdw  function renam
# 2016-05-25 kdw  minor refactor; long lines
# 2016-05-18 kdw  comment change
# 2016-04-28 kdw  minor refactor
# 2016-04-13 kdw  minor refactor
# 2015-12-02 kdw  renamed functions
# 2015-11-11 kdw  added -n to le[a]st-s[q]uares
# 2015-11-10 kdw  added le[a]st-s[q]uares
# 2015-11-09 kdw  rmed references to parabola_*
# 2015-11-05 kdw  refactor
# 2015-11-02 kdw  created

if [ -n "$1" ] ; then
   vv="$1"
else
   vv=$(randnum -U -n6 | tr "\n" "," | perl -pe "s/,$//")
fi

echo $vv | perl -ne "chomp;
@aa=split(/,/,\$_);
if (\$#aa == 5) {
   print \"(\$aa[0],\$aa[1])\n\";
   print \"(\$aa[2],\$aa[3])\n\";
   print \"(\$aa[4],\$aa[5])\n\";
}";

echo "******PERL: Circle"
perl -e "use Kw;
   my @hh = ($vv);
   my \$rad = Kw::circle_solve($vv);
   my \$xx = Kw::circle_get(0);
   my \$yy = Kw::circle_get(1);
   print \"CENTER=(\$xx,\$yy)\n\";
   print \"R_=\$rad\n\";
   print \"R1=\", Kw::hypot(\$hh[0]-\$xx, \$hh[1]-\$yy), \"\n\";
   print \"R2=\", Kw::hypot(\$hh[2]-\$xx, \$hh[3]-\$yy), \"\n\";
   print \"R3=\", Kw::hypot(\$hh[4]-\$xx, \$hh[5]-\$yy), \"\n\";
"

echo "******GENDAT: Parabola"
gendat -p"my @hh=($vv);my @yy=(0,0);" \
   "0*fit_poly(3,@hh,@yy)" \
   "\$yy[0]" \
   "\$yy[1]" \
   "\$yy[2]" \
   "0" \
   "horner(\$hh[0],2,@yy)" \
   "horner(\$hh[2],2,@yy)" \
   "horner(\$hh[4],2,@yy)" \
   "0" \
   "horner(1,2,@yy)" | perl -pe "s/ +/\n/g;s/^\+0$//gm;"

echo "******PERL: Parabola"
perl -e "use Kw;
   my @hh = ($vv);
   my @yy = ();
   Kw::fit_poly(3,@hh,@yy); \
   print \"\$yy[0]+\$yy[1]*x\+\$yy[2]*x*x\n\";
   print \"f(\$hh[0])=\",Kw::horner(\$hh[0],2,@yy),\"\n\";
   print \"f(\$hh[2])=\",Kw::horner(\$hh[2],2,@yy),\"\n\";
   print \"f(\$hh[4])=\",Kw::horner(\$hh[4],2,@yy),\"\n\";
   print \"f(1)=\",Kw::horner(1,2,@yy),\"\n\";
"

echo "******LS-SQU: Parabola"
echo "${vv//,/ }" | least-squares 2 -n -e0 1.0 |
   perl -pe "chomp;s/\*x\^\d +//g;s/.*fx= //;s/ +/\n/g;"
echo
