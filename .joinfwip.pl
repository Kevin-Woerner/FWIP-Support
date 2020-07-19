#! /usr/bin/perl -W
#    Copyright (C) 2017-2018 by Kevin D. Woerner
# 2018-03-27 kdw  continuation
# 2017-07-03 kdw  created
use strict;

my @out = ("");
my $ln = "";

while (my $ln = <>) {
   chomp($ln);
   $ln =~ s/^ +//;
   if ($ln =~ s/\\$//) {   # continuation line
      $ln .= <>;           # continuation line
      if (!eof()) {        # continuation line
         redo;             # continuation line
      }                    # continuation line
   }                       # continuation line
   $out[$#out] .= " " if ($out[$#out] =~ m/./);
   $out[$#out] .= $ln;
   if ($ln =~ m/#/ or (eof() and $ln =~ m/./)) {
      push(@out, "");
   }
}

foreach (@out) {
   my $comm = (s/(#.*)// ? $1 : "");
   s/\b  +\b/ /g;
   while (s/(?<=\W) (?=\w|\W)//g + s/(?<=\w) (?=\W)//g) {
      next;
   }
   $_ .= $comm;
}
print join("\n", @out, "");
