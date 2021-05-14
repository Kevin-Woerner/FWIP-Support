#! /usr/bin/perl -W
#    Copyright (C) 2016-2021 by Kevin D. Woerner
# 2021-03-09 kdw  cx work
# 2021-03-05 kdw  fwip syntax debugging
# 2021-02-26 kdw  added pepper
# 2021-02-24 kdw  output alignment changed
# 2021-02-22 kdw  backslash work
# 2021-02-20 kdw  output change
# 2021-02-15 kdw  string const
# 2021-02-08 kdw  output format changed
# 2021-02-01 kdw  seen_[cf] hashes
# 2020-11-22 kdw  uniqified output
# 2020-06-25 kdw  -J option
# 2020-06-01 kdw  output format changed
# 2020-05-30 kdw  CONST syntax change
# 2020-05-27 kdw  rework
# 2020-04-17 kdw  -j option
# 2020-03-20 kdw  -F and -C options
# 2020-02-24 kdw  failed experiment
# 2020-02-10 kdw  output tweak
# 2020-01-27 kdw  major refactor
# 2019-12-13 kdw  -i; constants
# 2019-12-03 kdw  -HH changed
# 2019-09-07 kdw  change print regex
# 2019-08-18 kdw  B[O]OL -> B[O]L
# 2019-08-01 kdw  simplified -0 flag code
# 2019-07-22 kdw  tweak
# 2019-07-21 kdw  -0H flag work
# 2019-07-20 kdw  -0 flag
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-05-20 kdw  -c command line arg
# 2019-05-14 kdw  rework command line args
# 2019-05-08 kdw  refactor; diff command line opts
# 2019-04-22 kdw  F[U]NC keyword
# 2018-04-24 kdw  cleanup
# 2018-04-19 kdw  tweak
# 2018-01-26 kdw  -s option
# 2018-01-19 kdw  -p option
# 2017-04-30 kdw  func -> function
# 2017-04-20 kdw  func -> function
# 2016-11-28 kdw  l?ip -> fw?ip
# 2016-11-23 kdw  skip \?\? lines
# 2016-11-21 kdw  def -> func
# 2016-11-16 kdw  default arg; output ^## lines
# 2016-10-28 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);

my $pattern = "";
my $sort_flag = 0;
my $code_flag = 0;
my $h_flag = 0;
my $i_flag = 0;
my $j_flag = 0;
my $zero_flag = 0;
my $func_flag = 0;
my $cons_flag = 0;

sub usage($ )
{
   die <<EndOfUsage;
$_[0]
Usage: $0 [OPTIONS] [FILES|PATTERNS]
Print the descriptions of the functions in FILES
Options:
   -s         : sort
   -c         : display code
   -F         : functions only
   -C         : constants only
   -i         : ignore case
   -J         : dont join function def on one line
   -H         : display filenames
   -0         : display function declarations only
EndOfUsage
}

if (!Getopt::Long::GetOptions(
         "s+", \$sort_flag
         , "c+", \$code_flag
         , "C+", \$cons_flag
         , "F+", \$func_flag
         , "0+", \$zero_flag
         , "J+", \$j_flag
         , "i+", \$i_flag
         , "H+", \$h_flag)) {
   usage("Bad Option");
}

if ($cons_flag == 0 and $func_flag == 0) {
   $cons_flag = 1;
   $func_flag = 1;
}

if ($code_flag and $zero_flag) {
   usage("Options -c and -0 are mutually exclusive");
}

