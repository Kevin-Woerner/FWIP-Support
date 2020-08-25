package Fwip_Translate;
#    Copyright (C) 2017-2020 by Kevin D. Woerner
# 2020-07-29 kdw  block-def work
# 2020-07-25 kdw  s/BITWISE/BIT/
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-07-20 kdw  arraylast work
# 2020-07-09 kdw  mode-extended rmd
# 2020-06-22 kdw  comments on output rmed II
# 2020-06-19 kdw  comments on output rmed
# 2020-06-17 kdw  "%" modulus operator
# 2020-06-16 kdw  keywords rmed
# 2020-06-12 kdw  VBDOTNET: fixed basic mod function def
# 2020-06-05 kdw  VB6: rmed timegettime func
# 2020-06-03 kdw  writeonly keyword
# 2020-05-29 kdw  more simple keywords
# 2020-05-27 kdw  more consolidation
# 2020-05-25 kdw  consolidation
# 2020-05-21 kdw  simplified
# 2020-05-13 kdw  lang comment trivially changed
# 2020-05-12 kdw  local.* keywords
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-04-17 kdw  comment change
# 2020-04-10 kdw  BC: fl[o]orl problem
# 2020-04-09 kdw  MO[D]E syntax change
# 2020-04-08 kdw  preprocess sigil change
# 2020-04-07 kdw  ppsgl and ppqm vars
# 2020-04-01 kdw  C: Bol -> long
# 2020-03-31 kdw  LA[B]S renam
# 2020-03-25 kdw  PYTHON: dont write byte code
# 2020-03-19 kdw  tr[u]e/fa[l]se work
# 2020-03-10 kdw  math functions
# 2020-03-06 kdw  RE[P]LACE / IN[D]EX changes
# 2020-03-05 kdw  keywords (TRU|FALS)[E]VAL changed
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2020-02-21 kdw  spacing tweak
# 2020-02-18 kdw  rmed con[t]inue keyword
# 2020-02-07 kdw  ptrsafe for vb7
# 2020-01-10 kdw  mod funciton on vb.net
# 2019-12-09 kdw  rmed unused "use"s
# 2019-12-09 kdw  PERL: added "qw()" to use lines
# 2019-11-05 kdw  C: labs work
# 2019-10-05 kdw  tweak
# 2019-09-17 kdw  rmed c[n]v_db[l]2i32
# 2019-09-16 kdw  lf_mod_.* funcs
# 2019-09-10 kdw  LA[N]GUAGE NOT to LA[N]GUAGE_NOT
# 2019-08-30 kdw  DONTNET: syntax error
# 2019-08-26 kdw  PRI[N]TS -> PR[I]NTSTR
# 2019-08-25 kdw  magic-string
# 2019-08-24 kdw  for and count loops have from clause
# 2019-08-18 kdw  B[O]OL -> B[O]L
# 2019-08-17 kdw  L[O]G -> L[N] transition
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-08-07 kdw  VB.*:c[n]v_d[b]l2i32 truncate, not round
# 2019-08-05 kdw  rmed el?seif keyword
# 2019-08-01 kdw  calling set-die func
# 2019-07-31 kdw  bit -> bitwise func nams
# 2019-07-22 kdw  FU[N]C regex cleanup
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-06-28 kdw  comment changed
# 2019-06-12 kdw  rmed var lv_n[u]l_to
# 2019-06-04 kdw  tur2deg funcs
# 2019-06-03 kdw  VB6: total rewrite of atan2
# 2019-05-31 kdw  added space before { in output
# 2019-05-29 kdw  comment changed
# 2019-05-24 kdw  local replaced private
# 2019-05-22 kdw  FUN[C]TION keyword -> FU[N]C
# 2019-05-20 kdw  rm unneeded comment blocks
# 2019-04-22 kdw  F[U]NC keyword
# 2019-04-17 kdw  *_DO, THEN work boundaries
# 2019-04-16 kdw  loop_DO keywords
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-03-19 kdw  re[t]_val -> re[t]valu
# 2019-03-08 kdw  is[e]qual -> is[e]q, et al.
# 2019-03-01 kdw  writeable keyword
# 2019-02-28 kdw  rmed REPL?ACE
# 2019-02-04 kdw  C: include std[b]ool
# 2019-02-04 kdw  PERL: prototype work
# 2019-01-31 kdw  PERL: use time.hires for t[i]mee
# 2019-01-23 kdw  add-sub-div-mul keywords
# 2019-01-03 kdw  *_loop keyword
# 2018-12-31 kdw  assign keyword
# 2018-12-18 kdw  kwelements separated
# 2018-12-07 kdw  explicit imported funcitons
# 2018-11-29 kdw  no net change
# 2018-11-19 kdw  ass.*
# 2018-11-19 kdw  add/sub/mul/div
# 2018-11-03 kdw  *.h, *.rpn stuff
# 2018-10-20 kdw  added shared keyword in *.vb
# 2018-10-10 kdw  shared funcs for dotnet
# 2018-10-08 kdw  vbdotnet stuff
# 2018-10-07 kdw  vb dot net work
# 2018-10-02 kdw  .net: timegettime func
# 2018-09-28 kdw  VB: s/En[d]If/End\ If/g
# 2018-09-25 kdw  dot net work
# 2018-07-16 kdw  await loop work
# 2018-06-27 kdw  zq-set-word func
# 2018-06-08 kdw  logical not work
# 2018-05-21 kdw  consolidate translate funcs
# 2018-05-18 kdw  LAN?GUAGE syntax change
# 2018-05-16 kdw  AR?RAY work
# 2018-05-15 kdw  DIE.* change
# 2018-05-14 kdw  BLOCK syntax
# 2018-05-01 kdw  current funciton 2 args
# 2018-04-03 kdw  typo
# 2018-04-02 kdw  Pro?totype, et al.
# 2018-04-01 kdw  LA[N]G?UAGE_EN?D
# 2018-03-20 kdw  replaced index w/ @replace
# 2018-03-16 kdw  format of constant & index change
# 2018-03-12 kdw  loop work
# 2018-03-11 kdw  units call *_op
# 2018-03-02 kdw  export fw?ipt_ funcs
# 2018-02-17 kdw  preprocessor stuff rmed
# 2018-02-16 kdw  await debugging
# 2018-02-15 kdw  python doesn't have math.abs
# 2018-02-14 kdw  IN[D]EX stuff
# 2018-02-13 kdw  pre-processor stuf rmed
# 2017-11-27 kdw  minor output change
# 2017-11-26 kdw  FR[O]M and B[Y] keywords
# 2017-11-24 kdw  AR[R]AY_E[N]D
# 2017-11-21 kdw  FR[O]M
# 2017-11-03 kdw  units nul_to
# 2017-11-01 kdw  boolean values
# 2017-10-21 kdw  var renam; preprocess syntax
# 2017-09-21 kdw  funcs renamd
# 2017-09-06 kdw  UNITS support
# 2017-09-04 kdw  master functions compactified
# 2017-08-31 kdw  \!\!\!LA[N]G?UAGE
# 2017-08-22 kdw  INS[E]RT_F[I]LE syntax changed
# 2017-07-06 kdw  LA?NG_FW?IP
# 2017-07-04 kdw  func name changed
# 2017-06-23 kdw  REPL?ACE redo
# 2017-06-03 kdw  PRI?NT.* changed
# 2017-05-31 kdw  do not export fwip-comment functions
# 2017-05-11 kdw  make 'package' line 1st; rm shebang line
# 2017-05-03 kdw  fwipt_types; dont export fwipt_* functions
# 2017-04-30 kdw  func -> function
# 2017-04-26 kdw  \?+COM[M]ENT.*
# 2017-04-21 kdw  comment change
# 2017-04-20 kdw  diebitch
# 2017-04-19 kdw  function declarations changed
# 2017-04-17 kdw  rm unsed args
# 2017-04-03 kdw  func renam; reorg
# 2017-03-30 kdw  major reorg
# 2017-03-29 kdw  major reorg
# 2017-03-28 kdw  created
use strict;
use vars qw(@EXPORT @EXPORT_OK %EXPORT_TAGS);
use Exporter qw(import);
@EXPORT = ();
@EXPORT_OK = (qw(
   LANG_C LANG_H LANG_RPN LANG_VB6 LANG_PERL LANG_PYTHON
   LANG_VARYLOG LANG_BC LANG_UNITS LANG_FWIPP LANG_VBDOTNET
fwipt_current_function_set
fwipt_current_function_get
fwipt_current_function_ret_get
fwipt_ls_get
fwipt_ls_next
fwipt_ls_inc
fwipt_ls_dec
fwipt_lang_get
fwipt_lang_is
fwipt_lang_aint
fwipt_bq_set
fwipt_vbsub_set
fwipt_keyword_printout
fwipt_keyword_seen
fwipt_keyword_replace
fwipt_countsplit
fwipt_too
fwipt_check_line
fwipt_lang_set
fwipt_initcode
fwipt_master_functions
fwipt_loopy
));
%EXPORT_TAGS = ( ALL => [ @EXPORT_OK ] );

