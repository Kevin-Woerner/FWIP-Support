#! /usr/bin/perl -W
#    Copyright (C) 2016-2021 by Kevin D. Woerner
# 2021-03-07 kdw  updated
# 2020-08-17 kdw  macro syntax changed
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-05-13 kdw  lang comment trivially changed
# 2020-05-12 kdw  language syntax
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-04-17 kdw  rmed support for COM[M]ENT
# 2020-04-08 kdw  preprocess sigil change
# 2020-03-06 kdw  RE[P]LACE / IN[D]EX changes
# 2019-12-03 kdw  updated
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-07-22 kdw  FU[N]C regex cleanup
# 2019-06-27 kdw  var decl mved
# 2019-05-29 kdw  comment changed
# 2019-04-22 kdw  F[U]NC keyword
# 2019-03-08 kdw  is[e]qual -> is[e]q, et al.
# 2019-02-28 kdw  REP[L]ACE/DE[F]INE work
# 2019-02-28 kdw  rmed @replace
# 2018-12-07 kdw  explicit imported funcitons
# 2018-05-18 kdw  LAN?GUAGE syntax change
# 2018-04-03 kdw  inserted file work
# 2018-04-01 kdw  LA[N]G?UAGE_EN?D
# 2018-03-27 kdw  continuation lines
# 2018-03-22 kdw  macros count
# 2018-03-20 kdw  replaced index w/ @replace
# 2018-02-17 kdw  updated
# 2017-11-23 kdw  updated
# 2017-10-24 kdw  underscores in numbers
# 2017-10-22 kdw  @ -> @@
# 2017-10-21 kdw  $ -> @
# 2017-10-20 kdw  preprocess rework
# 2017-08-31 kdw  \!\!\!LA[N]G?UAGE
# 2017-08-22 kdw  INS[E]RT_F[I]LE syntax changed
# 2017-07-23 kdw  count in files
# 2017-07-12 kdw  files
# 2017-07-02 kdw  fewer things start with \?[\?]\?
# 2017-06-30 kdw  usage, et al.
# 2017-06-21 kdw  FWIP_PP, et al.
# 2017-04-30 kdw  func -> function
# 2017-04-26 kdw  \?+COM[M]ENT.*
# 2017-04-20 kdw  func -> function
# 2017-04-12 kdw  allow _ to start var names
# 2017-03-10 kdw  tweaking
# 2017-03-01 kdw  refactor
# 2017-02-26 kdw  count FU?NC and COMM?ENT correctly
# 2017-02-24 kdw  \?\?.* change
# 2017-02-21 kdw  die is bad array name
# 2017-02-17 kdw  refactor
# 2017-02-13 kdw  FWIP language changed
# 2017-02-08 kdw  refactor
# 2016-11-28 kdw  suffix changed
# 2016-11-23 kdw  CO?NST -> CO?NST?ANT
# 2016-11-21 kdw  def -> func
# 2016-11-20 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);

sub usage($ )
{
   die <<EndOfUsage;
Usage: $0 [OPTIONS] [FWIP-Files...]
Display vocabulary of fwip software
   Use-Count Def-Count Type Word
Options:
   -v  verbose
EndOfUsage
}

my $verbose_flag = 0;
if (!Getopt::Long::GetOptions("v+", \$verbose_flag)) {
   usage("Bad Option");
}

for (my $ii = 0 ; $ii <= $#ARGV ; $ii++) {
   open(FH, "< $ARGV[$ii]") or die "$ARGV[$ii]";
   while (<FH>) {
      if (m/\?INSERT_FILE +\"(.*)\"/) {
         push(@ARGV, $1);
      }
   }
   close(FH);
}

my %words = ();
my %consts = ();
my %funcs_use = ();
my %funcs_def = ();
my %fwip_funcs = ();
my %fwip = ();
my %fwip_p = ();
my %fwip_pp = ();
my %macro_def = ();
my %macro_use = ();
my %langs = ();
my %indeck = ();
my %indecks = ();
my %vars = ();
my %vara = ();
my %files = ();
my %filewords = ();

sub addd($$ )
{
   my ($ww, $ff) = @_;
   if (!defined($files{$ww}) or $files{$ww} !~ m/$ff/) {
      $files{$ww} .= " $ff";
      $filewords{"$ff$ww"}++;
   } else {
      $filewords{"$ff$ww"}++;
   }
   $words{$ww}++;
}

