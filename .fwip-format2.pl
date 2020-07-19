#! /usr/bin/perl -W
#    Copyright (C) 2019-2020 by Kevin D. Woerner
# 2020-05-20 kdw  rmed unnecessary quotes
# 2020-05-13 kdw  trivially changed
# 2020-05-12 kdw  prettify output
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-04-08 kdw  preprocess sigil change
# 2020-04-04 kdw  rework III
# 2020-03-19 kdw  rework II
# 2020-03-12 kdw  rework
# 2020-03-03 kdw  comments added; refactor
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2019-10-05 kdw  tweak
# 2019-09-10 kdw  LAN[G]UAGE NOT to LAN[G]UAGE_NOT
# 2019-09-02 kdw  copy right line fixed; blank line
# 2019-09-01 kdw  created
use strict;

my $bq = "   ";
my $curr_indent = 0;
my $next_indent = 0;
my $mlm = 65;
my $mlm4 = $mlm - 4;
my $out = "";
my $lang_flag = 0;
my @all_out = ();
my $nott = "TRIZPY";
my $comment = "";

while (<>) {
   chomp;
   chomp;
   $comment = "";
   if (s/\s*(#.*)//) {
      $comment = $1;
   }
   if ($out =~ m/\w$/ and m/^\w/) {
      $out .= " ";
   }
   $out .= $_;
   if ($out =~ m/;$/) {

   } elsif ($out =~ m/(:$)/) {
      if ($out =~ m/LANGUAGE(_NOT)?\b/) {
         if (!$lang_flag) {
            $next_indent++;
         } else {
            $curr_indent--;
         }
         $lang_flag = 1;
      } elsif ($out =~ m/(ELSE|ELSIF)/) {
         # unindent the current, but indent subsequent
         $curr_indent--;
      } else {
         # indent subsequent
         $next_indent++;
      }
   } elsif ($out =~ m/\B_END$/) {
      # unindent current and subsequent
      $curr_indent--;
      $next_indent--;
      if ($out =~ m/LANGUAGE_END$/) {
         $lang_flag = 0;
      }
   } elsif ($comment !~ m/./) {
      # haven't found the end of this line
      next;
   }

   my $notts;
   if ($out =~ s/(\".*?\")/$nott/) {
      $notts = $1;
   }
   if ($curr_indent < 0) {
      die "CURR_INDENT<0:$out";
   }
   $out =~ s/(\bCONST \w+)(\()/$1 $2/g;
   while ($out =~ s/(^[^#]*[])])(\w)/$1 $2/g) {
   }
   $out =~ s/(,)(\S)/$1 $2/g; # insert space after comma
   while ($out =~ s@(^[^#]*[^+*/=<>\ -])
         ([+*/=-])([^+*/=\ -])@$1 $2 $3@xgm) {
   }
   foreach my $cmp (qw(<= >= == <> < > =)) {
      $out =~ s/ *$cmp */ $cmp /g;
   }

   $out =~ s/\< +\>/<>/g;
   $out =~ s@([+*/<>=-])\s+(=)@$1$2@g;
   $out =~ s@ *([+*/<>=-]=) *@ $1 @g;
   $out =~ s/(\dE) *([+-]) *(\d)/$1$2$3/g;
   $out =~ s/(\bBY -) /$1/g;
   $out =~ s@\( - @(-@g;
   $out =~ s@\( \+ @(+@g;
   $out =~ s/^ +//;
   my $prefix = ${bq} x $curr_indent;
   $out = "$prefix$out";
   my $count = 0;
   while ($out =~ s/^( *?)(.*\bFUNC .*),/$1$2 \\\n$1      ,/m) {
      die if (100 < $count++);
   }
   if (defined($notts)) {
      $out =~ s/$nott/$notts/;
   }

   $out =~ s/\b(RETURN|OR|AND)\(/$1 (/g;
   $out =~ s/DIE\"/DIE "/;
   while ($out =~ m/^.{$mlm}./) {
      die $out if (50 < $count++);
      $out =~ s/^(.{1,$mlm4}[^ ][ (])//;
      my $ini = $1;
      if ($ini =~ s@(([-+*/,]|\bOR|\bAND) )$@@) {
         $out = "$1$out";
      }
      $ini =~ s/ +$//;
      push(@all_out, "$ini \\");
#      if ($ini !~ m/^[^#]{1,$mlm} $/) {
#         $out = "$out";
#      }
      $out = "$prefix${bq}${bq}$out";
   }
   if ($out =~ m/\S/) {
      push(@all_out, $out);
   }
   if ($comment =~ m/./) {
      push(@all_out, (${bq} x $next_indent) . $comment);
   }
   $out = "";
   $curr_indent = $next_indent;
}

for (my $ii = 0; $ii <= $#all_out; $ii++) {
   print $all_out[$ii];

   if ($all_out[$ii] =~ m/^\s*((BLOCK|ARRAY|LANGUAGE)
            (_END)?|LOCAL_CONST|CONST)\b/x) {
      while ($all_out[$ii] =~ m/\\$/) {
         $ii++;
         print "\n$all_out[$ii]";
      }
      if ($all_out[$ii + 1] =~ m/^ *(#.*)/) {
         my $com = $1;
         if (length("$all_out[$ii] $com") <= $mlm) {
            $all_out[$ii + 1] = $com;
         } else {
            print "\n";
         }
      } else {
         print "\n";
      }
   } elsif ($all_out[$ii] =~ m/\S/) {
      print "\n";
   }
}