use Carp     qw();
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Comment qw();
my $lv_target_language;
########################CONVERTER CODE###########################
my ($lv_cm0, $lv_cm4);

sub LANG_NONE()         { 0; }
sub LANG_PYTHON()       { 1; }
sub LANG_VB6()          { 2; }
sub LANG_C()            { 3; }
sub LANG_BC()           { 4; }
sub LANG_PERL()         { 5; }
sub LANG_H()            { 6; }
sub LANG_RPN()          { 7; }
sub LANG_VARYLOG()      { 8; }
sub LANG_UNITS()        { 9; }
sub LANG_VBDOTNET()     { 10; }
sub LANG_FWIPP()        { -1; }

my $zqbq;
my $zqbql;
{
   my $lv_lsprev = "";
   my $lv_lscurr = "";
   my $lv_lsnext = "";
   my $lv_lsfunc = "";

   sub fwipt_ls_get() {
      $lv_lscurr;
   }
   sub fwipt_ls_next() {
      $lv_lscurr = $lv_lsnext;
   }
   sub fwipt_ls_inc($ ) {
      $lv_lsprev = $lv_lscurr;
      $lv_lsnext .= ${zqbq};
      if ($_[0] =~ m/\b(?:BLOCK_)?(FUNC)\b/) {
         lf_vbx_push($1);
         $lv_lsfunc = $_[0];
      }
   }
   sub fwipt_ls_dec($ ) {
      $lv_lsprev = $lv_lscurr;
      if ($lv_lsnext !~ s/${zqbq}//) {
         print STDERR "FUNC:$lv_lsfunc\n$_[0]\n";
         Carp::confess("bad dec\nCURR:\"$lv_lscurr\"\n"
               . "PREV:\"$lv_lsnext\"\nLINE:$_[0]\n"
               . "FUNC:$lv_lsfunc\n");
         die "BAD DEC";
      }
      fwipt_ls_next();
   }
}

{
   my $lv_curfun = "";
   my $lv_curfun_ret = "";
   sub fwipt_current_function_set($$ )
   {
      if ($lv_curfun ne "" and $_[0] ne "") {
         Carp::confess("INSIDE:$lv_curfun\n"
            . "STARTI:$_[0]\n");
      } elsif ($lv_curfun eq "" and $_[0] eq "") {
         Carp::confess("Can't exit function here!\n");
      }

      $lv_curfun = $_[0];
      $lv_curfun_ret = $_[1];
   }
   sub fwipt_current_function_get()
   {
      $lv_curfun;
   }
   sub fwipt_current_function_ret_get()
   {
      $lv_curfun_ret;
   }
}

sub fwipt_lang_get()
{
   $lv_target_language;
}
sub fwipt_lang_is($;$$$$$$ )
{
   my $ret = 0;
   foreach (@_) {
      if ($lv_target_language == $_) {
         $ret = 1;
         last;
      }
   }
   $ret;
}
sub fwipt_lang_aint($;$$$$$$ )
{
   my $ret = 1;
   foreach (@_) {
      if ($lv_target_language == $_) {
         $ret = 0;
         last;
      }
   }
   $ret;
}

