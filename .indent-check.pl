#! /usr/bin/perl -W
#    Copyright (C) 2018-2020 by Kevin D. Woerner
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2019-06-27 kdw  fixed shebang line
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-01-03 kdw  .*_L[O]OP keywords
# 2018-05-22 kdw  created
use strict;
sub INDENT_LEN { 3; }
my @aa = ();

my $current = 0;
my $previous = 0;
my $predicted = 0;

while (my $ln = <>) {
   chomp($ln);
   chomp($ln);

   if ($ln =~ s/\\$//) {   # continuation line
      my $in = <>;         # continuation line
      $in =~ s/^\s+//;     # continuation line
      $ln =~ s/\s*$/ /;    # continuation line
      $ln .= $in;          # continuation line
      $ln =~ s/ ,/,/g;     # continuation line
      if (!eof()) {        # continuation line
         redo;             # continuation line
      }                    # continuation line
   }                       # continuation line
   $ln =~ s/\s*#.*//;
   if ($ln =~ m/\S/) {
      push(@aa, $ln);
   }
}
for (my $ii = 0; $ii <= $#aa; $ii++) {
   $aa[$ii] =~ s/^(\s*)/$1/;
   $current = length($1);
   if ($aa[$ii] =~ m/(_END|\b(ELSE|ELSIF|ELSEIF))\b/) {
      $predicted -= INDENT_LEN;
   }
   if ($predicted < 0) {
      $predicted = 0;
   }
   if ($current != $predicted) {
      print("CUR=$current:PRE=$predicted:");
   } else {
      print("           :");
   }
   print ("$aa[$ii]\n");
   if ($aa[$ii] =~ m/:$/) {
      $predicted = $current + INDENT_LEN;
   } elsif ($aa[$ii] =~ m/\b(ELSE|ELSIF|ELSEIF)\b/) {
      $predicted -= INDENT_LEN;
   } else {
      $predicted = $current;
   }
   $previous = $current;
}
