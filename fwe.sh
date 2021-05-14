#! /bin/bash
#    Copyright (C) 2019-2021 by Kevin D. Woerner
# 2021-03-09 kdw  cx work
# 2021-03-05 kdw  -r command line option
# 2021-02-03 kdw  debugging
# 2020-11-30 kdw  osdep comment change
# 2020-11-27 kdw  no net change
# 2020-06-30 kdw  BC: change resolution
# 2020-04-10 kdw  error message
# 2020-03-27 kdw  rpn work
# 2020-03-25 kdw  major rework
# 2020-03-24 kdw  script name errors
# 2020-03-20 kdw  preprocess stdin
# 2020-03-17 kdw  tweak
# 2020-02-28 kdw  file names
# 2020-01-10 kdw  format work
# 2019-10-02 kdw  comment change
# 2019-09-05 kdw  parallelization
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-07-04 kdw  C file names
# 2019-06-27 kdw  spaces in input rmed
# 2019-06-26 kdw  bc work
# 2019-06-15 kdw  reorg
# 2019-06-12 kdw  created
declare -a strx

scl=20
fmt="%+.${scl}g"

verbose_flag=0
c_flag=0
py_flag=0
pl_flag=0
gg_flag=0
bc_flag=0
vb_flag=0
rpn_flag=0
ratio_flag=0
declare -a file_arr
declare -a arg_arr
if [ -n "$1" ] ; then
   for arg ; do
      if [[ "${arg:0:1}" == "-" ]] ; then
         while [[ "$arg" != "-" ]] ; do
            case $arg in
               -vb*     )  vb_flag+=1 ; arg="-${arg:3}" ;;
               -c*      )   c_flag+=1 ; arg="-${arg:2}" ;;
               -py*     )  py_flag+=1 ; arg="-${arg:3}" ;;
               -python* )  py_flag+=1 ; arg="-${arg:6}" ;;
               -pl*     )  pl_flag+=1 ; arg="-${arg:3}" ;;
               -perl*   )  pl_flag+=1 ; arg="-${arg:5}" ;;
               -gg*     )  gg_flag+=1 ; arg="-${arg:3}" ;;
               -gendat* )  gg_flag+=1 ; arg="-${arg:6}" ;;
               -bc*     )  bc_flag+=1 ; arg="-${arg:3}" ;;
               -rpn*    ) rpn_flag+=1 ; arg="-${arg:4}" ;;
               -r*      ) ratio_flag+=1 ; arg="-${arg:2}" ;;
               -v* ) verbose_flag+=1; set -x; arg="-${arg:2}" ;;
               -* ) cat <<EOF
$0:Bad Arg $arg
Options:
   -vb -c -py -python -pl -perl -gg -gendat -bc -rpn
EOF
                     exit 1 ;;
            esac
         done
      elif [ -f "$arg" ] ; then
         file_arr+=("$arg")
      else
         arg_arr+=("$arg")
      fi
   done
fi

if [[ 0 -eq $vb_flag && 0 -eq $c_flag && 0 -eq $bc_flag &&\
         0 -eq $gg_flag && 0 -eq $py_flag &&\
         0 -eq $pl_flag && 0 -eq $rpn_flag ]] ; then
   c_flag=1
   py_flag=1
   pl_flag=1
   gg_flag=1
   bc_flag=1
   rpn_flag=1
   if [ -n "$CYGWIN" ] ; then   # OS dep CYG
      vb_flag=1                 # OS dep CYG
   fi                           # OS dep
fi

strc=""
strpy=""
strpl=""
strgendat=""
declare -a gendat_arr
strbcc=""
strvb6=""
strrpn=""
declare -a rpn_arr

function verbose_print ()
{
   if [ $verbose_flag -ne 0 ] ; then
      echo "-----$1"
      echo "$2"
   fi
}