{  # BLOCK:   # zq
   my $zqqvbsub_or_func = "";
   sub fwipt_bq_set($ )
   {
      $zqbq = $_[0];
      $zqbql = length($zqbq);
      ($zqbq, $zqbql);
   }
   sub fwipt_vbsub_set($ )
   {
      $zqqvbsub_or_func = ($_[0] == 0 ? " Sub" : " Function");
   }
   my %zqqt_word = ();
   {  # BLOCK:
      my %zqqkeyword_seen = ();
      sub fwipt_keyword_printout()
      {
         foreach my $keyw (sort keys %zqqkeyword_seen) {
            printf STDERR "%8d $keyw\n", $zqqkeyword_seen{$keyw};
         }
      }
      sub fwipt_keyword_seen($ )
      {
         $zqqkeyword_seen{$_[0]}++;
      }

      sub fwipt_keyword_replace($ )
      {
         my $st = $_[0];
         foreach my $keyw (sort { length($b) <=> length($a); }
                     keys %zqqt_word) {
            my $qm = quotemeta($keyw);
            if ($keyw =~ m/\W/) {
               $zqqkeyword_seen{$keyw}
                  += ($st =~ s/$qm/$zqqt_word{$keyw}/g);
            } else {
               if ($zqqt_word{$keyw} eq "") {
                  $zqqkeyword_seen{$keyw}
                     += ($st =~ s/\b$qm\b\s*//g);
               } elsif ($qm =~ m/^\w+$/) {
                  $zqqkeyword_seen{$keyw}
                     += ($st =~ s/\b$qm\b/$zqqt_word{$keyw}/g);
               } else {
                  $zqqkeyword_seen{$keyw}
                     += ($st =~ s/$qm/$zqqt_word{$keyw}/g);
               }
            }
         }
         $st;
      }
   }   # BLOCK_END

   {
      my @zqqvbxkind = ();
      my @zqqvbxcond = ();
      sub lf_vbx_push($;$ )
      {
         push(@zqqvbxkind, $_[0]);
         if (defined($_[1])) {
            push(@zqqvbxcond, $_[1]);
         } else {
            if (!defined($zqqt_word{$_[0] . "_END"})) {
               foreach (sort keys %zqqt_word) {
                  print STDERR "RT=$_ -> $zqqt_word{$_}\n";
               }
               print STDERR "TR=$_[0]";
               die;
            }
            push(@zqqvbxcond, $zqqt_word{$_[0] . "_END"});
         }
      }
      sub lf_vbx_pop($ )
      {
         if ($#zqqvbxkind < 0) {
            Carp::confess("STACK-EMPTY:$_[0]\n");
            (undef, undef);
         } else {
            (pop(@zqqvbxkind), pop(@zqqvbxcond));
         }
      }
   }

   my %zqqt_op = ();
   sub lf_zq_set_op($$$$$$$ )
   {
      $zqqt_op{MOD}        = $_[0];
      $zqqt_op{BITAND} = $_[1];
      $zqqt_op{BITOR}  = $_[2];
      $zqqt_op{BITXOR} = $_[3];
      $zqqt_op{BITNOT} = $_[4];
      $zqqt_op{BITSHIFTL}  = $_[5];
      $zqqt_op{BITSHIFTR}  = $_[6];
   }

   my %zqqt_tr = ();
   sub lf_zq_set_zqq_tr($ )
   {
      my @lines = split(/\n/, $_[0]);
      foreach (@lines) {
         if (m/^(\S+)\s*(\S.*)/) {
            my ($fr, $to) = ($1, $2);
            $to =~ s/\"\"//;
            $zqqt_tr{$fr} = $to;
         } else {
            die "BAD line:\"$_\"";
         }
      }
   }
   sub lf_zq_set_zqqissdie($$ )
   {
      $zqqt_tr{ISS} = $_[0];
      $zqqt_tr{DIE} = $_[1];
   }

   sub lf_if_loop($ )
   {
      my $st = $_[0];
      $st =~ s/\s+(\bFUNC_END\b)/\n$1/;
      if ($st =~ s/\b(FUNC_END)\b/$zqqt_word{FUNC_END}/xg) {
         fwipt_keyword_seen($1);
         fwipt_ls_dec($1);
         $zqqvbsub_or_func = "";

         fwipt_current_function_set("", "");
      } else {
         foreach my $lo (qw(AWAIT FOR WHILE)) {
            if ($st =~ m/\b${lo}(_END)\b/) {
               my ($knd, $awa) = (lf_vbx_pop($st));
               if (defined($knd) and ($lo eq $knd)) {
                  fwipt_ls_dec($st);
                  $st =~ s/\b${lo}_END\b/$awa/;
               } else {
                  Carp::confess("EXPECTING=$knd; GOT=$lo\n"
                        . "INPUT:$_[0]\n");
               }
            }
=pod
            my $ex = "${lo}_EXIT";
            if ($st =~ s@\b($ex)\b\s*(;)@$1$2@g) {
               fwipt_keyword_seen($ex);
            }
=cut
         }
      }
      if ($st =~ s/\bIF\b\s*(\S.*?)\s*(:)
               /$zqqt_tr{IF}$1$zqqt_tr{IF_}/xsmg) {
         fwipt_ls_inc($st);
      }
      if ($st =~ s/\bELSIF\b\s*(\S.*?)\s*(:)
               /$zqqt_tr{ELSIF}$1$zqqt_tr{ELSIF_}/xsmg
            or $st =~ s/\bELSE\b(:)/$zqqt_tr{ELSE}/smg) {
         fwipt_ls_dec($st);
         fwipt_ls_inc($st);
      }
      if ($st =~ s/\bIF_END\b/$zqqt_tr{IF_END}/smg) {
         fwipt_ls_dec("IF_END");
      }
      if ($st =~ s/\bWHILE\b\s*(\S.*)\s*(:)
               /$zqqt_tr{WHILE}$1$zqqt_tr{WHILE_}/xsmg) {
         fwipt_ls_inc($st);
         lf_vbx_push("WHILE");
      }

      $st =~ s/\(\s+/(/g;

      if (defined($zqqt_tr{DIE})) {
         $st =~ s/\bDIE\b\s*(.*);/$zqqt_tr{DIE}/ee;
      }
      $st;
   }
   sub lf_math($$ )
   {
      my ($st, $hh) = @_;
      foreach (split(/\n/, $hh)) {
         if (m/(\S+)\s+(\S+)/) {
            my ($aa, $bb) = ($1, $2);
            $st =~ s/\b$aa\b/$bb/g;
         }
      }
      $st;
   }

   sub lf_math_functions($ )
   {
      my $st = $_[0];
      my $xx = "";

      if (fwipt_lang_is(LANG_VBDOTNET)) {
         $xx = <<EOF;
ABS    Math.Abs
ABSL   Math.Abs
ATAN2  Math.Atan2
CEIL   Math.Ceiling
CEILL  ceill
COS    Math.Cos
EXP    Math.Exp
FLOOR  Math.Floor
FLOORL floorl
LN     Math.Log
POW    Math.Pow
SIN    Math.Sin
SQRT   Math.Sqrt
TAN    Math.Tan
EOF
      } elsif (fwipt_lang_is(LANG_VB6)) {
         $xx = <<EOF;
ABS    Math.Abs
ABSL   Math.Abs
ATAN2  Atan2
CEIL   Ceil
CEILL  ceill
COS    Math.Cos
EXP    Math.Exp
FLOOR  floor
FLOORL floorl
LN     Math.Log
POW    Pow
SIN    Math.Sin
SQRT   Sqr
TAN    Math.Tan
EOF
      } elsif (fwipt_lang_is(LANG_PYTHON)) {
         $xx = <<EOF;
ABS    math.fabs
ABSL   math.fabs
ATAN2  math.atan2
CEIL   math.ceil
CEILL  ceill
COS    math.cos
EXP    math.exp
FLOOR  floor
FLOORL floorl
LN     math.log
POW    math.pow
SIN    math.sin
SQRT   math.sqrt
TAN    math.tan
EOF
      } elsif (fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
         $xx = <<EOF;
ABS    fabs
ABSL   labs
ATAN2  atan2
CEIL   ceil
CEILL  ceill
COS    cos
EXP    exp
FLOOR  floor
FLOORL floorl
LN     log
POW    pow
SIN    sin
SQRT   sqrt
TAN    tan
EOF
      } else {
         $xx = <<EOF;
ABS    abs
ABSL   abs
ATAN2  atan2
CEIL   ceil
CEILL  ceill
COS    cos
EXP    exp
FLOOR  floor
FLOORL floorl
LN     log
POW    Kw.pow
SIN    sin
SQRT   sqrt
TAN    Kw.tan
EOF
      }
      lf_math($st, $xx);
   }
   sub MAGIC_STRING () { "}[)(([pp}" }

   sub fwipt_countsplit($ )
   {
      my %goo = (COUNT => 0, FROM => 0, TO => 0
            , BY => 0);
      $_[0] =~ m/\b(COUNT\s+\S+\s+\S.*\S)\s*(:)/;
      my ($rest) = ($1);
      my %ff = (FROM => MAGIC_STRING, TO => "INTMAX", BY => 1);
      my @tok = (split(/(\b(?:COUNT|FROM|TO|BY)\b)/
            , $rest));
      foreach (@tok) {
         s/^\s+//;
         s/\s+$//;
      }
      for (my $iii = 0; $iii + 1 <= $#tok; $iii++) {
         if (defined($goo{$tok[$iii]})) {
            $ff{$tok[$iii]} = "" . $tok[$iii + 1];
         }
      }
      (%ff);
   }

   sub lf_do_await_loop($ )
   {
      my $cond = $_[0];
      $cond =~ s/ +$//;
      $cond =~ s/^ +//;
      fwipt_ls_inc($cond);
#      my $awaitexit = "AWAIT_EXIT$zqqt_tr{ISS}${lv_cm0}";
#      my $awaitexit = "$zqqt_word{AWAIT_EXIT};${lv_cm0}";
      my $awaitexit = "AWAIT_EXIT; ${lv_cm0} loop AWAIT";
      my $prf = "";
      if ($cond =~ s/(\s+COUNT\b\s*(\S+)(.*))$//) {
         my %ff = (fwipt_countsplit($1));
         if ($ff{FROM} ne MAGIC_STRING) {
            $_ = "$ff{COUNT} = $ff{FROM}$zqqt_tr{ISS}\n$_";
         }
         $prf = "${zqbq}$ff{COUNT} += $ff{BY}$zqqt_tr{ISS}\n";
         if ($ff{TO} ne "INTMAX") {
            $prf .= "${zqbq}IF $ff{TO} <= $ff{COUNT}:\n"
               . "${zqbq}${zqbq}$awaitexit\n"
               . "${zqbq}IF_END\n";
         }
      }

      lf_vbx_push("AWAIT"
            , "${zqbq}IF $cond:\n"
               . "${zqbq}${zqbq}$awaitexit\n"
               . "${zqbq}IF_END\n"
               . "$prf"
               . "AWAIT_END");
   }
   sub fwipt_too($ )
   {
      my ($st) = @_;
      my $zqqt_oprxall = join("|", keys %zqqt_op);
      my $zqqt_oprxnotbc = join("|", map {
         my $rxr = $_;
         $rxr =~ s/(\W)/\\$1/g;
         $rxr
      } values %zqqt_op);

      # ### BC ### BC ### BC ### BC ### BC ### BC ### BC ### BC #
      if ($lv_target_language == LANG_BC) {
         while ($st =~ s/\b($zqqt_oprxall)\s*
                     \(\s*([^,]+)\s*,\s*([^\)]+)\s*\)
                  /$zqqt_op{$1}($2, $3)/xmsg) {
            next;
         }
      # #### !BC ## !BC ### !BC ### !BC ### !BC ### !BC ### !BC #
      } else {
         # ### PYTHON ### PYTHON ### PYTHON ### PYTHON ### PYTHON
         if ($lv_target_language == LANG_PYTHON
                  or $lv_target_language == LANG_VBDOTNET
                  or $lv_target_language == LANG_VB6) {
            while ($st =~ s/\b(MOD)\s*
                     \(\s*([^,]+)\s*,\s*([^\)]+)\s*\)
                  /$zqqt_op{$1}($2, $3)/xmsg) {
               next;
            }
         }
         while ($st =~ s/\b($zqqt_oprxall)\s*
                  \(\s*([^,]+)\s*,\s*([^\)]+)\s*\)
               /(($2) $zqqt_op{$1} ($3))/xmsg) {
            $st =~ s/\((\([^()]+\))\)/$1/mg;
            $st =~ s/\(\((\w+(\[[^]]\])?)\) /($1 /g;
            $st =~ s/ \((\w+(\[[^]]\])?)\)\)/ $1)/g;
            next;
         }
         $st =~ s/ ($zqqt_oprxnotbc) \((\w+)\)/ $1 $2/g;
      }

      while ($st =~ s/\bBITNOT\s*\(([^\)]+)\)
                  /$zqqt_op{BITNOT}($1)/xsmg) {
         next;
      }
      $st;
   }
   {
      my $fwipt_rx = "";

      sub lf_zq_set_word($ )
      {
         my @lines = split(/\n/, $_[0]);
         foreach (@lines) {
            if (m/(\S+)\s+(\S.*)/) {
               my ($fr, $to) = ($1, $2);
               $to =~ s/^\"\"$//;
               $zqqt_word{$fr} = $to;
            } else {
               die "BAD line:\"$_\"";
            }
         }

         my %kw_fwip = ();

         foreach my $gg (qw(
               FUNC FUNC_END
               READONLY WRITEABLE WRITEONLY
               RETURN CALL DIE
               IF ELSIF ELSE IF_END
               FALSE TRUE
               WHILE WHILE_EXIT WHILE_END
               AWAIT AWAIT_EXIT AWAIT_END
               FOR FROM TO BY FOR_EXIT FOR_END
               AND OR XOR NOT
               ARRAY ARRAY_END REDIM ARRAYLAST
               ABS ABSL ATAN2 FLOOR CEIL EXP LN
               SIN COS TAN POW SQRT
               CONST
               PRINTSTR PRINTVAL
               LANGUAGE LANGUAGE_NOT LANGUAGE_END
               IMPORT IMPORT_MASTER
               MODE_INTEGER MODE_INTEGER_END
               DBL INT STR BOL NUL
               BLOCK_USE)) {
            if (!defined($kw_fwip{$gg})) {
               $fwipt_rx .= "|$gg";
            }
            $kw_fwip{$gg} .= "A";
         }
         foreach my $gg (keys %zqqt_word) {
            if (!defined($kw_fwip{$gg})) {
               $fwipt_rx .= "|$gg";
            }
            $kw_fwip{$gg} .= "W";
         }
         foreach my $gg (keys %zqqt_op) {
            if (!defined($kw_fwip{$gg})) {
               $fwipt_rx .= "|$gg";
            }
            $kw_fwip{$gg} .= "O";
         }
         $fwipt_rx =~ s/.//;  # rm first "|"
         $fwipt_rx = "($fwipt_rx)";
      }

      sub fwipt_check_line($ )
      {
         my $line = $_[0];
         if (!defined($lv_cm0) or length($lv_cm0) == 0) {
            Carp::confess("OOPPUU:$lv_cm0:$line\n");
         }

         if ($line !~ m/$lv_cm0.*($fwipt_rx)/
               and $line =~ m/\b($fwipt_rx)\b/) {
            Carp::confess(""
                  . "$0:CONTAINS \"$1\"    COMMENT=\"$lv_cm0\"\n"
                  . "$0:($fwipt_rx)\n"
                  . "$0:\"$line\"");
         }

         if ($line =~ m/^( +)/) {
            my $gg = length($1);
            if ($gg % $zqbql != 0) {
               Carp::confess("WRONG:$gg:\"$line\"");
            }
         }
      }
   }
}   # BLOCK_END   # zq

