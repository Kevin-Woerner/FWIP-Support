#! /usr/bin/perl -W
#    Copyright (C) 2018-2021 by Kevin D. Woerner
# 2021-04-16 kdw  fix shft at 3
# 2021-04-15 kdw  reformat
# 2021-04-14 kdw  indent for line break
# 2021-04-13 kdw  more work
# 2021-04-12 kdw  file renam
# 2021-04-11 kdw  more work
# 2021-04-06 kdw  indents
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2019-06-27 kdw  fixed shebang line
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-01-03 kdw  .*_L[O]OP keywords
# 2018-05-22 kdw  created
use strict;
sub INDENT_LEN { 3; }
my @lines = ();
my @line_numbers = ();
my $lnnum = 0;
my @lead = ();
my $lv_goo = 0;
my $lv_ch = "00";
my $lv_predicted = 0;
my $lv_count = 0;
sub SHFT() { 3; }

sub pp($$$ )
{
   $lv_predicted = $lead[$lv_goo] + $_[0] * INDENT_LEN;

   if (1 < $_[0]) {
      $lv_count++;
   }
   $lv_ch = $_[1];
   if (0 < $_[2]) {
      $lv_goo = 0;
      @lines = ($lines[$#lines]);
      @line_numbers = ($line_numbers[$#line_numbers]);
      @lead = ($lead[$#lead]);
   }
}

while (my $ln = <>) {
   chomp($ln);
   chomp($ln);
   $lnnum++;

   $ln =~ s/\s*#.*//; # rm comments
   if ($ln =~ m/\S/) {
      push(@lines, $ln);
      push(@line_numbers, $lnnum);
      push(@lead, map { m/^( *)/; length($1) } $ln);
   } else {
      next;
   }
   my $ii = $#lines;
   $lv_predicted = 0;
   if ($lines[$ii] =~ m/(BLOCK_DEF )?\b(FUNC|CONST) /) {
      if (0 < $ii and $lines[$ii - 1] =~ m/(:|\{)$/) {
         pp(1, "FI", 1);
      } else {
         pp(0, "FC", 1);
      }
   } elsif ($lines[$ii] =~ m/^ *([A-Z_]+_END|\b(ELSE|ELSIF))\b/) {
      pp(-1, "EN", 1);
   } elsif ($lines[$ii] =~ m/\}\}$/) {
      pp(-1, "BB", 1);
   } elsif ($lines[$ii] =~ m~^ *[;,*/]~) {
      pp(SHFT, "SM", 0);
   } elsif ($lines[$lv_goo] =~ m/:$/ or $lines[$lv_goo] =~ m/\{$/) {
      pp(1, "QQ", 1);
   } elsif ($lines[$lv_goo] =~ m/^ *(FOR|WHILE|(ELS)?IF|AWAIT) .*[^:]$/) {
      if ($lines[$ii - 1] =~ m/:$/ and $lines[$ii] =~ m/;$/) {
         pp(1, "YG", 1);
      } else {
         pp(SHFT, "SY", 0);
      }
   } elsif ($lines[$lv_goo] !~ m/(_END|:|;|\}\})$/) {
      if ($lines[$ii] =~ m/(;|\}|:)$/) {
         if ($lines[$ii - 1] =~ m/(;|\})$/) {
            pp(0, "PP", 1);
         } elsif ($lines[$ii - 1] =~ m/(:)$/) {
            if ($lv_ch eq "SM") {
               pp(1, "MM", 1);
            } else {
               pp(0, "NN", 1);
            }
         }  else {
            pp(SHFT, "SG", 0);
         }
      } else {
         if ($lines[$ii - 1] =~ m/:$/) {
            pp(1, "XX", 1);
         } elsif ($lines[$ii - 1] =~ m/([^\}]\}|;)$/) {
            pp(0, "XZ", 1);
         } else {
            pp(SHFT, "SX", 0);
         }
      }
   } else {
      pp(0, "--", 1);
   }

   printf("$ARGV:%2d:%2.2d:$lv_ch:%5d:%5d:%2.2s:%s\n"
         , $lv_predicted
         , $lead[$#lines], $line_numbers[$#lines]
         , $line_numbers[$lv_goo]
         , ($lead[$#lines] != $lv_predicted ? "PR" : "--")
         , $lines[$#lines]);
} continue {
   if (eof) {
      print "*************file $ARGV COUNT=$lv_count\n";
      @line_numbers = ();
      $lnnum  = 0;
      $lv_count = 0;
   }
}