func_count=0
function doit ()
{
   for ee ; do
      #remove comments
      ee=${ee%%#*}
      if [ -n "$ee" ] ;then
         let func_count=$func_count+1
         func_str=$(printf "%4.4d" $func_count)
         ff=${ee//%/%%}
         if [ $py_flag -ne 0 ] ; then
            strpy+="\
print(\"PYTHON   $func_str $ff = {:+.${scl}g}\".format($ee))
"
         fi

         if [ $pl_flag -ne 0 ] ; then
            strpl+="\
printf(\"%-8s $func_str $ff = $fmt\n\",\"PERL\", $ee);
"
         fi

         if [ $c_flag -ne 0 ] ; then
            strc+="\
printf(\"%-8s $func_str $ff = $fmt\\n\", \"C\", (double)($ee));
"
         fi

         if [ $gg_flag -ne 0 ] ; then
            strgendat+=" $ee"
            gendat_arr+=($ee)
         fi

         if [ $bc_flag -ne 0 ] ; then
            strbcc+="\
print \"BCC      $func_str $ee = \", $ee, \"\\n\";
"
         fi

         if [ $vb_flag -ne 0 ] ; then
            ff=${ee//%/ Mod }
            strvb6+="   === \"VB6      $func_str $ff = \" \
& fmt($ff) & vbNewLine
"
         fi

         if [ $rpn_flag -ne 0 ] ; then
            strrpn+="$ee
"
            rpn_arr+=("$ee")
         fi
      fi
   done
}

if [ ${#arg_arr[@]} -le 0 ] ; then
   if [[ 0 -eq ${#file_arr[@]} ]] ; then
      # read from stdin if no input so far
      echo "READING STDIN:"
      silly=$(cat | perl -pe "s/ +//g;s/;/\n/g;")
   elif [[ 0 -lt $ratio_flag ]] ; then
      silly=$(grep -E "#TEST:" "${file_arr[@]}" |
            perl -pe "s/[; ]+//g;s/.*#TEST://;
               s@(.*)==(.*)@(\$1)/(\$2)-1@;")
   else
      silly=$(grep -E "#TEST:" "${file_arr[@]}" |
            perl -pe "s/[; ]+//g;s/.*#TEST://;
               s@(.*)==(.*)@(\$1)-(\$2)@;")
   fi
else
   silly=${arg_arr[@]}
fi
doit $silly

temp_dir="$TMPDIR/,,,fwip-tests-dir"
mkdir -p "$temp_dir"
bsnm=${0##*/}
temp_file="$temp_dir/$bsnm"
rm -f "$temp_file"*

# C ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- --
if [ -n "$strc" ] ; then
   (cat <<EOF > "$temp_file.c"
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "Kw.h"
#include "Kwsun.h"
#include "Kwplanets.h"
#include "Kwelements.h"
#include "Tm_Const.h"
int main(void)
{
EOF
   echo "$strc" | perl -pe "s/\b(cx\w+)/\$1()/g" \
         >> "$temp_file.c"
   echo "return(0);
}
" >> "$temp_file.c"
   verbose_print C "$(cat "$temp_file.c")"
   gc "$temp_file.c" -o"$temp_file.c.exe" \
      "$KW_DIR_LIB/libTm_Const.a" \
      "$KW_DIR_LIB/libKwsun.a" \
      "$KW_DIR_LIB/libKwplanets.a" \
      "$KW_DIR_LIB/libKwelements.a" \
      "$KW_DIR_LIB/libKw.a" \
      -I"$KW_DIR_INCLUDE" -lm
   "$temp_file.c.exe" ) > $temp_file.c.out &
fi

# K-RPN ---- ----- ----- ----- ----- ----- ----- ----- ----- ----
if [ $rpn_flag -ne 0 ] ; then
   file_in="$temp_file.k-rpn.in"
   file_output="$temp_file.k-rpn.output"
   file_out="$temp_file.k-rpn.out"
   (echo "$strrpn" | alg2rpn | grep -E "[^ ]" > "$file_in"
   verbose_print K-RPN "$(cat "$file_in")"
   cat "$file_in" | k-rpn > $file_output

   sew -l -o" = " $file_in $file_output |
      perl -pe "print \"K-RPN    \",sprintf(\"%4.4d\",\$.),\" \";
            s/ += +/ = +/;s/\+-/-/;" ) > $file_out &
fi

# PYTHON ---- ----- ----- ----- ----- ----- ----- ----- ----- ---
if [ -n "$strpy" ] ; then
   (verbose_print PYTHON "$strpy"
   python3 -c "$(cat <<EOF
#! /usr/bin/python3
import math
from Kw import *
from Kwsun import *
from Kwplanets import *
from Kwelements import *
from Tm_Const import *
EOF
)
$strpy" ) > $temp_file.python.out &
fi
# PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- -----
if [ -n "$strpl" ] ; then
   (verbose_print PERL "$strpl"
   perl -e "$(cat <<EOF
#! /usr/bin/perl -W
use strict;
use lib "\$ENV{KW_DIR_INCLUDE}";
use Kw         qw( :ALL );
use Kwsun      qw( :ALL );
use Kwplanets  qw( :ALL );
use Kwelements qw( :ALL );
use Tm_Const   qw( :ALL );
EOF
)
$strpl" ) > $temp_file.perl.out &
fi

# GENDAT ---- ----- ----- ----- ----- ----- ----- ----- ----- ---
strgendat="${gendat_arr[@]}"
if [ -n "$strgendat" ] ; then
   (verbose_print GENDAT "$strgendat"
   gendat -f"$fmt" $strgendat \
      | perl -e "$(cat <<EOF
my @cc = ();
while (<>) {
   chomp;
   if (m/\\S+/) {
      push(@cc, split(/\\s+/));
   }
}
my @dd = map {chomp;chomp;\$_}
      split(/\\s+/, "$strgendat");
for (my \$func_count=1; defined(\$cc[0]);\$func_count++) {
   my \$dd = shift(@dd);
   my \$cc = shift(@cc);
   printf("Gendat-V %4.4d %s = %s\\n", \$func_count, \$dd, \$cc);
}
EOF
)" ) > $temp_file.gendat.out &
fi

# BC ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- -
if [ -n "$strbcc" ] ; then
   (verbose_print BCC "$strbcc"
   echo "$strbcc" | perl -pe "s/([A-Za-z0-9]+)\\(/\\L\$1(/g" |
      bcc | perl -pe "s/-\./-0./g;s/ = ([0-9])/ = +\$1/;" \
         ) > $temp_file.bc.out &
fi
# VB6 ---- ----- ----- ----- ----- ----- ----- ----- ----- ---- -
if [ -n "$strvb6" ] ; then
   (verbose_print VB6 "$strvb6"
   . fwe-vb-run
   vb_run "$strvb6" "$temp_dir" "$bsnm.vb6" ) \
         > $temp_file.vb6.out &
fi

wait
cat $temp_file.*.out