sub fwipt_lang_set($ )
{
   $lv_target_language = $_[0];
   my ($bq, $bql) = fwipt_bq_set("   ");
   if (fwipt_lang_is(LANG_FWIPP)) {
      lf_lang_fwip();
   } elsif (fwipt_lang_is(LANG_UNITS)) {
      lf_lang_units();
   } elsif (fwipt_lang_is(LANG_PERL)) {
      lf_lang_perl();
   } elsif (fwipt_lang_is(LANG_PYTHON)) {
      lf_lang_python();
   } elsif (fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
      lf_lang_c();
   } elsif (fwipt_lang_is(LANG_VB6)) {
      lf_lang_vb6();
   } elsif (fwipt_lang_is(LANG_VBDOTNET)) {
      lf_lang_vbdotnet();
   } elsif (fwipt_lang_is(LANG_BC)) {
      lf_lang_bc();
   } elsif (fwipt_lang_is(LANG_VARYLOG)) {
      lf_lang_varylog();
   } else {
      die "Unknown language string:$lv_target_language";
   }

   ($lv_cm0, $lv_cm4, $bq, $bql);
}

sub lf_lang_fwip ()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");

   lf_zq_set_zqqissdie(";", "DIE");
   lf_zq_set_op("MOD", "BITAND", "BITOR"
         , "BITXOR", "BITNOT"
         , "BITSHIFTL", "BITSHIFTR");

   lf_zq_set_zqq_tr( <<EOF);
