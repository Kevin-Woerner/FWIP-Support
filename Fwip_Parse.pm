package Fwip_Parse;
#    Copyright (C) 2017-2020 by Kevin D. Woerner
# 2020-05-29 kdw  major simplification
# 2020-05-26 kdw  simplified rx
# 2020-05-20 kdw  dont remove module names from consts
# 2020-05-13 kdw  lang comments trivially changed
# 2020-05-12 kdw  local-func keyword
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-04-23 kdw  const format change
# 2020-04-20 kdw  func decl rx changed; func renam
# 2020-04-17 kdw  comment changed
# 2020-04-10 kdw  M[O]DE.* cleanup
# 2020-04-09 kdw  MO[D]E syntax change
# 2020-04-08 kdw  preprocess sigil change
# 2020-04-02 kdw  T[A]N builtin
# 2020-03-31 kdw  rework
# 2020-03-23 kdw  simplified; made more finicky
# 2020-03-22 kdw  rxo_ funcs
# 2020-03-11 kdw  verbose count work
# 2020-03-07 kdw  verbose work
# 2020-03-06 kdw  L[A]NG.* names
# 2020-03-05 kdw  keywords (TRU|FALS)[E]VAL changed
# 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
# 2020-02-21 kdw  tweak
# 2020-02-18 kdw  consolidated rxs for various tokens
# 2019-12-09 kdw  exporter rmed
# 2019-11-17 kdw  extern const rx: allow "E" problem
# 2019-09-22 kdw  extern const rx problem
# 2019-09-10 kdw  LA[N]GUAGE NOT to LA[N]GUAGE_NOT
# 2019-08-26 kdw  PRI[N]TS -> PR[I]NTSTR
# 2019-08-18 kdw  B[O]OL -> B[O]L
# 2019-08-17 kdw  L[O]G -> L[N] transition
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-06-28 kdw  comment changed
# 2019-06-27 kdw  lots of little things
# 2019-06-07 kdw  rmed leading " " on output
# 2019-05-29 kdw  comment changed
# 2019-05-24 kdw  local replaced private
# 2019-05-01 kdw  consts explicit module name
# 2019-04-22 kdw  F[U]NC keyword
# 2019-04-10 kdw  error message changed
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-03-28 kdw  more keywords
# 2019-03-08 kdw  is[e]qual -> is[e]q, et al.
# 2019-02-28 kdw  replace keyword rmed
# 2019-01-23 kdw  add-sub-div-mul keywords
# 2019-01-14 kdw  corrected loop problems
# 2018-12-10 kdw  module specific refs
# 2018-12-07 kdw  explicit imported funcitons
# 2018-11-17 kdw  rmed 'use diagnostics'
# 2018-05-18 kdw  LAN?GUAGE syntax change
# 2018-05-16 kdw  AR?RAY work
# 2018-05-15 kdw  reformat
# 2018-05-14 kdw  BLOCK syntax
# 2018-04-24 kdw  die on preprocessor statements
# 2018-04-01 kdw  LA[N]G?UAGE_EN?D
# 2018-03-20 kdw  replaced index w/ @replace
# 2018-03-16 kdw  format of constant & index change
# 2018-03-12 kdw  array end rmed
# 2018-03-05 kdw  export functions
# 2018-02-17 kdw  preprocess rmed
# 2018-02-16 kdw  preprocess separated
# 2018-02-14 kdw  IN[D]EX stuff
# 2018-02-13 kdw  ..EXP[A]ND.* stuff
# 2018-01-09 kdw  no implicit imported functions
# 2018-01-09 kdw  adjacent vars not allowed
# 2017-11-26 kdw  FR[O]M and B[Y] keywords
# 2017-11-23 kdw  rm digits from var names
# 2017-11-22 kdw  secant var renam
# 2017-11-21 kdw  allow spaces in numbers; FROM
# 2017-11-02 kdw  @@..( rework
# 2017-10-24 kdw  number underscore
# 2017-10-23 kdw  AR[R]AY syntax
# 2017-10-21 kdw  @ -> @@
# 2017-10-20 kdw  syntax of CO[M]MENT
# 2017-10-11 kdw  cop[y]right stuff
# 2017-08-31 kdw  \!\!\!LA[N]G?UAGE
# 2017-08-30 kdw  hex/bin/oct numbers
# 2017-08-22 kdw  INS[E]RT_F[I]LE syntax changed
# 2017-07-04 kdw  unknown token processing
# 2017-07-03 kdw  join lines before parsing
# 2017-06-23 kdw  REPL?ACE redo
# 2017-06-21 kdw  COM?MENT work
# 2017-05-31 kdw  do not export fwip-comment functions
# 2017-05-11 kdw  make 'package' line 1st; rm shebang line
# 2017-04-26 kdw  \?+CO[M]MENT.*
# 2017-04-25 kdw  error messages clarified
# 2017-04-20 kdw  func -> function
# 2017-04-19 kdw  function declarations changed
# 2017-04-18 kdw  skip comment blocks
# 2017-04-13 kdw  sec var name
# 2017-04-12 kdw  allow _ to start names
# 2017-04-03 kdw  functions renamd
# 2017-03-28 kdw  major refactor
# 2017-03-24 kdw  cmf?wip0; var renam
# 2017-03-22 kdw  reorg of code
# 2017-03-21 kdw  reorg of code
# 2017-03-19 kdw  changed output
# 2017-03-13 kdw  do not die on unknown token
# 2017-03-12 kdw  end space; var?ylog stuff
# 2017-03-10 kdw  lots o'refactor
# 2017-03-09 kdw  created
use strict;

sub rxo_functionname() { "\\b[a-zA-Z]\\w+\\b"; }
sub rxo_variablename() { "\\b[a-z]+[a-z_]*\\b";}
sub rxo_arrayname()    { "\\b[a-z]+[a-z_]*_arr(?:_pc?)?\\b";}
sub rxo_constantname() { "\\b(?:[a-zA-Z]\\w+|E)\\b";}
sub rxo_modulename()   { "\\b[a-zA-Z_]\\w+\\b";}
sub rx_modulename()
{
   "(?:" . rxo_modulename() . "\\s*\\.\\s*)";
}
sub rx_variablename()
{
   rxo_variablename() . "(?!\\s*[\\(\\[])";
}
sub rx_arrayname()
{
   rxo_arrayname() . "(?=\\s*\\[)";
}
sub rx_functionname()
{
   rx_modulename() . "?" . rxo_functionname() . "(?=\\s*\\()";
}
sub rx_constantname()
{
   rx_modulename() . "?" . rxo_constantname();
}
sub rx_variabledecl()
{
   "\\b(?:DBL|INT|BOL|NUL|STR)\\b";
}
sub rx_function_decl()
{
   "\\b(?:LOCAL_FUNC|FUNC)"
      . "\\s+(" . rx_variabledecl() . ")"
      . "\\s+(" . rx_functionname() .")"
      . "\\s*\\((.*)\\)\\s*:(.*)";
}

1;
