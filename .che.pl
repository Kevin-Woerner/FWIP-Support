#! /usr/bin/perl -W
#    Copyright (C) 2015-2021 by Kevin D. Woerner
# 2021-04-23 kdw  macro renam
# 2019-12-06 kdw  rmed Kd[p]w_St[a]t
# 2019-11-08 kdw  file order
# 2019-11-06 kdw  H file work
# 2019-11-01 kdw  CONST regex work
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-05-22 kdw  FUN[C]TION keyword -> FU[N]C
# 2019-04-22 kdw  F[U]NC keyword
# 2018-12-07 kdw  explicit imported funcitons
# 2018-04-10 kdw  Kw.as?s.fwip -> Kw.fwipp
# 2017-08-02 kdw  refactor
# 2017-08-01 kdw  var regex fixed
# 2017-05-22 kdw  var renam
# 2017-04-19 kdw  var regex
# 2016-08-07 kdw  cod?ek?dw
# 2016-08-01 kdw  cod?ekw stuff
# 2016-07-29 kdw  cod?ekd?w stuff
# 2016-06-21 kdw  refactor fofo calls
# 2016-06-09 kdw  refactor fofo calls
# 2016-05-25 kdw  long lines
# 2016-04-13 kdw  variable rename
# 2016-04-08 kdw  look in cdss
# 2016-04-06 kdw  directory renam
# 2016-03-30 kdw  l?ib -> 0l?ib
# 2016-03-10 kdw  relative file names
# 2015-10-18 kdw  $H[O]ME instead of exlicit name
# 2015-09-18 kdw  output change
# 2015-09-17 kdw  don't include lf_* and LC_*
# 2015-09-16 kdw  BC: don't include lf_* functions
# 2015-09-10 kdw  added bc files
# 2015-08-24 kdw  rearranged output
# 2015-08-23 kdw  rearranged output
# 2015-08-22 kdw  rearranged output
# 2015-08-13 kdw  refactor
# 2015-08-11 kdw  different sorting
# 2015-08-10 kdw  refactor
# 2015-08-09 kdw  created
use strict;

my $n_rx = "[a-zA-Z][a-z_A-Z0-9]+\\b";
sub ready($ )
{
   my $fn = $_[0];
   my $flag = 0;
   my $line = "";
   my @func = ();
   open(FH, "< $fn") or die "$0: Unable to open $fn";
   while(defined(my $dd = <FH>)) {
      chomp $dd;
      if ($dd =~ s/( _|\\)$//) {
         $dd .= <FH>;
         redo unless eof(FH);
      }
      $_ = $dd;
      if (s/\{RPN_._[A-Z0-9]{3}, "((cx)?$n_rx)".*/$1/) {
         $line .= " $_";
      } elsif (s/^((cx)?$n_rx) += .*/$1/) {
         # BC / PYTHON
         if (!m/^(cx)?l[cfv]_/) {
            $line .= " $_";
         }
      } elsif (s/^#define ($n_rx) .*/$1/) {
         # H
         $line .= " $_";
      } elsif (s/^(double|bool|int|long|void) +($n_rx)\(.*/$2/) {
         # H
         $line .= " $_";
      } elsif (s/^[^#"']*\b(?:CONST|FUNC +\w+) +($n_rx).*/$1/
               # FWIP
            or s/Public +(?:Sub|Function|Const) +($n_rx).*/$1/
               # VB6
            or s/^ *(?:sub|def(?:ine)?) +($n_rx)\(.*/$1/) {
               # BC / PERL / PYTHON
         if (!m/^lf_/ and !m/^LC_/) {
            $line .= " $_";
         }
      }
   }
   close(FH);
   $line =~ s/\s+/ /g;
   $line =~ s/^\s+//;
   $line =~ s/\s+$//;
   @func = split(/\s+/, $line);
   return((@func));
}

my %funcy = ();
my $bit = 1;
my @felix = ();
sub fofo($ )
{
   my $fn = $_[0];
   my @kw_funcs = ready($fn);
   $fn =~ s@.*[/]@@;
   $fn =~ s@\.*@@;
   push (@felix, " $fn");
   foreach (@kw_funcs) {
      $funcy{$_} |= $bit;
   }
   $bit <<= 1;
}

fofo("$ENV{KW_DIR_INCLUDE}/bclib.bc");
fofo("$ENV{KW_DIR_INCLUDE}/Kdpw_Math.pm");
fofo("../../codekdw/vb-lib/stats.bas");
fofo("../../codekdw/vb-lib/Kdpw.bas");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.fwipp");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.bc");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.rpn");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.h");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.bas");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.pm");
fofo("$ENV{KW_DIR_INCLUDE}/Kw.py");

my @outy = map { sprintf("%4.4X", $_); } (0..($bit - 1));
my $bitm = 1;
foreach my $fel (@felix) {
   my $bbb = " -" . (" " x (length($fel) - 2));
   foreach my $mask (0..($bit - 1)) {
      $outy[$mask] .= (($mask & $bitm) ? $fel : $bbb);
   }
   $bitm <<= 1;
}

foreach (sort { $funcy{$a} <=> $funcy{$b} || "\L$a" cmp "\L$b" }
         keys %funcy) {
   printf "%s %s\n", $outy[$funcy{$_}], $_;
}
