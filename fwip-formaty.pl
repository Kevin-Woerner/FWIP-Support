#! /usr/bin/perl -W
#    Copyright (C) 2020 by Kevin D. Woerner
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
         for (my $ii=0; $ii <= $#kw; $ii++) {
            print STDERR "KW[$ii]=$kw[$ii]\n";
         }
         die "TY=$ty\n#kw=$#kw\nLN=$ln\nre=$rest\n";
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
      } elsif ($desc =~ m/INDENT_TOKEN/) {
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
         $out =~ s/^ //;
         $out =~ s/ +([],;:])/$1/g;
         $out =~ s/ *\[ */[/g;
         $out =~ s/\( +/(/g;
         $out =~ s/ +\)/)/g;
         $out =~ s/\(- +/(-/g;
         $out =~ s/\(\+ */(/g;
         if ($out =~ s/\b +\(/(/g) {
            $out =~ s/\b(RETURN|IF|WHILE|AWAIT|AND|OR|XOR)\(
                  /$1 (/gx;
            $out =~ s/\b(CONST\s+[A-Z_0-9]+)\(/$1 (/gx;
         }
         $out =~ s/( = [-+]) /$1/g;
         my $pref = (${bq} x $curr_indent);
         if ($out =~ m/FUNC .*?(\w+)\(/) {
            push(@out_arr, Fwip_Comment::fwipc_comm("Function"
                  , $1, $pref));
         }

         push(@out_arr, "$pref$out\n");
         $curr_indent = $next_indent;
         $out = "";
      }
   }
}

for (my $ii = 0; $ii < $#out_arr; $ii++) {
   if ($out_arr[$ii] =~ m/^ *((LOCAL_)?CONST)/
            and $out_arr[$ii + 1] =~ m/^ *(#\S+)$/) {
      $out_arr[$ii] =~ s/\n$//s;
      $out_arr[$ii + 1] =~ s/^ *//;
   } elsif ($out_arr[$ii] =~ m/^ *(BLOCK|LANG|ARRAY)/
            and $out_arr[$ii + 1] =~ m/^ *(#.*)$/) {
      $out_arr[$ii] =~ s/\n$//s;
      $out_arr[$ii + 1] =~ s/^ *//;
   }
}
print join("", @out_arr);