#! /bin/bash
#    Copyright (C) 2016-2021 by Kevin D. Woerner
# 2021-03-07 kdw  updated
# 2019-09-17 kdw  rmed c[n]v_db[l]2i32
# 2019-07-26 kdw  oops
# 2019-06-27 kdw  use alg2rpn; split long pipe
# 2019-06-15 kdw  rpn work
# 2019-02-28 kdw  header line
# 2018-04-24 kdw  fixed
# 2018-04-02 kdw  vb syntax error
# 2017-08-26 kdw  perl problem
# 2017-04-20 kdw  VB6 support
# 2017-04-06 kdw  Python3 support
# 2017-02-08 kdw  syntax error in perl code
# 2016-12-13 kdw  rpn string refactor
# 2016-12-12 kdw  gg added to k-rpn call
# 2016-07-22 kdw  created
declare -a yyarr
temp_dir="$TMPDIR/,,,fwip-tests-dir"
mkdir -p "$temp_dir"
temp_bsn="$temp_dir/${0##*/}"
rm -f "$temp_bsn"*
temp_file="$temp_bsn.txt"

xx=13
yy=5

if [[ -n "$1" ]] ; then
   xx=$1
   shift
fi

if [[ -n "$1" ]] ; then
   yy=$1
   shift
fi

rm -rf $temp_file
for fn in fmodu modulo ddist dist fmod mods \
            floor2 ceil2 round2 ; do
   echo "$fn($xx,$yy)
$fn($xx,-$yy)
$fn(-$xx,$yy)
$fn(-$xx,-$yy)" >> $temp_file
done

echo "0func lang .x .y +x,+y +x,-y -x,+y -x,-y" > $temp_file.2

cat $temp_file | fwe |
   colu 3,1,4,c5+0.0 -i" +" -f"%.8g" |
   perl -pe "s/^\(//;s/\(.*\)//;s@=@ $xx $yy@;s/^[^a-z]+//" |
   sew "\\S+( +\\S+){3}" >> $temp_file.2

sort $temp_file.2 |
   colu -i" +" 1,3,4,5,6,7,8,2 |
   sew "(\\S+ +){7}" |
   align -n7 -jlrrrrrrl |
   sort -b -k2,7
