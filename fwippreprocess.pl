#! /usr/bin/perl -W
#    Copyright (C) 2018-2019 by Kevin D. Woerner
# 2019-12-09 kdw  s/qw /qw/;
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2018-12-07 kdw  explicit imported funcitons
# 2018-10-26 kdw  accidental comment changed
# 2018-05-20 kdw  helpful hint on bad options
# 2018-03-05 kdw  use exported funcs
# 2018-02-17 kdw  created
use strict;
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Preprocess qw();

if (!defined($ARGV[0])) {
   print Fwip_Preprocess::fwippp_preprocess(undef);
} else {
   for my $arg (@ARGV) {
      if (! -f "$arg") {
         die <<EndOfUsage;
$0:NOEXIST:$arg
Usage: $0 [FILE]
Preprocess input as a FWIP file
EndOfUsage
      } else {
         print Fwip_Preprocess::fwippp_preprocess($arg);
      }
   }
}