my $current_filename;
my $orig_filename;
while (my $ln = <>) {
   chomp $ln;

   if ($ln =~ s/\\$//) {   # continuation line
      $ln .= <>;           # continuation line
      if (!eof()) {        # continuation line
         redo;             # continuation line
      }                    # continuation line
   }                       # continuation line
   $_ = $ln;

   if (!defined($current_filename)) {
      $current_filename = $ARGV;
      $orig_filename = $ARGV;
   }
   if (s/\s*(#.*)//) {
      my $hj = $1;
      if ($hj =~ m/# +I+Insert-Begin -+ (\S+) /) {
         $current_filename = $1;
      } elsif ($hj =~ m/# +I+Insert-End -+ (\S+) /) {
         $current_filename = $orig_filename;
      }
   }
   s/\".*?\"//g;

   while (s/(\?MACRO_END)//) {
      addd($1, $current_filename);
      $fwip_pp{$1}++;
   }
   while (s/(\?MACRO)\s+(\w+)(.*?)\?//) {
      addd($1, $current_filename);
      $fwip_pp{$1}++;
      addd("\?$2", $current_filename);
      $macro_def{"\?$2"}++;
   }
   while (s/(\?\w+).*?\?//) {
      addd($1, $current_filename);
      $macro_use{$1}++;
   }
   while (s/(\?\B)//) {
      addd($1, $current_filename);
      $fwip_pp{$1}++;
   }

   if (s/(LANGUAGE(_END)?\b)(( +\w+)*)\b//) {
      my @aa = ($1, $3);
      addd($aa[0], $current_filename);
      $fwip{$aa[0]}++;
      foreach my $lan (split(/ +/, $aa[1])) {
         if ($lan =~ m/\S/) {
            addd($lan, $current_filename);
            $langs{$lan}++;
         }
      }
   }

   if (s/\b(BLOCK_CONST) +(\w+)//) {
      my @aa = ($1, $2);
      addd($aa[0], $current_filename);
      $fwip{$aa[0]}++;
      addd($aa[1], $current_filename);
      $indeck{$aa[1]}++;
   }

   while (s/(?<!\?)(\?\w+)//) {
      addd($1, $current_filename);
      $fwip_p{$1}++;
   }

   while (s/(CONST)\s+(\w+)//) {
      my @aa = ($1, $2);
      addd($aa[0], $current_filename);
      $fwip{$aa[0]}++;
      addd($aa[1], $current_filename);
      $consts{$aa[1]}++;
   }

   while (s/(BLOCK_CONST)\s+(\w+)//) {
      my @aa = ($1, $2);
      addd($aa[0], $current_filename);
      $indeck{$aa[0]}++;
      addd($aa[1], $current_filename);
      $indecks{$aa[1]}++;
   }

   while (s/\b(FUNC)\s+(\w+)(\[\])?
         \s+([A-Z]?[a-z0-9_]+\()//x) {
      my @aa = ($1, $2, $3, $4);
      addd($aa[0], $current_filename);
      $fwip{$aa[0]}++;
      addd($aa[1], $current_filename);
      addd($aa[3], $current_filename);
      $funcs_def{$aa[3]}++;
   }
   while (s/(\bIMPORT)\b.*//) {
      addd($1, $current_filename);
   }

   s/\b([0-9_]*\.)?[0-9_]+(E[+-]?[0-9_]+)?\b//g;
   s/\b0x[0-9A-F_]+//g;

   while (s/(\b[a-z_A-Z0-9]+(\[|\(|\b))//) {
      my $ww = $1;
      addd($ww, $current_filename);
      if ($ww =~ m/\b[A-Z_0-9]+\(/) {
         $fwip_funcs{$ww} += 1;
      } elsif ($ww =~ m/[a-z_A-Z0-9]\(/) {
         $funcs_use{$ww} += 1;
      } elsif ($ww =~ m/\b(IX)_[A-Z_0-9]+\b/) {
         $indeck{$ww} += 1;
      } elsif ($ww =~ m/\b[a-z_]\w+\[/) {
         $vara{$ww}++;
      } elsif ($ww =~ m/\b[a-z_]\w+\b/) {
         $vars{$ww}++;
      } elsif (!defined($consts{$ww})) {
         $fwip{$ww}++;
      }
   }
}

sub pp($$$;$ )
{
   if (defined($_[0])) {
      my $tt = "";
      foreach my $rr (split(/ /, $files{$_[1]})) {
         if ($rr =~ m/./) {
            $tt .= " $rr(" . $filewords{"$rr$_[1]"} . ")";
         }
      }

      #my $ss = $files{$_[1]};
      $tt =~ s/^ +//;
      #$tt =~ s/\.fwip//g;
      if (defined($_[3])) {
         $tt =~ s/\B .*//;
      }
      $tt = join(" ", sort split(/ /, $tt));
      printf("%5d %5d %-15s %-25s $tt\n"
            , $words{$_[1]}, $_[0], $_[2], $_[1]);
      $_[0];
   } else {
      0;
   }
}

sub get_key($ )
{
   my $ret;

   $ret = $_[0];
   $ret =~ s/^[\?\$\@]+//;
   lc($ret);
}

foreach (keys %consts) {
   if (defined($fwip{$_})) {
      undef $fwip{$_};
   }
}

foreach (map { $_->[0]; } sort { $a->[1] cmp $b->[1] }
         map { [ $_, get_key($_) ] } keys %words) {
   if (0 == pp($consts{$_}   , $_, "CONSTANT")
         + pp($funcs_def{$_} , $_, "FUNCTION-DEF", 1)
         + pp($funcs_use{$_} , $_, "FUNCTION-USE")
         + pp($fwip_funcs{$_}, $_, "FWIP-FUNCTION")
         + pp($langs{$_}     , $_, "FWIP-LANGUAGE")
         + pp($fwip{$_}      , $_, "FWIP")
         + pp($fwip_p{$_}    , $_, "FWIP_P")
         + pp($fwip_pp{$_}   , $_, "FWIP_PP")
         + pp($macro_def{$_} , $_, "MACRO_DEF")
         + pp($macro_use{$_} , $_, "MACRO_USE")
         + pp($vara{$_}      , $_, "VARIABLEARRAY")
         + pp($vars{$_}      , $_, "VARIABLESCALAR")) {
      pp($words{$_}, $_, "FWIP_XX");
   }
}
