#! /bin/bash
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-05-11 kdw  simplified
# 2020-04-01 kdw  updated
# 2020-03-31 kdw  updated

if [ -f "$1" ] ; then
   if [[ $1 =~ /*\.fwipp ]] ; then
      fwip-parse -v $1 | grep FUNCTION | perl -pe "
         s/.*FUNCTION-//;if(!s/DECL +//){s/\S+ +/   /}"
   elif [[ "$1" =~ .*\.fwip ]] ; then
      fwip-preprocess $1 |
            fwip-parse -v | grep FUNCTION | perl -pe "
         s/.*FUNCTION-//;if(!s/DECL +//){s/\S+ +/   /}"
   else
      echo "OOPS:$1"
   fi
else
   echo "Not a file"
fi
