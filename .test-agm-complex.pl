#! /usr/bin/perl -W
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-08-11 kdw  created
use strict;
use Kw    qw();

my @aa = ();
my @bb = ();
my @cc = ();

if ($#ARGV < 3) {
   die;
}
$aa[0] = shift;
$aa[1] = shift;
$bb[0] = shift;
$bb[1] = shift;

my $dd = Kw::agcmean(@aa, @bb, @cc);

print "DD=$dd\n";
print "AGM($aa[0]+$aa[1]i,$bb[0]+$bb[1]i)==$cc[0]+$cc[1]i\n";
