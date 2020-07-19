#! /bin/bash
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-05-18 kdw  pass output thru .fw.pl
# 2020-05-11 kdw  local-func syntax changed
# 2020-05-04 kdw  output error messages (if any)
# 2020-05-03 kdw  10 lines output
# 2020-04-30 kdw  vv variable
# 2020-04-28 kdw  created

vv=$1

make
if [ $? -eq 0 ] ; then
   for ii in ~/Dropbox/kdpwroot/codekdw/kw-lib/Kw*.fwipp ; do
      echo -n "$ii:"
      fl=$(mktemp -p $TMPDIR)
      f2=$(mktemp -p $TMPDIR)
      cat $ii | fwip.tab 2>$f2 > $fl
      if [ $? -ne 0 ] ; then
         echo "ERROR"
         tail -n10 $fl | ./.fw.pl
         cat $f2
      elif [ -n "$vv" ] ; then
         echo "FAILED"
         cat $fl | ./.fw.pl
      else
         echo "SUCCESS"
      fi
      rm $fl $f2
   done
fi
