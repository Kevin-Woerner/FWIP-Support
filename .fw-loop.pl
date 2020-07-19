#! /usr/bin/perl -W
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-06-16 kdw  module use made explicit
# 2020-05-26 kdw  created
use strict;
use Fwip_Translate qw();

Fwip_Translate::fwipt_lang_set(Fwip_Translate::LANG_PERL);

while (<>) {
   print Fwip_Translate::fwipt_loopy($_);
}