IF        "IF "
IF_       :
ELSIF     "ELSIF "
ELSIF_    :
ELSE      ELSE:
IF_END    IF_END
WHILE     "WHILE "
WHILE_    :
WHILE_END WHILE_END
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        FOR_EXIT
FOR_END         FOR_END
WHILE_EXIT      WHILE_EXIT
WHILE_END       WHILE_END
AWAIT_EXIT      AWAIT_EXIT
AWAIT_END       AWAIT_END
FUNC            FUNC
FUNC_END        FUNC_END
CALL            CALL
BLOCK_USE       BLOCK_USE
BLOCK_DEF       BLOCK_DEF
BOL             BOL
DBL             DBL
INT             INT
STR             STR
NUL             NUL
RETURN          RETURN
TRUE            TRUE
FALSE           FALSE
AND             AND
OR              OR
NOT             NOT
READONLY        READONLY
WRITEABLE       WRITEABLE
WRITEONLY       WRITEONLY
==              ==
<>              <>
STRING_TAB      STRING_TAB
STRING_NL       STRING_NL
EOF
}

sub lf_lang_units ()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");

   lf_zq_set_op("!", "!", "!", "!", "!", "!", "!");

   lf_zq_set_word( <<EOF);
EOF
}

sub lf_lang_perl ()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");

   lf_zq_set_zqqissdie(";"
         , "\"die \\\"\""
         . " . fwipt_current_function_get() . \":\\\" . \$1;\"");
   lf_zq_set_op("%", "&", "|", "^", "~", "<<", ">>");

   lf_zq_set_zqq_tr( <<EOF);
IF        if (
IF_       ) {
ELSIF     } elsif (
ELSIF_    ) {
ELSE      } else {
IF_END    }
WHILE     while (
WHILE_    ) {
WHILE_END }
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        last
FOR_END         }
WHILE_EXIT      last
WHILE_END       }
AWAIT_EXIT      last
AWAIT_END       }
FUNC            sub
FUNC_END        }
CALL            ""
BLOCK_USE       $lv_cm0 local-use Perl
BLOCK_DEF       ""
BOL             my
DBL             my
INT             my
STR             my
NUL             ""
RETURN          return
TRUE            Kw::true
FALSE           Kw::false
AND             and
OR              or
NOT             not
READONLY        ""
WRITEABLE       ""
WRITEONLY       ""
==              ==
<>              !=
STRING_TAB      \"\\t\"
STRING_NL       \"\\n\"
EOF
}

sub lf_lang_python()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");

   lf_zq_set_zqqissdie(""
         , "\"sys.stderr.write(\\\"\""
         . " . fwipt_current_function_get() . \":\\\" + \$1)\\n"
         . "sys.exit(1)\"");
   lf_zq_set_op("lf_mod_py", "&", "|", "^", "~", "<<", ">>");

   lf_zq_set_zqq_tr( <<EOF);
IF        if (
IF_       ):
ELSIF     elif (
ELSIF_    ):
ELSE      else:
IF_END    ""
WHILE     while (
WHILE_    ):
WHILE_END ""
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        break
FOR_END         ""
WHILE_EXIT      break
WHILE_END       ""
AWAIT_EXIT      break
AWAIT_END       ""
FUNC            define
FUNC_END        ""
CALL            ""
BLOCK_USE       global
BLOCK_STR       BLOCK_STR
BLOCK_DEF       ""
BOL             ""
DBL             ""
INT             ""
STR             ""
NUL             ""
RETURN          return
TRUE            True
FALSE           False
AND             and
OR              or
NOT             not
READONLY        ""
WRITEABLE       ""
WRITEONLY       ""
==              ==
<>              !=
STRING_TAB      \"\\t\"
STRING_NL       \"\\n\"
EOF
}

sub lf_lang_vb6()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("\x27");

   lf_zq_set_zqqissdie(""
         , "\"Debug.Print(\\\"\""
         . " . fwipt_current_function_get() . \":\\\" & \$1)\\n"
         . "Stop\"");
   lf_zq_set_op("lf_mod_vb6", "And", "Or", "Xor", "Not"
         , "* 2 ^", "\\ 2 ^");

   lf_zq_set_zqq_tr( <<EOF);
IF        If (
IF_       ) Then
ELSIF     ElseIf (
ELSIF_    ) Then
ELSE      Else
IF_END    End If
WHILE     Do While (
WHILE_    )
WHILE_END Loop
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        Exit For
FOR_END         Next
WHILE_EXIT      Exit Do
WHILE_END       Loop
AWAIT_EXIT      Exit Do
AWAIT_END       Loop
FUNC            Public Function
FUNC_END        End Function
CALL            Call
BLOCK_USE       $lv_cm0 local-use Vb6
BLOCK_DEF       Private
BOL             Boolean
DBL             Double
INT             Long
STR             String
NUL             ""
RETURN          ""
TRUE            True
FALSE           False
AND             And
OR              Or
NOT             Not
READONLY        ""
WRITEABLE       ""
WRITEONLY       ""
==              =
<>              <>
%               Mod
STRING_TAB      vbTab
STRING_NL       vbNewLine
EOF
}

sub lf_lang_vbdotnet()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("\x27");

   lf_zq_set_zqqissdie(""
         , "\"Debug.Print(\\\"\""
         . " . fwipt_current_function_get() . \":\\\" & \$1)\\n"
         . "Stop\"");
   lf_zq_set_op("lf_mod_vbdotnet", "And", "Or", "Xor", "Not"
         , "* 2 ^", "\\ 2 ^");

   lf_zq_set_zqq_tr( <<EOF);
IF        If (
IF_       ) Then
ELSIF     ElseIf (
ELSIF_    ) Then
ELSE      Else
IF_END    End If
WHILE     Do While (
WHILE_    )
WHILE_END Loop
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        Exit For
FOR_END         Next
WHILE_EXIT      Exit Do
WHILE_END       Loop
AWAIT_EXIT      Exit Do
AWAIT_END       Loop
FUNC            Public Shared Function
FUNC_END        End Function
CALL            Call
BLOCK_USE       $lv_cm0 local-use Vbdotnet
BLOCK_DEF       Private
BOL             Boolean
DBL             Double
INT             Long
STR             String
NUL             ""
RETURN          ""
TRUE            True
FALSE           False
AND             And
OR              Or
NOT             Not
READONLY        ""
WRITEABLE       ""
WRITEONLY       ""
==              =
<>              <>
%               Mod
STRING_TAB      vbTab
STRING_NL       vbNewLine
EOF
}

