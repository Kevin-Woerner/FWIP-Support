#! /usr/bin/perl -W
#    Copyright (C) 2020-2021 by Kevin D. Woerner
# 2021-04-23 kdw  updated token name
# 2021-04-14 kdw  indent for line break
# 2021-04-12 kdw  minor tweak
# 2021-03-21 kdw  work
# 2021-03-04 kdw  allow a-z in const names
# 2020-08-21 kdw  block-func work
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-06-22 kdw  simplified
# 2020-06-18 kdw  opt arg for fw[i]pc_comm
# 2020-06-04 kdw  -vv command line opt
# 2020-05-31 kdw  parens after const defs
# 2020-05-29 kdw  -v option
# 2020-05-27 kdw  rework
# 2020-05-25 kdw  consolidation
# 2020-05-20 kdw  more fwip-formatter like output
# 2020-05-18 kdw  fwip.tab outputs line numbers
# 2020-05-14 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);
use Fwip_Comment qw();

my $verbose = 0;
if (!Getopt::Long::GetOptions("v+", \$verbose)) {
   die "Usage:$0 [FILE] [OPTIONS]
take the output of fwip.tab as input
   and output properly indented FWIP program
Options:
   -v : output descriptive parser output
";
}
my $data_dir = $0;
$data_dir =~ s@(.*)/.*@$1/../datakdw@;
open(FH, "< $data_dir/fwip.tab.c") or die;
my @kw = ();
my $good = 0;
my $first_ind;
while (<FH>) {
   if ($good == 1) {
      if (m/^ +([A-Z0-9_]+) = (\d+)/) {
         my ($aa, $bb) = ($1, $2);
         if (!defined($first_ind)) {
            $first_ind = $bb;
         }
         $kw[$bb - $first_ind] = $aa;
      } elsif (m/\};/) {
         last;
      }
   } else {
      if (m/^ +enum yytokentype/) {
         $good++;
      }
   }
}
close(FH);

my $bq = "   ";
my $next_indent = 0;
my $curr_indent = 0;
my @out_arr = ();
my $out = "";
while (<>) {
   chomp;
   if (m/(\d+)\s+(\d+)\s+(.*)/) {
      my ($ln, $ty, $rest) = ($1, $2, $3);
      $ty -= $first_ind;
      if (!defined($kw[$ty])) {
         for (my $ii = 0; $ii <= $#kw; $ii++) {
            print STDERR "KW[$ii]=$kw[$ii]\n";
         }
         die "SORRY: kw[$ty] not defined\n"
            . "\$#kw=$#kw\nLINENUMBER=$ln\nre=$rest\n";
      }
      my $desc = $kw[$ty];
      if ($verbose) {
         if (1 < $verbose) {
            printf("%-7d %-22s ", $ln, $desc);
         }
         printf("%s\n", $rest);
         next;
      }
      $out .= " $rest";
      my $output_line_flag = 0;
      if ($rest =~ m/^;/) {
         $output_line_flag++;
      } elsif ($rest =~ m/^#/) {
         $output_line_flag++;
      } elsif ($desc =~ m/\bINDENT_TK\b/) {
         $next_indent = $curr_indent + 1;
         $output_line_flag++;
      } elsif ($rest =~ m/^ELSE$/ or $rest =~ m/^ELSIF$/) {
         $curr_indent--;
      } elsif ($desc =~ m/_END/) {
         $curr_indent--;
         $next_indent = $curr_indent;
         $output_line_flag++;
      }
      if ($output_line_flag) {
         $out =~ s/([0-9]+E[+-])0+\B/$1/g;
         $out =~ s/([0-9]+)E[+-]0+\b/$1/g;
         $out =~ s/^ //;
         $out =~ s/ +([],;:])/$1/g;
         $out =~ s/ *\[ */[/g;
         $out =~ s/\( +/(/g;
         $out =~ s/ +\)/)/g;
         $out =~ s/\(- +/(-/g;
         $out =~ s/\(\+ */(/g;
         if ($out =~ s/\b +\(/(/g) {
            $out =~ s/\b(RETURN|IF|WHILE|AWAIT|AND|OR|XOR)\(/$1 (/gx;
            $out =~ s/\b(CONST\s+[A-Z_0-9a-z]+)\(/$1 (/gx;
         }
         $out =~ s/( = [-+]) /$1/g;
         my $pref = (${bq} x $curr_indent);

         push(@out_arr, "$pref$out\n");
         $curr_indent = $next_indent;
         $out = "";
      }
   }
}
=pod
for (my $ii = 0; $ii < $#out_arr; $ii++) {
   if ($out_arr[$ii] =~ m/^ *((BLOCK_)?CONST)/
            and $out_arr[$ii + 1] =~ m/^ *(#\S+)$/) {
      $out_arr[$ii] =~ s/\n$//s;
      $out_arr[$ii + 1] =~ s/^ *//;
   } elsif ($out_arr[$ii] =~ m/^ *(BLOCK(_END)?\b|LANGU|ARRAY)/
            and $out_arr[$ii + 1] =~ m/^ *(#.*)$/) {
      $out_arr[$ii] =~ s/\n$//s;
      $out_arr[$ii + 1] =~ s/^ *//;
   }
}
=cut
print join("", @out_arr);
