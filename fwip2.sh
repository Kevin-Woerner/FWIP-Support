#! /bin/bash
#    Copyright (C) 2019-2020 by Kevin D. Woerner
# 2020-05-13 kdw  trivial change wrt lang
# 2019-12-27 kdw  lowercase input
# 2019-09-24 kdw  refactor
# 2019-01-15 kdw  created

CAT=/bin/cat

function usage ()
{
   $CAT <<EOF
$0:$1
Usage: $0 LANG FILE
EOF
   exit -1
}
target_suffix=${1,,}
shift
input_file=$1
shift
suff=
for su in h pm units bc vb c rpn py varylog bas fwipp ; do
   if [ "XX$target_suffix" == "XX$su" ] ; then
      suff=$su
      break
   fi
done

if [ -z "$suff" ] ; then
   if [ "XX$target_suffix" == "XXperl" ] ; then
      suff="pm"
   elif [ "XX$target_suffix" == "XXpython" ] ; then
      suff="py"
   elif [ "XX$target_suffix" == "XXvb6" ] ; then
      suff="bas"
   elif [ "XX$target_suffix" == "XXvbdotnet" ] ; then
      suff="vb"
   elif [ "XX$target_suffix" == "XXfwip" ] ; then
      suff="fwipp"
   else
      usage "Unrecognized suffix:$target_suffix"
   fi
fi

in_file=
if [ -e "$input_file.fwipp" ] ; then
   in_file="$input_file.fwipp"
   fwip-translator --$suff -n$input_file $in_file
else
   if [ -e "$input_file.fwip" ] ; then
      in_file="$input_file.fwip"
   elif [ -e "$input_file" ] ; then
      in_file="$input_file"
   else
      usage "Unable to find input file:$input_file*"
   fi
   fwip-preprocess $in_file |
         fwip-parse |
         fwip-formatter |
         fwip-translator --$suff -n$input_file
fi