sub lf_lang_c()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("//");

   lf_zq_set_zqqissdie(";"
         , "\"fprintf(stderr, \\\"\""
         . " . fwipt_current_function_get() . \":\\\"\$1);\\n"
         . "exit(1);\"");
   lf_zq_set_op("%", "&", "|", "^", "~", "<<", ">>");

   lf_zq_set_zqq_tr( <<EOF);
IF        if (
IF_       ) {
ELSIF     } else if (
ELSIF_    ) {
ELSE      } else {
IF_END    }
WHILE     while (
WHILE_    ) {
WHILE_END }
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        break
FOR_END         }
WHILE_EXIT      break
WHILE_END       }
AWAIT_EXIT      break
AWAIT_END       }
FUNC            ""
FUNC_END        }
CALL            (void)
BLOCK_USE       $lv_cm0 local-use C
BLOCK_DEF       static
BOL             long
DBL             double
INT             long
STR             char *
NUL             void
RETURN          return
TRUE            true
FALSE           false
AND             &&
OR              ||
NOT             !
READONLY        const
WRITEABLE       ""
WRITEONLY       ""
==              ==
<>              !=
STRING_TAB      \"\\t\"
STRING_NL       \"\\n\"
EOF
}

sub lf_lang_bc()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");

   lf_zq_set_zqqissdie(";", "\"halt;\"");
   lf_zq_set_op("lf_mod_bc", "bitwiseand", "bitwiseor"
         , "bitwisexor", "bitwisenot", "lf_shiftl", "lf_shiftr");

   lf_zq_set_zqq_tr( <<EOF);
IF        if (
IF_       ) {
ELSIF     } else if (
ELSIF_    ) {
ELSE      } else {
IF_END    }
WHILE     while (
WHILE_    ) {
WHILE_END }
EOF

   lf_zq_set_word( <<EOF);
FOR_EXIT        break
FOR_END         }
WHILE_EXIT      break
WHILE_END       }
AWAIT_EXIT      break
AWAIT_END       }
FUNC            define
FUNC_END        }
CALL            bcdummy =
BLOCK_USE       $lv_cm0 local-use Bc
BLOCK_DEF       ""
BOL             auto
DBL             auto
INT             auto
STR             auto
RETURN          return
TRUE            true
FALSE           false
AND             &&
OR              ||
NOT             !
READONLY        ""
WRITEABLE       ""
WRITEONLY       ""
==              ==
<>              !=
STRING_TAB      \"\\t\"
STRING_NL       \"\\n\"
EOF
}

sub lf_lang_varylog()
{
   ($lv_cm0, $lv_cm4) = Fwip_Comment::fwipc_set("#");
}

