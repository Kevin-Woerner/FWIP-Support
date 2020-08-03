#! /usr/bin/perl -W
#    Copyright (C) 2017-2020 by Kevin D. Woerner
# take the output of fwip-parse, and 'nicely' format it
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-07-09 kdw  mode-extended rmd
# 2020-05-20 kdw  made more .fw.pl compatible
# 2020-05-13 kdw  trivially changed
# 2020-05-12 kdw  language syntax
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-04-23 kdw  const format change
# 2020-04-10 kdw  debugging other things
# 2020-04-09 kdw  MO[D]E syntax change
# 2020-04-08 kdw  preprocess sigil change
# 2020-04-03 kdw  die message change
# 2020-03-19 kdw  join comments after LAN[G]UAGE.*
# 2020-03-06 kdw  RE[P]LACE / IN[D]EX changes
# 2020-03-05 kdw  rmed several key words
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2020-02-26 kdw  comment change
# 2020-01-07 kdw  getopt line updated
# 2019-10-05 kdw  tweak
# 2019-09-19 kdw  rmed space after negation operator
# 2019-09-10 kdw  LA[N]GUAGE NOT to LA[N]GUAGE_NOT
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-08-12 kdw  fwip wrap func arg change
# 2019-08-05 kdw  var renam; fwip-wrap lib
# 2019-07-22 kdw  FU[N]C regex cleanup
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-06-12 kdw  rmed var n[u]l_to
# 2019-05-31 kdw  fwip-comment module
# 2019-05-29 kdw  comment changed
# 2019-04-22 kdw  F[U]NC keyword
# 2019-04-17 kdw  *_DO, THEN work
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-03-08 kdw  is[e]qual -> is[e]q, et al.
# 2019-02-28 kdw  REP?LACE/DEF?INE work
# 2019-01-31 kdw  probs w/ new keywords followed by (
# 2019-01-23 kdw  add-sub-div-mul keywords
# 2019-01-03 kdw  indcc, et al.
# 2018-12-07 kdw  explicit imported funcitons
# 2018-07-19 kdw  comments; array reformat
# 2018-07-11 kdw  eroor message improved
# 2018-06-27 kdw  const work
# 2018-05-22 kdw  comment change
# 2018-05-18 kdw  LAN?GUAGE syntax change
# 2018-05-17 kdw  ARR?AY.* and HOR[N]ER syntax
# 2018-05-16 kdw  AR?RAY work
# 2018-05-14 kdw  BLOCK syntax
# 2018-04-26 kdw  -l NUM option
# 2018-04-25 kdw  line wrapping fixes
# 2018-04-19 kdw  consts rework
# 2018-04-10 kdw  language blocks
# 2018-04-02 kdw  Pro?totype, et al.
# 2018-04-01 kdw  LA[N]G?UAGE_EN?D
# 2018-03-26 kdw  long lines / " +(" handling;
# 2018-03-20 kdw  simplified rx
# 2018-03-17 kdw  comment change
# 2018-03-16 kdw  format of constant & index change
# 2018-03-13 kdw  join comments after const defs
# 2018-03-12 kdw  diff die message
# 2018-02-19 kdw  secant and macro refactor
# 2018-02-14 kdw  IN[D]EX stuff
# 2018-02-13 kdw  pre-processor stuf rmed
# 2017-11-26 kdw  FR[O]M/B[Y] keywords
# 2017-11-22 kdw  regex > 32766 character
# 2017-11-04 kdw  longline handling; const lines
# 2017-10-23 kdw  comment lines have two "@"
# 2017-10-20 kdw  no more ?[?]?
# 2017-09-22 kdw  more inline comment rework
# 2017-09-21 kdw  inline comment rework
# 2017-07-06 kdw  minor cleanup
# 2017-07-03 kdw  comment work
# 2017-06-23 kdw  REPL?ACE redo
# 2017-06-12 kdw  preserve " " after IF, RETURN
# 2017-06-02 kdw  boolean operator spacing fix
# 2017-06-01 kdw  error message clarified
# 2017-04-30 kdw  func -> function
# 2017-04-26 kdw  \?+COMMENT.*
# 2017-04-21 kdw  rm space after "= -"
# 2017-04-19 kdw  function declarations changed
# 2017-04-18 kdw  comment block stuff
# 2017-04-17 kdw  block stuff
# 2017-04-10 kdw  line wrp verbose die
# 2017-04-06 kdw  Python3 support
# 2017-03-28 kdw  line wrp fix 3
# 2017-03-27 kdw  line wrp fix II
# 2017-03-26 kdw  line wrp fix A
# 2017-03-25 kdw  rm blank line
# 2017-03-24 kdw  nl after \?[\?]\? line -- oops
# 2017-03-21 kdw  reorg of code
# 2017-03-20 kdw  bc long lines
# 2017-03-19 kdw  refactor
# 2017-03-14 kdw  long line wrapping fixed(?)
# 2017-03-13 kdw  2d array code; ** code
# 2017-03-12 kdw  long line code
# 2017-03-10 kdw  tweaking
# 2017-03-09 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Comment qw();
use Fwip_Wrap qw();

my ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");
my $compact_flag = 0;
my $length_limit = Fwip_Comment::FWIPC_LINE_LENGTH;
my $no_comments = 0;
my $verbose = 0;
if (!Getopt::Long::GetOptions("c", \$compact_flag
      , "l=i", \$length_limit
      , "v+", \$verbose
      , "C+", \$no_comments)) {
   die <<EndOfUsage;
Usage: $0 [OPTIONS] [FILE]
Convert the output of fwip-parse
Options:
   -l LIM   length limit
   -c       compact output
   -C       no comments
   -v       verbose
EndOfUsage
}

my $bq = "   ";
{
   my $lv_ind_next = "";
   sub lf_ind_pop($$ )
   {
      if ($lv_ind_next !~ s/${bq}//) {
         print STDERR "POPind:$_[0]:$_[1]\n";
      }
   }
   sub lf_ind_push()
   {
      $lv_ind_next .= ${bq};
   }
   sub lf_ind_get()
   {
      $lv_ind_next;
   }
   sub lf_ind_reset()
   {
      $lv_ind_next = "";
   }
}

my $all = "";
my $nl = ($compact_flag ? " " : "\n");
my @out = ();
my $lv_len = 15;
sub print_curr($ )
{
   my $input_line = $_[0];

   if ($input_line =~ m/\S/) {
      my $curr_line = $input_line;
      if ($curr_line !~ m/^\s*$lv_cm0/) {
         $curr_line =~ s/(\w) +([]()[])/$1$2/g;
         # previous subst is overly aggressive wrt stuff
         $curr_line =~ s/\b(AND|X?OR|NOT|(ELS)?IF|RETURN)\(
               /$1 (/xg;
         $curr_line =~ s/(\s*)((?:BLOCK_)?CONST)\s+(\w+)\s*(=)\s*
               /$1$2 $3 $4 /gx;

         $curr_line =~ s/([,=])\s+([+-])\s+([0-9])/$1 $2$3/g;
         $curr_line =~ s/,\s+([+-])\s+([0-9])/, $1$2/g;
         $curr_line =~ s/\b(BY|TO)\s+-\s+/$1 -/g;
         $curr_line =~ s/ +([\)\],:;])/$1/g; # space before )],:;
         $curr_line =~ s/([\(\[]) +/$1/g; # space after ([
         if ($compact_flag) {
            $curr_line =~ s/\s*([\]\[\(\),:;])\s*/$1/g;
         }
         $curr_line =~ s/\]\s+\[/][/g; # space between ] and [
         $curr_line =~ s/\(\s*-\s*/(-/g;
         $curr_line =~ s/\(\s*\+\s*/(/g;
         #$curr_line =~ s/ \+= - / -= /g;
         $curr_line =~ s/=\s+-\s+/= -/g;
         $curr_line =~ s/=\s*\+\s+/= /g;
         $curr_line =~ s/\s+\*\s+\*\s+/ ** /g;
         $curr_line =~ s/\<\s+\>/<>/g;
         $curr_line =~ s/^(($bq)*) {1,2}(\S)/$1$3/g;
         $curr_line =~ s/(CONST \S+ -) /$1/g;
         $curr_line =~ s/(\s+\+\s+-)\s+/$1/g;
         if ($nl ne "\n") {
            $curr_line =~ s/^ +//;
            #$curr_line =~ s/  +/ /g;
            while ($curr_line =~ s@ +([-/*+<>=]=?) +@$1@g) {
               next;
            }
         } else {
            if ($curr_line =~ m/^(\s*)(.*)\bFUNC\b/) {
               my $bb = $1;
               $curr_line =~ s/,/\n$bb$bq$bq,/g; # CNTNTNLN
            }
         }
      }
      $curr_line =~ m/^( *)/;
      my $lead = $1;

      if ($curr_line =~ m/^\s*$lv_cm0/
               and defined($out[-1])
               #and $out[-1] !~ m/[\#\:]/
               and $out[-1] !~ m/^ *[A-Z]{3} /) {
         $curr_line =~ s/^(\s*)//;
         my $ld = $1;
         push(@out, "$ld$curr_line");
      } else {
         push(@out, $curr_line);
      }
   } else {
      push(@out, $input_line);
   }

   if (defined($out[-1]) and $out[-1] =~ m/Copyright\(/) {
      die join("", @out, "\nOUT[-1]:", $out[-1]
            , "\nINPUTLI:", $input_line, "\n$0:$#out");
   }
}

lf_ind_reset();
my $lang_block = 0;
my $curr_line = "";
my @indcc = ();
while (<>) {
   chomp;
   if (m/^\s*$/) {
      next;
   } elsif ($no_comments and m/^$lv_cm0.*/) {
      next;
   }
   s/^\s+//;
   s/\s+$//;

   if (s/^($lv_cm0.*)//) {
      my $comm = $1;
      if ($curr_line =~ m/\S/) {
         $curr_line .= " $lv_cm0";
      }
      $curr_line .= "${comm}\n";
   } elsif (m/^;/) {
      $curr_line .= "$_$nl";
   } elsif (m/^\?*[A-Z_0-9]+_END\b/) {
      if ($curr_line =~ m/\S$/) {
         $curr_line .= " ";
      }
      if (0 <= $#indcc) {
         pop(@indcc);
      }
      $curr_line .= "$_$nl";
      $curr_line =~ s/$bq//;
      lf_ind_pop($_, $curr_line);
      if ($curr_line =~ m/LANGUAGE_END\b/) {
         $lang_block = 0;
         pop(@indcc);
      }
   } elsif (m/^(LANGUAGE(_NOT)?|FUNC|ARRAY|BLOCK|IF|FOR
               |WHILE|AWAIT|MODE_INTEGER)$/x) {
      push(@indcc, $1);
      if ($curr_line =~ m/\S$/) {
         $curr_line .= " ";
      }
      $curr_line .= $_;
   } elsif (m/^(:)/) {
      if (0 <= $#indcc) {
         if ($indcc[$#indcc] eq "IF") {
            $curr_line .= ":$nl";
         } elsif ($indcc[$#indcc] =~ m/^(WHILE|FOR|AWAIT)$/) {
            $curr_line .= ":$nl";
         } else {
            $curr_line .= "$_$nl";
         }
      } else {
         $curr_line .= "$_$nl";
      }
      if ($curr_line =~ m/(LANGUAGE(_NOT)?\b)/) {
         $curr_line =~ s/$bq//;
         if ($lang_block == 0) {
            lf_ind_push();
         }
         $lang_block = 1;
      } elsif ($curr_line =~ m/\b(MODE_INTEGER|BLOCK)\b/x) {
#         $curr_line =~ s/$bq//;
         push(@indcc, $1);
         lf_ind_push();
      } elsif ($curr_line =~ m/^\s+(ELSIF|ELSE)\b/) {
         $curr_line =~ s/$bq//;
      } else {
         lf_ind_push();
      }
   } else {
      if ($curr_line =~ m/\S$/) {
         $curr_line .= " ";
      }
      $curr_line .= $_;
   }

   if ($curr_line =~ m/(\n|$lv_cm0)/) {
      if ($curr_line =~ s/^(($bq)*)( {1,2})(\S)/$1$4/g) {
         print STDERR "BAD LEAD:", length($3),":$curr_line";
      }
      print_curr($curr_line);
      if ($compact_flag) {
         $curr_line = "";
      } else {
         $curr_line = lf_ind_get();
      }
   }
}
print_curr($curr_line);

# join comments following a const def
for (my $ii = 0; $ii < $#out; $ii++) {
   if ($out[$ii + 1] =~ m/^\s*$lv_cm0/) {
      if ($out[$ii] =~ m/^ *(ARRAY(_END)?|CONST|BLOCK_CONST)\b/
            or $out[$ii] =~ m/^ *(BLOCK|BLOCK_END\b)/
            or $out[$ii] =~ m/^ *(LANGUAGE(_END|_NOT)?\b)/) {
         $out[$ii + 1] =~ s/^\s*//;
         chomp($out[$ii]);
         $out[$ii] .= $out[$ii + 1];
         $out[$ii + 1] = "";
      }
   }
}

for my $ln (grep { m/./ } @out) {
   print Fwip_Wrap::fwip_wrap($ln, $verbose, $length_limit);
}