sub pepper($$$ )
{
   my ($nam, $val, $unt) = @_;
   my $sval;

   if ($val =~ m/["a-df-zA-DF-Z]/) {
      $sval = $val;
   } else {
      if ($val =~ m/\^/) {
         die "VAL=$val in def of $nam"
      }
      if ($val <= 0.0 and 0.0 <= $val) {
         $sval = "+0";
      } elsif (abs($val) < 0.01 or 1E11 < abs($val)) {
         $sval = sprintf("%+-22.14E", $val);
         $sval =~ s/\B0+E/E/;
      } else {
         $sval = sprintf("%+.16G", $val);
      }
   }
   sprintf("%-29s %-22s # %s", $nam, $sval, $unt);
}

my @fwip_files = ();

for (my $ii = 0 ; $ii <= $#ARGV; $ii++) {
   if (! -f $ARGV[$ii]) {
      $pattern .= "|$ARGV[$ii]";
      splice(@ARGV, $ii, 1);
      $ii--;
   } else {
      push(@fwip_files, $ARGV[$ii]);
   }
}
if (length($pattern) == 0) {
   $pattern = ".";
} else {
   $pattern =~ s/^\|//;
}

if ($i_flag) {
   $pattern = "(?i:$pattern)";
}
$pattern = "(?s:$pattern)";

if ($#fwip_files < 0) {
   @fwip_files = (glob("$ENV{KW_DIR_INCLUDE}/*.fwipp"));
}

my @outz = ();
my %seen_c = ();
my %seen_f = ();
my $pref = "";
my $fname;
my @const_arr = ();
my @constr_arr = ();
my @conval_arr = ();
my $argq;
foreach $argq (@fwip_files) {
   open(FH, "< $argq") or die "Unable to open $argq";
   my @file_arr = ($argq);
   $file_arr[0] =~ s@.*/(\w+).*@$1@;

   my $scrum = "";
   while (<FH>) {
      if (m/ I+Insert-Begin.* (\w+.?\w*) /) {
         push(@file_arr, $1);
      } elsif (m/ I+Insert-End.* (\w+.?\w*) /) {
         pop(@file_arr);
      } else {
         if ($cons_flag and s/^ *CONST +(\S+)\s+(.*)/$1/) {
            my $hh = $2;
            if (m/($pattern)/) {
               chomp;
               if ($hh =~ m/\"/) {
                  s/\\([tvnb])/\\\\$1/g;
                  push(@constr_arr, $_);
               } else {
                  push(@const_arr, $_);
               }
            }
         }
         if ($func_flag and m/^(\s*)FUNC +\S+ +(\w+)/) {
            ($pref, $fname) = ($1, $2);
            my $fdef = $_;
            $fdef =~ s/^\s*FUNC //;
            while (!eof(FH) and $fdef !~ m/:/) {
               $fdef .= <FH>;
               $fdef =~ s/ +\\\n +,/,/;
            }
            if (!$j_flag) {
               $fdef =~ s/\n +,/,/g;
            }
            if (!$zero_flag or $fdef !~ m/:/) {
               while (!eof(FH)) {
                  my $new = <FH>;
                  if ($code_flag) {
                     if ($new =~ m/\bFUNC_END\b/) {
                        $fdef .= $new;
                        last;
                     }
                  } elsif ($new !~ m/^\s*#/) {
                     last;
                  }
                  $fdef .= $new;
                  $fdef =~ s/ +\\\n +,/,/;
               }
            }
            $fdef =~ s/^$pref//gm;
            if ($fdef =~ m/($pattern)/) {
               if ($h_flag) {
                  $fdef =~ s/^/$file_arr[$#file_arr]:/gm;
               }
               push(@outz, $fdef);
               $seen_f{$fname} .= $fdef;
            }
         }
      }
   }
   close(FH)
}

if (0 <= $#const_arr) {
   my $cmd = join("\n\n", @const_arr, "");
   my $fls = join(" -f ", "", "''"
         , map { s/fwipp/units/;$_ } @fwip_files);
   my @reply = map {
      chomp;
      s/.*= +//;
      s/^ +//;
      s/(0+)(0E[+-]\d+)/$2/;
      s/([1-9])0E/${1}E/;
      if (!m/ /) {
         $_ .= " 1";
      }
      $_;
   } qx{echo "$cmd" | units -t $fls -o%+22.14E};

   foreach my $ff (0..$#const_arr) {
      my $rr = $reply[$ff];
      my $cc = $const_arr[$ff];
      if ($rr !~ m/\b +/) {
         $rr .= " 1";
      }
      my @aa = split(/\b +/, $rr, 2);
      my $yy = pepper($cc, $aa[0], $aa[1]) . "\n";
      if (defined($seen_c{$cc})) {
         if ($seen_c{$cc} ne $yy) {
            die "$seen_c{$cc} ne $yy";
         }
      } else {
         $seen_c{$cc} = $yy;
         push(@outz, $seen_c{$cc});
      }
   }
}
if (0 <= $#constr_arr) {
   my $rr = "print(" . join(")\nprint(", @constr_arr) . ")";
   my @vv = qx{ echo -n "
from Kw import *;
from Kwelements import *;
from Kwplanets import *;
from Kwsun import *;
from Tm_Const import *;
$rr" | python3};
   foreach my $ii (0..$#constr_arr) {
      my $cc = $constr_arr[$ii];
      chomp($vv[$ii]);
      $vv[$ii] =~ s/\t/\\t/g;
      $vv[$ii] =~ s/\n/\\n/g;
      $vv[$ii] =~ s/\v/\\v/g;
      $seen_c{$cc} = sprintf("%-29s \"%s\"\n", $cc, $vv[$ii]);
      push(@outz, $seen_c{$cc});
   }
}

if ($sort_flag) {
   foreach my $fd (sort keys %seen_f) {
      $seen_f{$fd} =~ s/\s*\\\n\s*//g;
      print "$seen_f{$fd}";
   }
   foreach my $fd (sort { substr($a, 52) cmp substr($b, 52)
               or substr($a, 30, 22) <=> substr($b, 30, 22)
            } map { $seen_c{$_}; } keys %seen_c) {
      print "$fd";
   }
} else {
   print join("", @outz);
}