sub fwipt_initcode($ )
{
   my ($library_name) = @_;

   if (fwipt_lang_is(LANG_FWIPP)) {
      (<<EndOfInitCodeBlockFwip);
IMPORT_MASTER ${library_name};
EndOfInitCodeBlockFwip
   } elsif (fwipt_lang_is(LANG_UNITS)) {
      (<<EndOfInitCodeBlockUnits);
EndOfInitCodeBlockUnits
   } elsif (fwipt_lang_is(LANG_PERL)) {
      (<<EndOfInitCodeBlockPerl);
package ${library_name};
use Time::HiRes qw();
use POSIX       qw();
use vars qw(\@EXPORT \@EXPORT_OK \%EXPORT_TAGS);
use Exporter    qw(import);
\@EXPORT = ();
EndOfInitCodeBlockPerl
   } elsif (fwipt_lang_is(LANG_PYTHON)) {
      (<<EndOfInitCodeBlockPython);
import sys
import math
import time
EndOfInitCodeBlockPython
   } elsif (fwipt_lang_is(LANG_VB6)) {
      (<<EndOfInitCodeBlockVB6);
Attribute VB_Name = "${library_name}"
Option Explicit
#If VBA7 Then
   Private Declare PtrSafe Function timeGetTime _
         Lib "winmm.dll" () As Long
#Else
   Private Type System_Time_Type
      wYear         As Integer
      wMonth        As Integer
      wDayOfWeek    As Integer
      wDay          As Integer
      wHour         As Integer
      wMinute       As Integer
      wSecond       As Integer
      wMilliseconds As Integer
   End Type

   Private Type Time_Zone_Type
      Bias As Long
      StandardName(0 To 63) As Byte
      StandardDate As System_Time_Type
      StandardBias As Long
      DaylightName(0 To 63) As Byte
      DaylightDate As System_Time_Type
      DaylightBias As Long
   End Type

   Private Declare Function GetTimeZoneInformation Lib _
         "kernel32" (lpTimeZoneInformation _
               As Time_Zone_Type) As Long

   Private Declare Function timeGetTime _
         Lib "winmm.dll" () As Long
#EndIf
Private lv_time_zone_offset As Double
Private Const vbNL As String = "" & vbNewLine
EndOfInitCodeBlockVB6
   } elsif (fwipt_lang_is(LANG_VBDOTNET)) {
      my $nm = uc($library_name);
      (<<EndOfInitCodeBlockVBDOTNET);
Option Explicit On
Imports System.IO.Filestream
Public Class $nm
${zqbq}Private Const vbNL As String = "" & vbNewLine
EndOfInitCodeBlockVBDOTNET
   } elsif (fwipt_lang_is(LANG_C)) {
      (<<EndOfInitCodeBlockC);
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include "${library_name}.h"
EndOfInitCodeBlockC
   } elsif (fwipt_lang_is(LANG_H)) {
      (<<EndOfInitCodeBlockH);
#ifndef INCLUDED_${library_name}_h
#define INCLUDED_${library_name}_h
EndOfInitCodeBlockH
   } elsif (fwipt_lang_is(LANG_RPN)) {
      (<<EndOfInitCodeBlockRPN);
#ifndef INCLUDED_${library_name}_rpn
#define INCLUDED_${library_name}_rpn
EndOfInitCodeBlockRPN
   } elsif (fwipt_lang_is(LANG_BC)) {
      (<<EndOfInitCodeBlockBC);
true = 1;
false = 0;
EndOfInitCodeBlockBC
   } elsif (fwipt_lang_is(LANG_VARYLOG)) {
      ();
   }
}
sub fwipt_master_functions()
{
   my $master_functions;
   my $master_sub;
   my $master_proto = "";

   if (fwipt_lang_is(LANG_FWIPP)) {
      $master_sub = "FUNC";
      $master_functions = <<EndOfMasterFunctionsFwip;
EndOfMasterFunctionsFwip
   } elsif (fwipt_lang_is(LANG_UNITS)) {
      $master_sub = "";
      $master_functions = <<EndOfMasterFunctionsUnits;
EndOfMasterFunctionsUnits
   } elsif (fwipt_lang_is(LANG_PERL)) {
      $master_sub = "sub";
      $master_functions = <<EndOfMasterFunctionsPerl;
$master_sub true ()     { 1; }
$master_sub false ()    { 0; }
$master_sub floor(\$ )  { POSIX::floor(\$_[0]); }
$master_sub ceil(\$ )   { POSIX::ceil(\$_[0]); }
$master_sub floorl(\$ ) { int(POSIX::floor(\$_[0])); }
$master_sub ceill(\$ )  { int(POSIX::ceil(\$_[0])); }
$master_sub tan(\$ )    { sin(\$_[0]) / cos(\$_[0]); }
$master_sub pow(\$\$ )  { exp(\$_[1] * log(\$_[0])); }
$master_sub timee() { my \@aa = (Time::HiRes::gettimeofday());
   \$aa[0] + \$aa[1] / 1000000.0; }
EndOfMasterFunctionsPerl
      $master_proto = <<EndOfMasterProtoPerl;
sub floor(\$ );
sub ceil(\$ );
sub floorl(\$ );
sub ceill(\$ );
sub tan(\$ );
sub pow(\$\$ );
sub timee();
EndOfMasterProtoPerl
   } elsif (fwipt_lang_is(LANG_PYTHON)) {
      $master_sub = "def";
      $master_functions = <<EndOfMasterFunctionsPython;
$master_sub lf_mod_py(xx,yy):
   xx = int(xx)
   yy = int(yy)
   retvalu = xx % yy
   if retvalu < 0:
      retvalu += abs(yy)
   return(retvalu)
$master_sub atan2(xx, yy):   return(math.atan2(xx, yy))
$master_sub fmod(xx, yy):    return(math.fmod(xx, yy))
$master_sub timee():         return(time.time())
$master_sub abs(xx):         return(math.fabs(xx))
$master_sub floor(xx):       return(math.floor(xx))
$master_sub ceil(xx):        return(math.ceil(xx))
$master_sub floorl(xx):      return(int(math.floor(xx)))
$master_sub ceill(xx):       return(int(math.ceil(xx)))
$master_sub sqrt(xx):        return(math.sqrt(xx))
$master_sub exp(xx):         return(math.exp(xx))
$master_sub log(xx):         return(math.log(xx))
$master_sub pow(xx, yy):     return(math.exp(yy * math.log(xx)))
$master_sub sin(xx):         return(math.sin(xx))
$master_sub cos(xx):         return(math.cos(xx))
$master_sub tan(xx):         return(math.sin(xx) / math.cos(xx))
EndOfMasterFunctionsPython
   } elsif (fwipt_lang_is(LANG_VB6)) {
      $master_sub = "Public Function";
      $master_functions = <<EndOfMasterFunctionsVB6;
$master_sub timee() As Double
   Dim tms As Double
   Dim tzi As Time_Zone_Type
   Dim tmi_ret As Long
   If (lv_time_zone_offset == 0) then
      tmi_ret = GetTimeZoneInformation(tzi)
      If (tmi_ret = 1) Then
         lv_time_zone_offset = tzi.Bias + tzi.StandardBias
      Else
         lv_time_zone_offset = tzi.Bias + tzi.DaylightBias
      End If
      lv_time_zone_offset = lv_time_zone_offset * 60.0
   End If
   tms = timeGetTime()
   timee = (Now() - \#1/1/1970\#) * 86400.0 _
         + (tms Mod 1000) / 1000.0 + lv_time_zone_offset
End Function
$master_sub floor(ByVal xx As Double) As Double
   floor = Int(xx)
End Function
$master_sub ceil(ByVal xx As Double) As Double
   ceil = -Int(-xx)
End Function
$master_sub floorl(ByVal xx As Double) As Long
   floorl = CLng(Int(xx))
End Function
$master_sub ceill(ByVal xx As Double) As Long
   ceill = CLng(-Int(-xx))
End Function
$master_sub sqrt(ByVal xx As Double) As Double
   sqrt = Sqr(xx)
End Function
$master_sub fabs(ByVal xx As Double) As Double
   fabs = Abs(xx)
End Function
$master_sub pow(ByVal yy As Double _
         , ByVal xx As Double) As Double
   pow = Exp(xx * Log(yy))
End Function
$master_sub atan2(ByVal yy As Double _
         , ByVal xx As Double) As Double
   If 0.0 < xx Then
      atan2 = Atn(yy / xx)
   ElseIf xx < 0.0 Then
      If yy < 0.0 Then
         atan2 = Atn(yy / xx) - Kw.TAU / 2.0
      ElseIf 0.0 < yy Then
         atan2 = Atn(yy / xx) + Kw.TAU / 2.0
      Else
         atan2 = Kw.TAU / 2.0
      End If
   Else
      If yy < 0.0 Then
         atan2 = -Kw.TAU / 4.0
      ElseIf 0.0 < yy Then
         atan2 = Kw.TAU / 4.0
      Else
         atan2 = 0.0
      End If
   End If
End Function
$master_sub lf_mod_vb6(ByVal xx As Double _
         , ByVal yy As Double) As Double
   Dim axx As Double
   Dim ayy As Double
   Dim retvalu as Double

   axx = floor(abs(xx))
   ayy = floor(abs(yy))
   retvalu = axx Mod ayy
   If (xx < 0 And retvalu <> 0) Then
      retvalu = ayy - retvalu
   End If
   lf_mod_vb6 = retvalu
End Function
EndOfMasterFunctionsVB6
   } elsif (fwipt_lang_is(LANG_VBDOTNET)) {
      $master_sub = "Public Shared Function";
      $master_functions = <<EndOfMasterFunctionsVBDOTNET;
$master_sub timee() As Double
   timee = (Now() - \#1/1/1970\#).TotalSeconds * 86400.0
End Function
$master_sub floor(ByVal xx As Double) As Double
   floor = Math.Floor(xx)
End Function
$master_sub ceil(ByVal xx As Double) As Double
   ceil = Math.Ceiling(xx)
End Function
$master_sub floorl(ByVal xx As Double) As Long
   floorl = Math.Floor(xx)
End Function
$master_sub ceill(ByVal xx As Double) As Long
   ceill = Math.Ceiling(xx)
End Function
$master_sub fabs(ByVal xx As Double) As Double
   fabs = Math.Abs(xx)
End Function
$master_sub lf_mod_vbdotnet(ByVal xx As Double _
         , ByVal yy As Double) As Double
   Dim axx As Double
   Dim ayy As Double
   Dim retvalu as Double

   axx = Int(Math.Abs(xx))
   ayy = Int(Math.Abs(yy))
   retvalu = axx Mod ayy
   If (xx < 0 And retvalu <> 0) Then
      retvalu = ayy - retvalu
   End If
   lf_mod_vbdotnet = retvalu
End Function
EndOfMasterFunctionsVBDOTNET
   } elsif (fwipt_lang_is(LANG_C) or fwipt_lang_is(LANG_RPN)) {
      $master_sub = "long";
      $master_functions = <<EndOfMasterFunctionsC;
double timee(void) {
   struct timeval tv;
   gettimeofday(&tv, NULL);
   return(tv.tv_sec + tv.tv_usec / 1000000.0);
}
EndOfMasterFunctionsC
   } elsif (fwipt_lang_is(LANG_H)) {
      $master_sub = "long";
      $master_functions = <<EndOfMasterFunctionsH;
#ifdef __GNUC__ $lv_cm0 include stdbool.h
#   include <stdbool.h>
#else $lv_cm0 ifdef __GNUC__
#   ifndef __cplusplus
#      ifndef bool
#         define bool char
#      endif $lv_cm0 ifndef bool
#      ifndef true
#         define true ((bool)1)
#      endif $lv_cm0 ifndef true
#      ifndef false
#         define false ((bool)0)
#      endif $lv_cm0 ifndef false
#   endif $lv_cm0 ifndef __cplusplus
#endif $lv_cm0 ifdef __GNUC__
EndOfMasterFunctionsH
      $master_proto = <<EndOfMasterProtoH;
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <sys/time.h>
double timee(void);
EndOfMasterProtoH
   } elsif (fwipt_lang_is(LANG_BC)) {
      $master_sub = "define";
      $master_functions = <<EndOfMasterFunctionsBC;
#include <time.h>
$master_sub atan2(yy,xx) {
   auto retvalu;
   if (0.0 < xx) {
      retvalu = a(yy / xx);
   } else if (xx < 0) {
      if (yy < 0.0) {
         retvalu = a(yy / xx) - Kw.TAU / 2.0;
      } else if (0.0 < yy) {
         retvalu = a(yy / xx) + Kw.TAU / 2.0;
      } else {
         retvalu = Kw.TAU / 2.0;
      }
   } else {
      if (yy < 0.0) {
         retvalu = -Kw.TAU / 4.0;
      } else if (0.0 < yy) {
         retvalu = Kw.TAU / 4.0;
      } else {
         retvalu = 0.0;
      }
   }
   return(retvalu);
}
$master_sub floor(xx) {
   auto local_prev_scale,retvalu;
   local_prev_scale = scale;
   scale = 0;
   retvalu = xx / 1;
   if (xx < retvalu) {
      retvalu -= 1;
   }
   scale = local_prev_scale;
   return(retvalu);
}
$master_sub log(xx)     { return(l(xx)); }
$master_sub exp(xx)     { return(e(xx)); }
$master_sub pow(xx, yy) { return(e(yy * l(xx))); }
$master_sub cos(xx)     { return(c(xx)); }
$master_sub sin(xx)     { return(s(xx)); }
$master_sub tan(xx)     { return(sin(xx) / cos(xx)); }
$master_sub ceil(xx)    { return(-floor(-xx)); }
$master_sub ceill(xx)   { return(ceil(xx)); }
$master_sub floorl(xx)  { return(floor(xx)); }
$master_sub lf_shiftl(xx,nn) {
   return(xx * (2 ^ nn));
}
$master_sub lf_shiftr(xx,nn) {
   auto local_prev_scale,retvalu;
   local_prev_scale = scale;
   scale = 0;
   retvalu = xx / (2 ^ nn);
   scale = local_prev_scale;
   return(retvalu);
}
$master_sub abs(xx) {
   auto retvalu;
   if (xx < 0.0) {
      retvalu = -xx;
   } else {
      retvalu = xx;
   }
   return (retvalu);
}
$master_sub lf_mod_bc(xx,yy) {
   auto axx,ayy,retvalu,local_prev_scale;
   local_prev_scale = scale;
   scale = 0;
   axx = abs(xx) / 1;
   ayy = abs(yy) / 1;
   retvalu = axx % ayy;
   if (xx < 0) {
      retvalu = ayy - retvalu;
   }
   scale = local_prev_scale;
   return(retvalu);
}
EndOfMasterFunctionsBC
   } else {
      $master_sub = "";
      $master_functions = "";
   }
   $master_functions =~ s/   /${zqbq}/g;
   ($master_sub, $master_functions, $master_proto);
}

sub lf_forsplit($ )
{
   my %goo = (FOR => 0, FROM => 0, TO => 0
         , BY => 0);
   $_[0] =~ m/\b(FOR\s+\S+\s+\S.*\S)\s*(:)/;
   my ($rest) = ($1);
   my %ff = (FROM => 0, TO => "INTMAX", BY => 1);
   my @tok = (split(/(\b(?:FOR|FROM|TO|BY)\b)/
         , $rest));
   foreach (@tok) {
      s/^\s+//;
      s/\s+$//;
   }
   for (my $iii = 0; $iii + 1 <= $#tok; $iii++) {
      if (defined($goo{$tok[$iii]})) {
         $ff{$tok[$iii]} = "" . $tok[$iii + 1];
      }
   }
   foreach my $ky (keys %ff) {
      $ff{$ky} =~ s/\bSUB\s*/-/g;
   }
   (%ff);
}

sub fwipt_loopy($ )
{
   my $wtd = "";
   my $fordest;
   my $for_rx = "\\bFOR\\s+(\\S+)\\s*(\\S.*?\\S)\\s*:";
   my $await_rx = "\\bAWAIT\\b\\s*(\\S.*?)\\s*:";
   $_ = $_[0];
   if (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      if (m/$await_rx/) {
         $wtd = "for (;;) {";
      } elsif (m/$for_rx/) {
         my %ff = (lf_forsplit($_));
         $ff{BY} =~ s/(-) ([0-9])/$1$2/g;
         if ($ff{BY} + 0 <= 0) {
            $fordest = "for ($ff{FOR} = $ff{FROM};"
                  . " $ff{TO} <= $ff{FOR};"
                  . " $ff{FOR} += $ff{BY}) {";
         } else {
            $fordest = "for ($ff{FOR} = $ff{FROM};"
                  . " $ff{FOR} <= $ff{TO};"
                  . " $ff{FOR} += $ff{BY}) {";
         }
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H
               , LANG_RPN, LANG_BC)) {
      if (m/$await_rx/) {
         $wtd = "for (;;) {";
      } elsif (m/$for_rx/) {
         my %ff = (lf_forsplit($_));
         $ff{BY} =~ s/(-) ([0-9])/$1$2/g;
         if ($ff{BY} + 0 <= 0) {
            $fordest = "for ($ff{FOR} = $ff{FROM};"
                  . " $ff{TO} <= $ff{FOR};"
                  . " $ff{FOR} += $ff{BY}) {";
         } else {
            $fordest = "for ($ff{FOR} = $ff{FROM};"
                  . " $ff{FOR} <= $ff{TO};"
                  . " $ff{FOR} += $ff{BY}) {";
         }
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
      if (m/$await_rx/) {
         $wtd = "while True:";
      } elsif (m/$for_rx/) {
         my %ff = (lf_forsplit($_));
         $fordest = "for $ff{FOR} in range($ff{FROM}"
                  . ", $ff{TO} + $ff{BY}, $ff{BY}):";
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6
               , LANG_VBDOTNET)) {
      if (m/$await_rx/) {
         $wtd = "Do While (True)";
      } elsif (m/$for_rx/) {
         my %ff = (lf_forsplit($_));
         $fordest = "For $ff{FOR} = $ff{FROM} To $ff{TO}";
         if ($ff{BY} ne "1") {
            $fordest .= " Step $ff{BY}";
         }
      }
   }

   if (defined($fordest)) {
      s/$for_rx/$fordest/;
      fwipt_ls_inc($_);
      lf_vbx_push("FOR");
   } elsif ($wtd =~ m/./) {
      s/$await_rx/$wtd/x;
      lf_do_await_loop($1);
   }
   $_ = lf_if_loop($_);
   $_ = lf_math_functions($_);
   $_ = fwipt_keyword_replace($_);
   $_;
}

1;
