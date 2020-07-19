#! /usr/bin/perl -W
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-06-18 kdw  added options
# 2020-05-27 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);
use Fwip_Comment qw();
use Fwip_Wrap    qw();

my $mlm = Fwip_Comment::FWIPC_LINE_LENGTH;
my $verbose = 0;
if (!Getopt::Long::GetOptions("l=i", \$mlm
      , "v+", \$verbose)) {
   die <<EndOfUsage;
Usage: $0 [Options]
Options:
   -v       verbose
   -l LEN   wrap lines to LEN length ($mlm)
EndOfUsage
}
while (<>) {
   print Fwip_Wrap::fwip_wrap($_, $verbose, $mlm);
}
