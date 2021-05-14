package Fwip_Preprocess;
#    Copyright (C) 2018-2021 by Kevin D. Woerner
# 2021-02-26 kdw  string work
# 2021-02-14 kdw  old macro code rmed
# 2020-12-04 kdw  rm excess space from macros
# 2020-11-29 kdw  rm debugging code
# 2020-11-28 kdw  macro syntax overhaul
# 2020-08-17 kdw  macro syntax changed
# 2020-06-05 kdw  more verbose error checking
# 2020-05-29 kdw  more info in die statement
# 2020-04-17 kdw  multi-line comment support rmed
# 2020-04-08 kdw  pp[s]gl et al.
# 2020-03-02 kdw  .*_NE[X]T really deprecated
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2019-12-13 kdw  (\w+) work
# 2019-12-09 kdw  rmed exporter
# 2019-12-03 kdw  In[s]ert -> I[n]sert-[B]egin
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-04-22 kdw  F[U]NC keyword
# 2019-03-18 kdw  macro syntax changed
# 2019-02-28 kdw  REP[L]ACE/DE[F]INE work
# 2019-02-19 kdw  macro syntax
# 2018-12-18 kdw  kwelements separated
# 2018-12-07 kdw  explicit imported funcitons
# 2018-12-06 kdw  commentized changed
# 2018-12-03 kdw  macro work
# 2018-11-17 kdw  rmed 'use diagnostics'
# 2018-10-08 kdw  rm multiple blank lines
# 2018-09-16 kdw  description work
# 2018-07-19 kdw  comments; array reformat
# 2018-05-18 kdw  fixed comment output
# 2018-05-06 kdw  comme?ntized changed
# 2018-04-03 kdw  inserted file comments
# 2018-03-27 kdw  continuation lines
# 2018-03-26 kdw  macro redef
# 2018-03-12 kdw  made PP statements not need semicolon
# 2018-03-11 kdw  rm ';' from end of macro def
# 2018-03-05 kdw  rm unnecessary ()'s
# 2018-03-02 kdw  module funcs exported
# 2018-02-19 kdw  secant and macro refactor
# 2018-02-17 kdw  refactor
# 2018-02-16 kdw  created
use strict;
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Comment qw();

sub fwippp_preprocess(;$ )
{
   my $slurp;

   local $/ = undef;
   if (defined($_[0])) {
      my $fbn = $_[0];
      open FFH, "< $fbn" or die "$0:Unable to open $fbn";
      $slurp = <FFH>;
      close FFH;
      $fbn =~ s/\.fwip/:/;
      $slurp =~ s/(\n# \d\d\d\d(-\d\d){2} kdw  )/$1$fbn/g;
   } else {
      $slurp = <>;
   }

   my %ift_seen = ();
   my $ift = "\\{INSERT_FILE\\s*\\\"(.*?)\\\"\\s*\\}";
   while ($slurp =~ m/$ift/) {
      my $filenam = ($1);
      my $fbn = $filenam;
      $fbn =~ s/\.fwip/:/;
      die if ($fbn =~ m/^$/);
      my $ftext = Fwip_Comment::fwipc_comm("Insert-Begin"
            , $filenam);
      if (! -e "$filenam") {
         my $pth = $ARGV;
         $pth =~ s@[^/]+$@$filenam@;
         $filenam = $pth;
      }
      if (0 == $ift_seen{$filenam}++) {
         open FH, "< $filenam" or die "$0:Failed open $filenam";
         $ftext .= <FH>;
         close FH;
      }
      die if ($ftext =~ m/Cop[y]right\(/);
      $ftext =~ s/( Cop[y]right )/\U$1/g;
      $ftext =~ s/(\n# \d\d\d\d(-\d\d){2} kdw  )/$1$fbn/g;
      $ftext .= Fwip_Comment::fwipc_comm("Insert-End", $filenam);
      $slurp =~ s/$ift/$ftext/;
   }
   $slurp =~ s/\s*\\\n\s*/ /gm;

   # find all macros & their definitions
   my %macro_defs = ();
   my @macro_names = ();
   while ($slurp =~ s/\{MACRO\s+         # macrostart
         (\w+)\b                              # macroname
         \s*([^\{]*?)\s*                      # macroargs
         \{
         (.*?)                                # macrodef
         \}\}//xsm) {
      my ($nam, $vars, $def) = ($1, $2, $3);
      push(@macro_names, $nam);
      $def =~ s/^\s+//;
      $def =~ s/\s+$//;
      $macro_defs{$nam}->{DEF} = $def;
      @{$macro_defs{$nam}->{VAR}} = split(/\s*[\$;]\s*/, $vars);
   }

   die if ($slurp =~ m/^[^#]*\{MACRO/);
   my $macro_regx = join("|", @macro_names);
   # Now we've found all the macro definitions.
   # Now replace macroes by first finding macroes that are
   # not inside other macroes...
   while ($slurp =~ m/(\{($macro_regx)\b
            ([^{}]*?)
            \}\B)/xm) {
      my ($all, $macname, $arg) = ($1, $2, $3);
      $arg =~ s/^\s+//;
      $arg =~ s/\s+$//;
      my @macro_args = split(/\s*;\s*/, $arg);

      if (defined($macro_defs{$macname})) {
         my $macro_def = $macro_defs{$macname}->{DEF};
         my @var = (@{$macro_defs{$macname}->{VAR}});

         foreach my $ii (0..$#macro_args) {
            my $to = $macro_args[$ii];
            if ($to eq "\"\"") {
               $to = "";
            }
            if (!defined($var[$ii])) {
               die "OOPS:II=$ii\n"
                  . "TOO=$to\n"
                  . "NAM=$macname\n"
                  . "ARG=$arg\n"
                  . "ALL=$all\n"
                  . "DEF=$macro_def";
            }
            $macro_def =~ s/$var[$ii]/$to/g;
         }

         my $ff = quotemeta($all);
         if (0 == ($slurp =~ s/$ff/$macro_def/m)) {
            die "$slurp\nMACRO:$macname"
               . join("\nARGS:", "",@macro_args,"")
               . "\nALL:$all\n"
               . "DEF:$macro_def\n"
               . "FAILURE IN MACRO SUBSTITUTION\n";
         }
      }
   }

   $slurp =~ s/^([^"]*[^A-Za-z0-9_"])\(([A-Za-z0-9_]+)\)/$1$2/mg;

   $slurp =~ s/\n\n+/\n\n/g;

   $slurp;
}

1;
