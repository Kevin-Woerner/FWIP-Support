#! /usr/bin/perl -W
#    Copyright (C) 2015-2021 by Kevin D. Woerner
# FWIP (Functions Written In Pseudocode) Processor
# 2021-05-02 kdw  VB6: print[a-z]+ -> debug.print
# 2021-04-27 kdw  VB: allows <= 12 line continuations
# 2021-04-23 kdw  macro renam
# 2021-04-14 kdw  indent for line break
# 2021-04-13 kdw  RPN: f_rpn_c_ enum added
# 2021-04-07 kdw  RPN: output formatting
# 2021-04-03 kdw  VB: more work
# 2021-04-02 kdw  VB: func return work
# 2021-03-18 kdw  BC:expanded def of consts
# 2021-03-16 kdw  const name changed
# 2021-03-15 kdw  C,H,RPN: const work (failed)
# 2021-03-11 kdw  C,H,RPN: failed block def work
# 2021-03-09 kdw  cx work
# 2021-02-22 kdw  backslash work
# 2021-02-19 kdw  master func work
# 2021-02-15 kdw  string work
# 2021-02-13 kdw  experiment
# 2020-09-08 kdw  VBDOTNET: "private dim" to "private shared"
# 2020-08-29 kdw  _a[r]r changed to _mt[r]x
# 2020-08-25 kdw  var renam
# 2020-08-17 kdw  macro syntax changed
# 2020-07-29 kdw  block-def work
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-07-20 kdw  arraylast work
# 2020-07-14 kdw  rmed unused code
# 2020-07-09 kdw  mode-extended rmd
# 2020-06-30 kdw  BC: const work
# 2020-06-28 kdw  BC: cx work
# 2020-06-22 kdw  handle single word statements (more) correctly
# 2020-06-19 kdw  comment on output rmed
# 2020-06-18 kdw  h: const decls mved
# 2020-06-16 kdw  rmed unused code; outa single line
# 2020-06-12 kdw  VBDOTNET: Dim work
# 2020-06-05 kdw  VB6 higher resolution time
# 2020-06-03 kdw  writeonly keyword
# 2020-05-30 kdw  CONST syntax change
# 2020-05-29 kdw  more consilidation rework
# 2020-05-27 kdw  rework
# 2020-05-25 kdw  consolidation
# 2020-05-21 kdw  simplified
# 2020-05-20 kdw  vb* doesnt like self -ref modules
# 2020-05-15 kdw  local const work
# 2020-05-13 kdw  lang comments changed
# 2020-05-12 kdw  vb6 work
# 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
# 2020-05-04 kdw  BC: rm global bc comments
# 2020-05-01 kdw  made less persnikety
# 2020-04-23 kdw  const format change
# 2020-04-20 kdw  func decl rx changed
# 2020-04-10 kdw  M[O]DE.* cleanup
# 2020-04-09 kdw  MO[D]E syntax change
# 2020-04-08 kdw  preprocess sigil change
# 2020-04-02 kdw  t[a]n builtin
# 2020-03-23 kdw  regex work
# 2020-03-22 kdw  c lang array work
# 2020-03-19 kdw  rpn work
# 2020-03-10 kdw  math functions
# 2020-03-08 kdw  PR[I]NTVAL change
# 2020-03-06 kdw  rmed -r option
# 2020-03-05 kdw  rmed several key words
# 2020-03-02 kdw  empty lines  joined improperly
# 2020-03-01 kdw  long line debugging
# 2020-02-26 kdw  comment change
# 2020-02-25 kdw  comment cleanup
# 2020-02-21 kdw  spacing tweak
# 2020-02-18 kdw  consolidated rxs for various tokens
# 2020-02-07 kdw  VB6: byref added
# 2020-01-31 kdw  debugging malformed funcs
# 2020-01-28 kdw  work on funcs w/ array args
# 2020-01-26 kdw  RPN: added F_R[P]N_L_LL2 added
# 2020-01-24 kdw  BC: added "*" to call by variable arrays
# 2019-12-09 kdw  exporter work
# 2019-12-06 kdw  no "_" in numbers
# 2019-11-27 kdw  F_R[P]N_[DL]_[DL]D+ redo
# 2019-11-06 kdw  VB.*: day stuff
# 2019-11-01 kdw  RPN: log2 and fmod
# 2019-10-23 kdw  UNITS: log to ln
# 2019-10-05 kdw  tweak
# 2019-09-23 kdw  rmed self-package references
# 2019-09-17 kdw  rmed c[n]v_db[l]2i32
# 2019-09-10 kdw  LANGUAGE NOT to LANGUAGE_NOT
# 2019-09-06 kdw  PERL: replace "$)" with "$ )"
# 2019-08-26 kdw  trig func desc compression
# 2019-08-17 kdw  L[O]G -> L[N] transition
# 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
# 2019-08-13 kdw  PERL: array ref arg sigils
# 2019-08-12 kdw  spaces before ","
# 2019-08-11 kdw  comment changed
# 2019-08-07 kdw  comment changed
# 2019-08-06 kdw  output: s/= - /= -/
# 2019-08-01 kdw  cpnst/index rx change
# 2019-07-22 kdw  FU[N]C regex cleanup
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-07-04 kdw  mved replace/index code
# 2019-07-01 kdw  trivial change in desc code
# 2019-06-26 kdw  PYTHON: arrays declared
# 2019-06-11 kdw  null refs rmed
# 2019-05-31 kdw  master stuff; desc work
# 2019-05-29 kdw  comment changed
# 2019-05-24 kdw  local replaced private
# 2019-05-22 kdw  FUN[C]TION keyword -> FU[N]C
# 2019-05-20 kdw  -r redef; hash renam
# 2019-05-14 kdw  short description rework
# 2019-05-07 kdw  descipt rm unneeded () from regex output II
# 2019-05-03 kdw  descipt rm unneeded () from regex output
# 2019-05-02 kdw  descipt func name change
# 2019-04-22 kdw  F[U]NC keyword
# 2019-04-18 kdw  format of *.rpn output
# 2019-04-17 kdw  *_DO, THEN work boundaries
# 2019-04-16 kdw  loop_DO keywords
# 2019-04-04 kdw  .*_L[O]OP keywords deprecated
# 2019-03-21 kdw  VBDOTNET: added comment to "end class"
# 2019-03-15 kdw  BC: const work
# 2019-03-10 kdw  BC: index work
# 2019-03-08 kdw  is[e]qual -> is[e]q, et al.
# 2019-03-04 kdw  loop-limit work
# 2019-03-01 kdw  writeable keyword
# 2019-02-28 kdw  REP[L]ACE/DE[F]INE work
# 2019-02-04 kdw  C: include std[b]ool
# 2019-02-04 kdw  PERL: prototype work
# 2019-01-31 kdw  assign snafu
# 2019-01-23 kdw  add-sub-div-mul keywords
# 2019-01-15 kdw  long lnes
# 2019-01-13 kdw  BC: space before line cont char
# 2019-01-11 kdw  vb6 & vbdotnet const funcs
# 2019-01-03 kdw  fwipt_ls_(inc|dec) now takes args
# 2018-12-28 kdw  BC:comments left alone
# 2018-12-21 kdw  PYTHON: import lines debug output rmed
# 2018-12-20 kdw  PYTHON: import lines
# 2018-12-18 kdw  kwelements separated
# 2018-12-17 kdw  dont output comments on empty sections
# 2018-12-16 kdw  no net change
# 2018-12-10 kdw  module specific refs
# 2018-12-07 kdw  explicit imported funcs
# 2018-12-06 kdw  commentized changed
# 2018-12-03 kdw  arraylast rework
# 2018-11-29 kdw  VB6: no () in constants
# 2018-11-28 kdw  DOTNET: rmed extra space after shared
# 2018-11-03 kdw  *.h & *.rpn stuff
# 2018-10-20 kdw  added shared keyword in *.vb
# 2018-10-10 kdw  shared funcs for dotnet
# 2018-10-08 kdw  vbdotnet stuff
# 2018-10-07 kdw  vb dot net work
# 2018-09-16 kdw  jionrx stuff
# 2018-09-12 kdw  jionrx trivialy untrivialize
# 2018-09-11 kdw  jionrx trivialized
# 2018-09-08 kdw  BC: added ";" on const lines
# 2018-07-26 kdw  BC: tweak
# 2018-07-24 kdw  BC: + sign bfr \ number
# 2018-07-22 kdw  no net change
# 2018-07-19 kdw  comments; array reformat
# 2018-06-27 kdw  const work
# 2018-06-08 kdw  PYTHON: "pass" work
# 2018-05-22 kdw  PERL:rmed extra ";" on output
# 2018-05-21 kdw  consolidate translate funcs
# 2018-05-20 kdw  -r option
# 2018-05-18 kdw  LAN?GUAGE syntax change
# 2018-05-17 kdw  ARR?AY.* and HOR[N]ER syntax
# 2018-05-16 kdw  AR?RAY syntax
# 2018-05-14 kdw  BLOCK syntax
# 2018-05-13 kdw  MO?DE.* syntax change
# 2018-05-06 kdw  commenitzed change
# 2018-05-01 kdw  PYTHON: force int funcs to return int
# 2018-04-25 kdw  line wrapping fixes
# 2018-04-23 kdw  description work
# 2018-04-19 kdw  make const decls prettier
# 2018-04-03 kdw  cont lines; typo; var change
# 2018-04-02 kdw  Pro?totype, et al.
# 2018-04-01 kdw  LA[N]G?UAGE_EN?D
# 2018-03-27 kdw  continuation lines
# 2018-03-26 kdw  PYTHON/VB: ";" rmoval
# 2018-03-20 kdw  replaced index w/ @replace
# 2018-03-19 kdw  comment format
# 2018-03-17 kdw  cmadd
# 2018-03-16 kdw  format of constant & index change
# 2018-03-14 kdw  VB:privatize lc_ vars
# 2018-03-12 kdw  function comments
# 2018-03-11 kdw  UNITS: atan rx work
# 2018-03-09 kdw  VB:desc long lines
# 2018-03-02 kdw  exported funcs from modules
# 2018-02-17 kdw  vbx func renam
# 2018-02-15 kdw  more IN[D]EX stuff
# 2018-02-14 kdw  IN[D]EX stuff
# 2018-02-13 kdw  pre-processor stuf rmed
# 2018-02-09 kdw  UNITS: format output
# 2018-02-01 kdw  BC: leading '+' on numbers
# 2018-01-08 kdw  description work
# 2017-11-27 kdw  description work
# 2017-11-26 kdw  FR[O]M/B[Y] keywords
# 2017-11-23 kdw  rm digits from var names
# 2017-11-21 kdw  FR[O]M
# 2017-11-19 kdw  paren work
# 2017-11-07 kdw  package name, et al.
# 2017-11-06 kdw  function descriptions rework
# 2017-11-04 kdw  support for const abbrevs
# 2017-11-03 kdw  un[i]ts long lines
# 2017-10-24 kdw  number underscore
# 2017-10-23 kdw  CO[M]MENT syntax
# 2017-10-21 kdw  LA[N]GUAGE syntax
# 2017-10-20 kdw  syntax of COM[M]ENT changed
# 2017-10-06 kdw  VB: public consts now recognized
# 2017-10-01 kdw  single digit consts
# 2017-09-22 kdw  functions in TRANSLATE name changed
# 2017-09-14 kdw  UNITS support fail
# 2017-09-07 kdw  more UNITS support
# 2017-09-06 kdw  UNITS support
# 2017-08-31 kdw  \!\!\!LA[N]G?UAGE
# 2017-08-30 kdw  added some support of hex/oct/bin numbers
# 2017-08-20 kdw  rmed/renamd .*_P[E]R_.* vars
# 2017-08-18 kdw  PERL: constant work
# 2017-07-23 kdw  Python3: xrange -> range
# 2017-07-12 kdw  do not die on long lines
# 2017-07-06 kdw  LA?NG_FW?IP added
# 2017-06-23 kdw  REPL?ACE redo
# 2017-06-21 kdw  LA?NG.* AND MASTER.* change
# 2017-06-13 kdw  allow \?[\?]\? in comments
# 2017-06-08 kdw  blockocode rmed; PRINTVAL; defined in perl
# 2017-06-05 kdw  PRI?NTV?AL semicolons treated properly
# 2017-06-03 kdw  PRI?NT.* changed
# 2017-05-31 kdw  do not export fwip-comment functions
# 2017-05-03 kdw  PROT?OTYPE format changed
# 2017-05-01 kdw  RPN master function prototypes
# 2017-04-30 kdw  func -> function
# 2017-04-26 kdw  \?+COMMENT.*
# 2017-04-25 kdw  import syntax change
# 2017-04-21 kdw  var / func renam
# 2017-04-19 kdw  function declarations changed
# 2017-04-18 kdw  skip comment blocks
# 2017-04-17 kdw  rm unsed vars
# 2017-04-13 kdw  rm unsed vars
# 2017-04-12 kdw  allow _ to start var names
# 2017-04-06 kdw  Python3 support
# 2017-04-04 kdw  save varylog comments iff LA[N]GVARYLOG
# 2017-04-03 kdw  fewer auto-imported functions
# 2017-03-30 kdw  more reorg
# 2017-03-28 kdw  reorg of code
# 2017-03-27 kdw  clean up "\s+,"; varylog work
# 2017-03-25 kdw  rm unused var
# 2017-03-23 kdw  use package name for var?ylog
# 2017-03-21 kdw  reorg of code
# 2017-03-20 kdw  BC auto comments
# 2017-03-19 kdw  rm useless comments in output
# 2017-03-17 kdw  BC: auto lines
# 2017-03-16 kdw  BC: auto lines
# 2017-03-14 kdw  line wrap
# 2017-03-13 kdw  VB function array declarations fixed
# 2017-03-12 kdw  new way of producing output
# 2017-03-11 kdw  VB function fix
# 2017-03-10 kdw  var?ylog stuff
# 2017-03-09 kdw  \?[\?]* stuff
# 2017-03-07 kdw  CON?STANT format changed
# 2017-03-06 kdw  sigils rmed
# 2017-03-01 kdw  context; func renam
# 2017-02-28 kdw  REQ?UIRE function ()
# 2017-02-27 kdw  PA?SS deprecated
# 2017-02-26 kdw  VARYLOG: refactor
# 2017-02-25 kdw  VARYLOG: end comments fixed
# 2017-02-24 kdw  REP[L]ACE rework, et al
# 2017-02-20 kdw  SE?CANT code indentation
# 2017-02-14 kdw  FWIP loop refactor
# 2017-02-13 kdw  IMP?ORT changed
# 2017-02-12 kdw  FWIP language change
# 2017-02-10 kdw  REQ?UIRES cleanup
# 2017-02-09 kdw  SE[C]ANT cleanup
# 2017-02-08 kdw  SE[C]ANT syntax
# 2017-02-07 kdw  comment cleanup
# 2017-02-06 kdw  SE[C]ANT  syntax
# 2017-02-03 kdw  SE[C]ANTS?OLVE
# 2017-02-02 kdw  insert file change
# 2017-01-31 kdw  less verbose
# 2017-01-23 kdw  BC: convert "e+?" to "E" in exponents
# 2017-01-17 kdw  BC: default scale = 50, not 51
# 2017-01-11 kdw  rmed spurious comment; varylog stuff
# 2017-01-10 kdw  changelog & fwipp
# 2017-01-09 kdw  commentize rework, et al
# 2017-01-08 kdw  read_file rework
# 2017-01-06 kdw  \?[\?]LAN[G]UAGE_[I]S.* change
# 2017-01-03 kdw  description work
# 2016-12-31 kdw  C: cx\w+ rework
# 2016-12-30 kdw  VB: ** -> ^
# 2016-12-28 kdw  BC: no UC func names
# 2016-12-27 kdw  output constants, and then master funcs
# 2016-12-25 kdw  rev -> t
# 2016-12-23 kdw  functions
# 2016-12-22 kdw  zq* stuff
# 2016-12-20 kdw  \?[\?] rework
# 2016-12-19 kdw  zq* stuff
# 2016-12-13 kdw  typo in function_description
# 2016-12-08 kdw  if_loop work
# 2016-12-07 kdw  combining of explicit constants
# 2016-12-06 kdw  ifthen
# 2016-12-05 kdw  max line length upped to 65; picklation
# 2016-12-04 kdw  spacing debugging
# 2016-12-03 kdw  spacing debugging
# 2016-12-02 kdw  BC: debugging
# 2016-11-30 kdw  C: constants refactor
# 2016-11-28 kdw  name change
# 2016-11-27 kdw  wrap around long lines
# 2016-11-26 kdw  lead space refactor
# 2016-11-25 kdw  constant renam
# 2016-11-24 kdw  syntax error in parsing LAN?GUAGE_IF?NOT
# 2016-11-23 kdw  CO?NST -? CO?NST?ANT
# 2016-11-22 kdw  PRI?NTLN -> PRI?NTLINE
# 2016-11-21 kdw  language change; fewer parens on output
# 2016-11-20 kdw  language change
# 2016-11-18 kdw  _?_PO?D_?_; simplified commentize
# 2016-11-17 kdw  compression of description
# 2016-11-16 kdw  comments changed
# 2016-11-15 kdw  MOD/BIT* syntax change
# 2016-11-14 kdw  bt
# 2016-11-09 kdw  FO?REV?ER loops deprecated
# 2016-11-08 kdw  AW?AIT.*CO?UNT syntax
# 2016-11-07 kdw  _?_LA[N]G* syntax change
# 2016-11-06 kdw  parser 1th rmes comments
# 2016-11-04 kdw  debugging
# 2016-11-03 kdw  debugging
# 2016-11-02 kdw  BC debugging
# 2016-11-01 kdw  AW?AIT loops
# 2016-10-31 kdw  LA?ST keyword rmed; AW?AIT stuff
# 2016-10-30 kdw  UN?TIL loop work
# 2016-10-29 kdw  UNT?IL loops
# 2016-10-27 kdw  preserve whitespace before comments
# 2016-10-14 kdw  oops -- bad change
# 2016-10-13 kdw  C output format
# 2016-10-06 kdw  command line options, et al.
# 2016-09-30 kdw  comment change
# 2016-09-25 kdw  case insensitive sort in desciption
# 2016-09-19 kdw  _[_]IN?SERT[_]_ redef
# 2016-09-18 kdw  C:bool defd
# 2016-09-15 kdw  _[_]IMP?ORT_[_] redef
# 2016-09-14 kdw  lang change
# 2016-09-02 kdw  vk?kcp changed; added --py, --pl, --bas
# 2016-09-01 kdw  continuation lines
# 2016-08-26 kdw  rmed unneeded msgs to S?TDE?RR
# 2016-08-24 kdw  failed refactor
# 2016-08-17 kdw  LA[N]GCHA?NGELOG
# 2016-08-16 kdw  LA[N]G(BC|H)
# 2016-08-15 kdw  BC tweak
# 2016-08-12 kdw  constants played with
# 2016-08-11 kdw  -v command line option
# 2016-08-05 kdw  BC: don't change comments wrt constants
# 2016-08-04 kdw  debugging
# 2016-07-29 kdw  delimit master functions
# 2016-07-27 kdw  VB6: timee
# 2016-07-22 kdw  third arg to commentize
# 2016-07-21 kdw  VB6 vs 64-bit VB7
# 2016-07-18 kdw  tweak
# 2016-07-15 kdw  failed experiment
# 2016-07-11 kdw  master functions refactor
# 2016-06-20 kdw  cm4 redefd
# 2016-06-12 kdw  tweak
# 2016-06-10 kdw  tweak
# 2016-06-09 kdw  VB6: function/sub output format
# 2016-06-08 kdw  =?k?d?w?= moved to vk?kc?p
# 2016-05-31 kdw  =?k?d?w= lines changed
# 2016-05-26 kdw  fill column changed; long lines
# 2016-05-25 kdw  fill column changed; long lines
# 2016-05-23 kdw  minor output tweak
# 2016-05-20 kdw  comment change
# 2016-05-18 kdw  comment change
# 2016-05-16 kdw  :k?dw: lines changed ; vbNL redef
# 2016-05-12 kdw  VB6: changed command line option name
# 2016-05-04 kdw  :k?dw: lines changed
# 2016-04-27 kdw  PRINT[SLDI] recognized
# 2016-04-11 kdw  variable name change
# 2016-04-04 kdw  BC & c: sqrt problem
# 2016-03-12 kdw  BC: scale increased by 1
# 2016-03-10 kdw  compile code from stdin; -o option
# 2016-02-17 kdw  comment changed
# 2016-02-05 kdw  :k* lines refactor
# 2016-01-28 kdw  comment change
# 2016-01-26 kdw  desc?ription -> function_descr?iption
# 2016-01-22 kdw  shortened "FR?OM FI?LE" line; et al.
# 2016-01-20 kdw  C: rmed extra comment line
# 2016-01-19 kdw  RE tweak
# 2016-01-18 kdw  comment handling
# 2016-01-15 kdw  :k?d?w: lines changed
# 2016-01-07 kdw  define v?bN?L in VB6
# 2016-01-04 kdw  OSX stuff
# 2015-12-30 kdw  refactor
# 2015-12-29 kdw  max_line_length, et al.
# 2015-12-28 kdw  minor touch
# 2015-12-25 kdw  maxl?en == 69
# 2015-12-21 kdw  H: dont prototype lf_.* functions
# 2015-12-17 kdw  VB6: for loop error
# 2015-12-15 kdw  long lines
# 2015-12-14 kdw  die on bad array sigil
# 2015-12-11 kdw  more _?_U?SE_*  functions
# 2015-12-10 kdw  requires and define refactor
# 2015-12-09 kdw  read_file
# 2015-12-04 kdw  dont export lang defd functions
# 2015-12-03 kdw  wra[p]it ; long lines
# 2015-12-02 kdw  _?_REQ[U]IRES_?_
# 2015-12-01 kdw  change how c[x]_* are defined
# 2015-11-27 kdw  played with short output lines
# 2015-11-26 kdw  played with long lines
# 2015-11-25 kdw  handling on function args changed
# 2015-11-23 kdw  FR[P]N_ stuff
# 2015-11-19 kdw  funcy_* stuff
# 2015-11-18 kdw  Perl: export block work
# 2015-11-17 kdw  block work
# 2015-11-16 kdw  constant rework
# 2015-11-15 kdw  con[s]tant stuff
# 2015-11-13 kdw  $cm[f]unn
# 2015-11-12 kdw  $cm[f]un
# 2015-11-02 kdw  syntax error in VB6 code
# 2015-11-01 kdw  rmed extra output spaces
# 2015-10-22 kdw  _[_]IMPORT[_]_ format changed
# 2015-10-19 kdw  VB6: handle _[_]IMPORT[_]_ lines
# 2015-10-18 kdw  PERL: error in use line
# 2015-10-17 kdw  _[_]IMP[O]RT[_]_
# 2015-10-16 kdw  prevent re-inclusion of files
# 2015-10-14 kdw  BC: wrap REALLY long 'auto' lines
# 2015-10-13 kdw  _[_]DEFI[N]E_[_]
# 2015-10-11 kdw  BC: des?cription stuff
# 2015-10-08 kdw  RPN: stuff
# 2015-10-07 kdw  perl stuff
# 2015-10-05 kdw  --rpn
# 2015-10-01 kdw  C stuff
# 2015-09-30 kdw  _[_]IF_[N]OT_.*
# 2015-09-29 kdw  --h
# 2015-09-28 kdw  correct desc?ription
# 2015-09-25 kdw  reworked for VB and BC
# 2015-09-24 kdw  BC: bit ops, use int
# 2015-09-22 kdw  format of _[_].* strings changed
# 2015-09-21 kdw  :[K]DPW[:] lines changed
# 2015-09-20 kdw  fixed perl package name
# 2015-09-19 kdw  _[_]ONLY[_]_* fixed better
# 2015-09-18 kdw  changed shebang line
# 2015-09-17 kdw  _[_]ONLY[_]_*
# 2015-09-16 kdw  PYTHON: import sys
# 2015-09-11 kdw  VB9/PYTHON: rmed ";" at EOL
# 2015-09-10 kdw  BC: *_c[x] -> c[x]_*
# 2015-09-09 kdw  _[_]SK[I]P_[_]ELSE
# 2015-09-08 kdw  moved globel vars
# 2015-09-06 kdw  [_]_(UN)?SK[I]P[_]_ALL
# 2015-09-03 kdw  C:array passing
# 2015-09-02 kdw  c[n]v_d[b]l2[l]ng rename
# 2015-09-01 kdw  PR[I]NT stuff
# 2015-08-31 kdw  C RE[D]IM stuff
# 2015-08-30 kdw  BC array stuff
# 2015-08-29 kdw  array stuff
# 2015-08-28 kdw  _?_E[N]D_?_.* stuff
# 2015-08-27 kdw  VB6: minor output syntax error
# 2015-08-26 kdw  stuff
# 2015-08-25 kdw  Python GL[O]BAL stuff
# 2015-08-24 kdw  VB6: SHI[F]TR fixed
# 2015-08-23 kdw  handle spaces gracefully
# 2015-08-22 kdw  SHIFT[LR] added
# 2015-08-21 kdw  C: F[I]NI fixed
# 2015-08-20 kdw  C: line continuations fixed
# 2015-08-18 kdw  Python: ENDF?UNC left when not alone
# 2015-08-16 kdw  VB6 output wrt +=, et al.
# 2015-08-15 kdw  rmed () in WHILE,FOR,IF
# 2015-08-11 kdw  touched
# 2015-08-10 kdw  do not edit line added
# 2015-08-09 kdw  failed experiment
# 2015-08-08 kdw  tweak
# 2015-08-07 kdw  modulus function, et al.
# 2015-08-06 kdw  BEG / END keywords changed
# 2015-08-05 kdw  refactoring
# 2015-08-04 kdw  PERL: sort export list
# 2015-08-03 kdw  VB6 debugging
# 2015-08-02 kdw  python debugging
# 2015-08-01 kdw  added long options
# 2015-07-31 kdw  refactor; FO?R loops; IN?C,DE?C
# 2015-07-30 kdw  refactor
# 2015-07-29 kdw  refactor
# 2015-07-28 kdw  @?ou?t array
# 2015-07-27 kdw  E[U]LER, OM[E]GA
# 2015-07-17 kdw  fixed arrays in VB
# 2015-07-16 kdw  allow line-continuations
# 2015-07-15 kdw  preserve whole-line comments
# 2015-07-14 kdw  improved
# 2015-07-13 kdw  created
use strict;
use Getopt::Long qw(:config bundling no_ignore_case);
use Carp           qw();
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Translate qw( /^LANG_.*/ );
use Fwip_Comment   qw();
use Fwip_Parse     qw();
my $target_language = LANG_PERL;

my $vb_curr_sub;

my $funcy_bcrx = "";

my %funcy_names = ();
my @funcy_args = ();
sub funcyadd($$ )
{
   if ($_[0] !~ m/^cx/) {
      $funcy_args[$_[1] + 1] .= " $_[0]";
   }
   $funcy_names{$_[0]}++;
}
sub funcyaddcnx($$ )
{
   my $name = $_[0];
   $funcy_bcrx .= "|$name";

   my $cxnamel = "cx" . ($name);
   if ($_[1] !~ m/BLOCK_CONST/) {
      if (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
         funcyadd($cxnamel, -1);
         funcyadd($cxnamel, 0);
      } else {
         funcyadd($name, -1);
      }
   }
   $cxnamel;
}

my @context = ();
my $verbose_flag = 0;
my $packagename;
sub usage($ )
{
   die <<EndOfUsage;
$_[0]
Usage:$0 [OPTIONS] FILE.fwip [FILE2.fwip...]
Options:
   -n NAME     Name for packages
   -V          verbose
   Languages:
      --pm      --perl
      --py      --python
      --bas     --vb6
      --vb      --vbdotnet
      --u       --units
      --c
      --h       --header
      --rpn
      --bc      --bcc
      --v       --varylog
EndOfUsage
}
my $command_line_args = $ARGV[0]; # join(" ", @ARGV);
if (!Getopt::Long::GetOptions("l+", \$target_language
      , "n=s", \$packagename
      , "V+", \$verbose_flag
      , "vb6|bas",      sub { $target_language = LANG_VB6; }
      , "vb|vbdotnet",  sub { $target_language = LANG_VBDOTNET; }
      , "pm|perl",      sub { $target_language = LANG_PERL; }
      , "py|python",    sub { $target_language = LANG_PYTHON; }
      , "c",            sub { $target_language = LANG_C; }
      , "bc|bcc",       sub { $target_language = LANG_BC; }
      , "h|header",     sub { $target_language = LANG_H; }
      , "rpn",          sub { $target_language = LANG_RPN; }
      , "v|varylog",    sub { $target_language = LANG_VARYLOG; }
      , "u|units",      sub { $target_language = LANG_UNITS; }
   )) {
   usage ("Bad Option");
}

my ($cmout0, $cmout4, $bq, $bql)
   = Fwip_Translate::fwipt_lang_set($target_language);

my $lang_name = (qw(LANG_NONE LANG_PYTHON LANG_VB6 LANG_C
      LANG_BC LANG_PERL LANG_C LANG_C LANG_VARYLOG LANG_UNITS
      LANG_VBDOTNET))[Fwip_Translate::fwipt_lang_get()];
my $import_master_flag = 0;
my @vbglobal_vars = ();
my %bc_2darrdim = ();
my @c_def = ();
my @include_files = ();
my @func_prototype = ();
my @cx_func_proto = ();
if (!defined($packagename)) {
   usage "packagename not defined";
}

$packagename =~ s@.*/@@;
$packagename =~ s@\..*@@;
$packagename =~ s/-/_/g;
my $lcpn = lc($packagename);

if (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
   push(@func_prototype, "void ${lcpn}_description(void);");
}

funcyadd("timee", 0);
if (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
   push(@func_prototype, "double timee(NULL);");
}

foreach (qw(abs sin cos tan log exp sqrt floor ceil)) {
   funcyadd($_, 1);
   if (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
      push(@func_prototype, "double $_(double);");
   }
}
if (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
   funcyadd("defined", 1);
}

foreach (qw(pow atan2 fmod)) {
   funcyadd($_, 2);
   if (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
      push(@func_prototype, "double $_(double, double);");
   }
}

my $pre_join = "";
my @varylog_block = ();
my %included_files = ();
my @cx_funs = ();

my @input_lines = ();
my @fh = ();
my $lv_cm4 = Fwip_Comment::FWIPC_CM4;
my $lv_cm0 = Fwip_Comment::FWIPC_CM0;
my %local_const_hash = ();

my $comment_block = 0;
my $good_current_language = 1;

my $frgx = "(?:[+-]?(?:[0-9_]+\\.?[0-9_]*|[0-9_]*\\.?[0-9_]+)"
   . "(?:[eE][-+]?[0-9_]+)?)";

# Read in FWIP program to @input_lines
# join all continuation lines
# splice out all language lines
while (my $lin = <>) {
   chomp($lin);
   chomp($lin);
   $lin =~ s/^\s+//;
   if ($lin =~ s/\\$// # continuation line
            or ($lin =~ m/^[^#]+$/ and $lin !~ m/([;:]|\B_END\b)/)) {
      my $xn = <>;         # continuation line
      if (!defined($xn)) {
         die "whoopsiedoodle:$ARGV:$lin";
      }
      chomp($xn);
      $xn =~ s/^\s+//;     # continuation line
      $lin =~ s/\s*$/ /;    # continuation line
      $lin .= $xn;          # continuation line
      $lin =~ s/ +,/,/g;    # continuation line
      if (!eof()) {        # continuation line
         redo;             # continuation line
      }                    # continuation line
   }                       # continuation line

   # parenthesize return values
   $lin =~ s/RETURN ([^;]+?);/RETURN ($1);/g;

   if ($lin =~ m/[0-9]e[-+]?[0-9]/) {
      die "lower case e in numbers not allowed:$lin\n";
   }
   $lin =~ s/([0-9]E[+-])0+\B/$1/g;
   $lin =~ s/([0-9])E\+0+\b/$1/g;

   $lin =~ s/(?<=[a-z0-9]) +,/,/g;
   $lin =~ s/\( *\+ */(/g;
   $lin =~ s/, *\+ */, /g;
   $lin =~ s/^\s+//mg;
#   $lin =~ s/\b$packagename\.//g;
   if ($lin =~ s/\b(LANGUAGE(_NOT)?)\s+(.*?)://) {
      my ($noty, $langg) = ($1, $3);
      $langg =~ s/\s*#.*//;
      my @lngs = grep { m/./ } split(/\s+/, $langg);
      my $not_count = ($noty =~ m/_NOT$/ ? 1 : 0);
      my $lcount = 0;
      $good_current_language = 0;
      foreach my $lng (@lngs) {
         $lcount++;
         if ($lng eq $lang_name) {
            $good_current_language = 1;
         }
      }
      if ($lcount == 0) {
         $good_current_language = 1 - $not_count;
      } elsif ($not_count == 1) {
         $good_current_language = 1 - $good_current_language;
      }
   } elsif ($lin =~ s/LANGUAGE_END\b//) {
      $good_current_language = 1;
   } elsif ($good_current_language) {
      if ($lin =~ s/^\b(IMPORT_MASTER)\b//) {
         push(@input_lines, Fwip_Comment::fwipc_comm($1, $1));
         $import_master_flag = 1;
      } elsif ($lin =~ m/^($lv_cm0 \d{4}-\d\d-\d\d kdw  )(.*)/) {
         if (Fwip_Translate::fwipt_lang_is(LANG_VARYLOG)) {
            push(@varylog_block, "$1:$2");
         }
      } else {
         $lin =~ s/^\s+//;
         my @aa = map { s/^\s+//;$_; }
                  grep { m/\S/ }
                  split(/\n/, $lin);
         push(@input_lines, @aa);
      }
   }
}

if (!$import_master_flag) {
   @funcy_args = ();
   %funcy_names = ();
   @c_def = ();
   @func_prototype = ();
   @cx_func_proto = ();
}

my @outa = ();
my $lv_mode_current = "";
my %lv_mode = (MODE_INTEGER => "", MODE_INTEGER_END => "");
if (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
   $lv_mode{MODE_INTEGER} = "auto local_prev_scale;\n"
      . "local_prev_scale = scale;\n"
      . "scale = 0;";
   $lv_mode{MODE_INTEGER_END} = "scale = local_prev_scale;";
} elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
   $lv_mode{MODE_INTEGER} = "use integer;";
   $lv_mode{MODE_INTEGER_END} = "no integer;";
}

my $rxp_mn = Fwip_Parse::rx_modulename();
my $rxp_fn = Fwip_Parse::rx_functionname();
my $rxp_vn = Fwip_Parse::rx_variablename();
my $rxp_an = Fwip_Parse::rx_arrayname();
my $rxp_fd = Fwip_Parse::rx_function_decl();
my $rxp_vd = Fwip_Parse::rx_variabledecl();

my $array_name = "";
my $array_index = 0;
my %array_size = ();
my $seen_func_flag = 0;
my %writeable_arrays = ();
foreach (@input_lines) {
   if (Fwip_Translate::fwipt_lang_is(LANG_VARYLOG)) {
      last;
   }
   if (Fwip_Translate::fwipt_lang_is(LANG_UNITS)) {
      if (!m/\bCONST\b/) {
         next;
      }
   }
   push(@context, $_);
   if (40 < $#context) {
      shift(@context);
   }
   # Firstly, remove comments
   if (Fwip_Translate::fwipt_lang_is(LANG_VB6)
            or Fwip_Translate::fwipt_lang_is(LANG_VBDOTNET)) {
      s/\bDAY\b/EARTH_SOLARDAY/g;
   }

   # RM spaces between a function name and "("
   # and spaces between an array name and "["
   s/([a-z])\s+(\[|\()/$1$2/g;
   s/\]\s+\[/][/g;
   s/\[\s+\]/[]/g;
   my $comment_curr = "";

   sub lf_cmadd($;$ )
   {
      my $st = $_[0];
      $comment_curr =~ s/^ +//;
      if ($st =~ m/\S/ and $comment_curr =~ m/\S/) {
         if ($comment_curr !~ m/Copyright/) {
            chomp($st);
            $st .= " $comment_curr";
            if (!defined($_[1])) {
               $comment_curr = "";
            }
         }
      }
      $st;
   }
   sub lf_quincy($$ )
   {
      my ($name, $valu) = @_;
      my $ret;

      if ($name =~ m/_CNT$/ or $valu =~ m/\bsqrt\(/i) {
         $ret = "#define $name ($valu)";
      } elsif ($name =~ m/^LC_/) {
         $ret = "static const int $name = ($valu);";
      } else {
         $ret = "#define $name ($valu)";
         #$ret = "const double $name = ($valu);";
      }
      $ret;
   }

   if (s/\s*((?<!\\)$lv_cm0.*)//) {  # remove comments
      $comment_curr = $1;

      if (m/\S/) {
         $comment_curr =~ s/^ +/${bq}/;
      }
      if ($comment_curr =~ s/^$lv_cm4/$cmout4/) {
      } else {
         $comment_curr =~ s/$lv_cm0/$cmout0/;
         if (Fwip_Comment::FWIPC_LINE_LENGTH < length($comment_curr)) {
            if (1 < length($cmout0)) {
               my $bb = " " x (length($cmout0));
               if ($comment_curr =~ s/$bb/ /) {
               } else {
                  $comment_curr =~ s/(.*) /$1/;
               }
            }
         }
      }
   }
   $comment_curr = ""; # 20200618 kdw  added
   if (m/^$/) {
      if (Fwip_Translate::fwipt_lang_aint(LANG_H, LANG_RPN)) {
         push(@outa, Fwip_Translate::fwipt_ls_get() . "$comment_curr");
      }
      next;
   }

   if (s/^\s*(BLOCK_END)\b//) {
      if (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
         Fwip_Translate::fwipt_ls_dec($_);
         Fwip_Translate::fwipt_ls_next();
         $_ = "} $_";
      }
      if (Fwip_Translate::fwipt_lang_aint(LANG_H, LANG_RPN)) {
         push(@outa, lf_cmadd($_));
      }
      next;
   }

   if (s/^\s*(\bBLOCK\s*:)//) {
      if (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
         $_ = "{ $_";
         Fwip_Translate::fwipt_ls_inc($_);
      }
      if (Fwip_Translate::fwipt_lang_aint(LANG_H, LANG_RPN)) {
         push(@outa, lf_cmadd($_));
      }
      next;
   }

   if (m/$rxp_fd/s) {
      my ($retv, $func, $args, $rest) = ($1, $2, $3, $4);

      Fwip_Translate::fwipt_current_function_set($func, $retv);

      if ($seen_func_flag++ == 0) {
         # This is the first function definition we've seen
         my ($master_sub, $master_functions, $master_proto)
               = Fwip_Translate::fwipt_master_functions();
         my @ms_fun = ();

         if ($import_master_flag) {
            foreach my $subb (split(/\n/, $master_functions)) {
               if ($subb =~ m/^$master_sub\s+([a-z_0-9]+)\(/) {
                  push(@ms_fun, Fwip_Comment::fwipc_comm(
                     "IMPORT_MASTER-Function", "$1"));
               }
               push(@ms_fun, $subb);
            }
         }

         if (Fwip_Translate::fwipt_lang_is(LANG_C)) {
            push(@outa, @ms_fun);
         } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
            # BC needs the master functions to calculate some
            # of the constants (e.g. cxe = exp(1.0))
            push(@outa, @ms_fun, @cx_funs);
         } elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
            push(@outa, @ms_fun, @cx_funs);
         } elsif (Fwip_Translate::fwipt_lang_is(LANG_H, LANG_RPN)) {
            unshift(@func_prototype, split(/\n/, $master_proto));
         } else {
            push(@outa, @cx_funs, @ms_fun);
            if (Fwip_Translate::fwipt_lang_is(LANG_PERL)
                        && $import_master_flag) {
               unshift(@func_prototype, (split(/\n/, $master_proto)));
            }
         }
      }
      if (Fwip_Translate::fwipt_lang_aint(LANG_C)) {
         undef @cx_funs;
      }

      # don't export local functions
      if ($func !~ m/^lf_/) {
         my $argcount;
         if ($args eq "NUL" or $args eq "") {
            $argcount = 0;
         } else {
            $argcount = 1 + ($args =~ tr/,/,/);
         }
         funcyadd($func, $argcount);
      }
   }

   $_ = Fwip_Translate::fwipt_too($_);

   # BLOCK_CONST
   my $gj;
   do {
      $gj = 0;
      foreach my $rr (keys %local_const_hash) {
         if (s/\b$rr\b/$local_const_hash{$rr}/eg) {
            $gj++;
         }
      }
   } while ($gj != 0);

   if (m/\b(LOG)\b/) {
      die "$0:HAS LOG:$_\n";
   }

   if (m/^\s*$rxp_vd\s+(\w+)\[(\d+)\];/) {
      $array_size{$1} = $2 - 1;
   }
   if (Fwip_Translate::fwipt_lang_is(LANG_UNITS)) {
      # UNITS --- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/$rxp_mn//g;

      if (s/\bCONST\s+(\w+)\b\s*(\S.*?);//s) {
         my ($name, $valu) = ($1, $2);
         $valu =~ s/\b(SQRT|EXP)\b/\L$1/g;
         $valu =~ s/\bLN\b\s*\(/ln(/g;
         $valu =~ s%\bATAN2\s*\((.*?),(.*?)\)%atan(($1)/($2))%g;
#         if ($valu eq "1.0") {
#            $valu = lc($name);
#         }
         if ($valu !~ m/\s*\".*\"\s*/) {
            $valu =~ s/\" \"//g;
            $_ = lf_cmadd("$name $valu");
         } else {
            $_ = "";
         }
      } else {
         $_ = "";
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      # PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/\$$array_name\[$array_index\] = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            die "PERL:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      s/(?<!")($rxp_an)/\$$1/g; # sigils
      s/(?<!["\\])($rxp_vn)/\$$1/g; # sigils
      s/((?:BLOCK_DEF\s+)?CONST)\s+\$($rxp_vn)/$1 $2 /g;
      s/[\$\@]+([\$\@])(\w)/$1$2/g;  # rm duplicate sigils
      s/\$+($rxp_fn)/$1/g; # rm func sigils

      # PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?);//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         $name =~ s/^\$//;
         my $cxnamel = funcyaddcnx($name, $what);
         #push(@cx_funs, lf_cmadd("sub $cxnamel() { $name }", 1));
         $valu =~ s/\"\s+\"/" . "/g;
         $_ = lf_cmadd("sub $name() { $valu; }");
      }

      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest) = ($1, $2, $3, $4);

         Fwip_Translate::fwipt_ls_inc($_);

         $args =~ s/^\s+//;
         $rest =~ s/^\s+/\n${bq}/;
         my $argy = $args;
         my $proto = $args;
         $argy =~ s/\b($rxp_vd)\b//g;
         %writeable_arrays = ();
         while ($argy =~ s/\b(WRITEABLE|WRITEONLY|READONLY)\s+
                     \$(\w+)\[\] /\$$2/x) {
            my ($ty, $wa) = ($1, $2);
            $writeable_arrays{$wa} = 1;
            $proto =~ s/$ty\s+($rxp_vd)\s+\$($wa)\[\s*\]/\\\@/xg;
         }
         $argy =~ s/\$(\w+)\[\s*\]/\@$1/g;
         $argy =~ s/[][]//g;
         $argy =~ s/^ +//;
         $argy =~ s/  +/ /g;
         my $deff = "${bq}";
         $proto =~ s/[\$\@]($rxp_an)/@/g;
         $proto =~ s/([\$\@])($rxp_vn)/$1/g;
         $proto =~ s/[^\$@=\\]//g; # sigils
#         $proto =~ s/\$\@($$rxp_an)/$$1/g;
         if ($proto =~ s/(.)=/;$1/) {
            $proto =~ s/=//g;
            $deff = "";
            while ($argy =~ s/(\b[a-z_0-9]+\b) *= *\S+/$1,/) {
               my @hg = ($1, $2);
               chomp($hg[1]);
               $hg[0] =~ s/,\s+,/,/g;
               $hg[1] =~ s/,$//g;
               $deff .= sprintf("\n"
                        . "${bq}if (!defined(%-7s)) { %-7s = $hg[1]; }"
                        , $hg[0], $hg[0]);
            }
         }
         $argy =~ s/\s+,/,/g;
         $argy =~ s/,,/,/g;
         $argy =~ s/,$//g;
         push(@func_prototype, "sub $func($proto );");
         $_ = "sub $func($proto ) {\n";
         if ($argy ne "") {
            if ($argy =~ m/,\s*,/s) {
               die "ARGY=$argy\nARGS=$args\n";
            }
            $_ .= "${bq}my ($argy) = \@_;\n";
         }
         $_ .= "$deff$rest";
      }
      foreach my $kk (keys %writeable_arrays) {
         s/\$+$kk\[/\$\$$kk\[/g;
      }
      s/^\bIMPORT\s*\"(.*?)\"\s*;/use $1 qw();\n/;

      die "$_" if (m/\$[A-Z]/);

      s/\bREDIM\b.*//;

      s/PRINTSTR\s*\((.*)\)/print($1)/;
      s/PRINTVAL\s*\((.*?)\)\s*;/print($1);/;
      s/my \$+(\w+)\s*(\[[0-9]*\])+;/my \@$1;/g;  # sigil fix

      print STDERR "$_\n" if (m/\bmy\b.*\[/);
      die $_ if (m/my \$.*\[/);
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
      # PYTHON -- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/$rxp_vd\s+(\w+)\[\s*\];/$1 = []/;

      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/$array_name\[$array_index\] = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            die "PYTHON:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest)
               = ($1, $2, $3, $4);

         Fwip_Translate::fwipt_ls_inc($_);

         $rest =~ s/^\s+/\n${bq}/;
         $args =~ s/\b[\]\[]+//g;
         $args =~ s/\b$rxp_vd\s+//g;
         $args =~ s/\s+,\s*/, /g;
         $_ = "def $func($args):$rest";
      }
      s/^\bIMPORT\s*\"(.*?)\"\s*;/import $1\n/;
#      s/^\bIMPORT\s*\"(.*?)\"\s*;/from $1 import *\n/;
      # PYTHON -- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?);//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         my $cxnamel = funcyaddcnx($name, $what);
         #push(@cx_funs, lf_cmadd("$cxnamel = ($name)", 1));
         $valu =~ s/\"\s+\"/" + "/g;
         $_ = lf_cmadd("$name = $valu");
      }

      if (m/\bRETURN\b\s*(.*?);/ and "INT" eq
            Fwip_Translate::fwipt_current_function_ret_get()) {
         s/\bRETURN\b\s*(.*?);/"return int($1)"/xeg;
      }

      s/\bREDIM\s+(\S.*?)\[\s*\],\s*(\S.*);/
         "for nzzn in range(len($1), int($2)):\n" .
         "${bq}$1.append(0)"/xeg;
      s/^\bREDIM\s+(\S*?)\[\s*\]\s*;//;

      s/PRINTSTR\s*\((.*?)\);/print($1, end='')/g;
      s/PRINTVAL\s*\((.*?)\)\s*;/print(str($1), end='')/gx;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6)) {
      # VB6 ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      chomp;
      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/$array_name\($array_index) = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            die "VB6:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      s/\b0x([0-9A-Fa-f]+)/\&H$1&/g;
      s/\b0o([0-7]+)/\&O$1/g;
      s/\b0b([01]+)/\&B$1/g;
      s/^\b(IMPORT\s*\"(.*?)\"\s*;)/$cmout0$1\n/;
      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest)
               = ($1, $2, $3, $4);

         Fwip_Translate::fwipt_ls_inc($_);

         $vb_curr_sub = $func;
         $args =~ s/\n//g;
         my @pieces = split(/\s*,\s*/, $args);
         foreach (@pieces) {
            if (s/(WRITEABLE|WRITEONLY)\s+($rxp_vd)\s+
                     ($rxp_an)\[\s*\] /ByRef $3() As $2/x) {
            } elsif (s/($rxp_vd) ($rxp_an\[\s*\])/$2 As $1/) {
               s/($rxp_an\[)0(\])/$1$2/;
            } else {
               s/($rxp_vd) ($rxp_an)/ByVal $2 As $1/;
            }
            if (m/ = /) {
               $_ = "Optional $_";
            }
         }

         $args = join("${bq}, ", @pieces);
         $rest =~ s/^\s+/\n${bq}/;

         my $qq;

         my $pref;
         if ($ret eq "NUL") {
            $qq = "";
            $pref = 0;
         } else {
            $ret =~ s/\n//g;
            $qq .= "${bq}${bq}As $ret";
            $pref = 1;
         }

         $_ = ($func =~ m/^(cx)?lf_/ ? "Private" : "Public")
            . Fwip_Translate::fwipt_vbsub_set($pref)
            . " $func($args)$qq$rest";
      }
      # VB6 ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?) *;//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         my $ty;
         if ($valu !~ m/\"/) {
            $ty = ("Double");
         } else {
            $valu =~ s/\"\s+\"/" & "/g;
            $ty = ("String");
         }
         #         $_ = "";
         my $pp;
         if ($what =~ m/BLOCK_DEF/ or $name =~ m/^(LC_|LX_)/) {
            $pp = "Private";
         } else {
            $pp = "Public";
         }
         $valu =~ s/SQRT\s*\((.+)\)/($1) ^ 0.5/;
         # VB6 doesnt do self-ref modules
         $valu =~ s/$packagename\.//g;
         my $cxnamel = funcyaddcnx($name, $what);
         #push(@cx_funs
         #   , lf_cmadd("$pp Function $cxnamel() As $ty\n"
         #         . "${bq}$cxnamel = $name\n"
         #         . "End Function", 1));
         $_ = lf_cmadd("$pp Const $name As $ty = $valu");
=pod
         my $mlm = Fwip_Comment::FWIPC_LINE_LENGTH + 1;
         foreach ($cx_funs[$#cx_funs], $_) {
            if (m/.{$mlm}/) {
               if (!s/(.{1,$mlm}) +/$1${bq}/) {
                  s/=/${bq}=/;
               }
            }
         }
=cut
      }

      if (s/(?<!\bAs)(\s*)($rxp_vd)\s+([a-z_A-Z][a-z_0-9]*\[.*\])
            /${1}Dim $3 As $2/xg
         or s/(?<!\bAs)(\s*)\b($rxp_vd)\s+([a-z_A-Z][a-z_0-9]*\b)
               /${1}Dim $3 As $2/xg) {
         my $var = $3;
         s/\s*(=)(.*)//;
         s/([A-Z]+) Dim/$1/;
         s/\[0\]/[]/;
      }
      s/(\(|, )Dim /${1}ByVal /g; # rm dim from funcs

      s/\b%\b/ Mod /xsmg;
      s/\(\s+/(/g;

      s!(\s*)(\S+)\s*([-+/*]|\<\<|\>\>)=(.*)!$1$2 = $2 $3$4!x;
      s/ \>\>/\\ 2 ^/g;
      s/\*\*/^/g;

      s/\bREDIM\s+(\S.*?)\[\s*\],\s*(\S.*);/ReDim Preserve $1($2)/x;
      s/\bREDIM\s+(\S*?)\[\s*\]\s*;//;

      if (s/\bRETURN\b\s*\((.*?)\);/"$vb_curr_sub = $1\nExit Function"/eg) {
#         if (Fwip_Comment::FWIPC_LINE_LENGTH
#                  <= length("$vb_curr_sub = ($1)")) {
#            s/$vb_curr_sub = /$vb_curr_sub _\n${bq}${bq}= /;
 #        }
      }

      s/PRINTSTR\s*/Debug.Print/;
      s/PRINTVAL\s*/Debug.Print/;

      s/\bDAY\b/EARTH_SOLARDAY/g;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VBDOTNET)) {
      # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      chomp;
      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/$array_name\[$array_index\] = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            die "VBDOTNET:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      s/\bArray\(/Array.CreateInstance(/g;
      s/\b0x([0-9A-Fa-f]+)/\&H$1&/g;
      s/\b0o([0-7]+)/\&O$1/g;
      s/\b0b([01]+)/\&B$1/g;
      s/^\b(IMPORT\s*\"(.*?)\"\s*;)/$cmout0$1\n/;
      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest) = ($1, $2, $3, $4);

         Fwip_Translate::fwipt_ls_inc($_);

         $vb_curr_sub = $func;
         $args =~ s/\n//g;
         my @pieces = split(/\s*,\s*/, $args);
         foreach (@pieces) {
            if (s/($rxp_vd) ($rxp_an)\[\s*\]/$2\[\] As $1/) {
            } else {
               s/($rxp_vd) ($rxp_vn)/ByVal $2 As $1/;
            }
            if (m/ = /) {
               $_ = "Optional $_";
            }
         }

         $args = join("${bq}, ", @pieces);
         $rest =~ s/^\s+/\n${bq}/;

         my $qq;

         my $pref;
         if ($ret eq "NUL") {
            $qq = "";
            $pref = 0;
         } else {
            $ret =~ s/\n//g;
            $qq .= "${bq}${bq}As $ret";
            $pref = 1;
         }

         $_ = ($func =~ m/^(cx)?lf_/ ? "Private" : "Public")
            . " Shared" . Fwip_Translate::fwipt_vbsub_set($pref)
            . " $func($args)$qq$rest";
      }
      # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?) *;//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         my $ty;
         if ($valu !~ m/\"/) {
            $ty = ("Double");
         } else {
            $valu =~ s/\"\s+\"/" & "/g;
            $ty = ("String");
         }
         $_ = "";
         my $pp;
         if ($what =~ m/BLOCK_DEF/ or $name =~ m/^(LC_|LX_)/) {
            $pp = "Private";
         } else {
            $pp = "Public";
         }

         $pp .= " Shared";
         my $cxnamel = funcyaddcnx($name, $what);
         $valu =~ s/SQRT\s*\((.+)\)/($1) ^ 0.5/;
         # VB6 doesnt do self-ref modules
         $valu =~ s/$packagename\.//g;
         $_ = lf_cmadd("$pp Const $name As $ty = $valu");
      }

      if (s/(?<!\bAs)(\s*)($rxp_vd)\s+($rxp_an\b)\[(.*)\]
            /${1}Dim $3\[$4\] As $2/xg
         or s/(?<!\bAs)(\s*)\b($rxp_vd)\s+($rxp_an\b)
               /${1}Dim $3 As $2/xg) {
         my $var = $3;
         s/\s*=(.*)//;
         s/($rxp_an) Dim/$1/;
         s/\[0\]/[]/;
      }
      my $rxp_vdl = "\\bBLOCK_(DBL|STR|INT|BOL)";
      if (s/(?<!\bAs)(\s*)$rxp_vdl\s+($rxp_an\b)\[(.*)\]
               / "${1}Private $3\[$4\] As $2" /xeg
               or s/(?<!\bAs)(\s*)\b$rxp_vdl\s+($rxp_vn\b)
               / "${1}Private $3 As $2" /xeg) {
         s/\s*=(.*)//;
#         s/($rxp_an) Dim/$1/;
      }

      if (s/(?<!\bAs)(\s*)($rxp_vd)\s+([a-z_A-Z][a-z_0-9]*\[.*\])
               /${1}Dim $3 As $2/xg
               or s/(?<!\bAs)(\s*)\b($rxp_vd)\s+([a-z_A-Z][a-z_0-9]*\b)
               /${1}Dim $3 As $2/xg) {
         my $var = $3;
         s/\s*(=)(.*)//;
         s/([A-Z]+) Dim/$1/;
      }

      s/(\(|, )Dim /${1}ByVal /g; # rm dim from funcs

      s/\b%\b/ Mod /xsmg;
      s/\(\s+/(/g;

      s!(\s*)(\S+)\s*([-+/*]|\<\<|\>\>)=(.*)!$1$2 = $2 $3$4!x;
      s/ \>\>/\\ 2 ^/g;
      s/\*\*/^/g;

      s/\bREDIM\s+(\S.*?)\[\s*\],\s*(\S.*);/ReDim Preserve $1\[$2\]/x;
      s/\bREDIM\s+(\S*?)\[\s*\]\s*;//;

      if (s/\bRETURN\b\s*\((.*?)\);/"$vb_curr_sub = $1\nExit Function"/eg) {
#         if (Fwip_Comment::FWIPC_LINE_LENGTH
#                   <= length("$vb_curr_sub = ($1)")) {
#            s/$vb_curr_sub = /$vb_curr_sub _\n${bq}${bq}= /;
#         }
      }

      s/PRINTSTR\s*/Debug.Print/g;
      s/PRINTVAL\s*/Debug.Print/;

      s/\bDAY\b/EARTH_SOLARDAY/g;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
      # C - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      # H - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      # RPN ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/$rxp_mn//g;
      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/$array_name\[$array_index\] = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            foreach my $ky (keys %array_size) {
               print STDERR "\narray_size\{$ky\}=$array_size{$ky}";
            }
            die "\nC/H/RPN:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest)
               = ($1, $2, $3, $4);

         Fwip_Translate::fwipt_ls_inc($_);

         my $argy = $args;

         $argy =~ s/($rxp_an)(\[\s*\])/\*$1/g;
         $ret =~ s/($rxp_an)(\[\s*\])/$1\*/g;
         $argy =~ s/\s*,/\n${bq}${bq},/g;
         #$argy =~ s/^ +//;
         $rest =~ s/^\s+/\n${bq}/;
         $argy =~ s/(\S ) +/$1/g;
         # do not prototype local functions
         my $prt = "$ret $func($argy)";
         $_ = "";
         if ($func !~ m/^lf_/) {
            push(@func_prototype, "$prt;");
         } else {
            $_ .= "static ";
         }
         $_ .= "$prt\n{$rest";
      }
      if (s/^\bIMPORT\s*\"(.*?)\"\s*;//) {
         push(@include_files, "#include \"$1.h\"");
      }
      # C - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      # H - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      # RPN ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?) *;//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         my $ty = ($what eq "BLOCK_DEF" ? "long" : "double");
         $_ = "";
         my $cxnamel = funcyaddcnx($name, $what);
         $valu =~ s/\b(SQRT|EXP)\b/\L$1/g;
         $valu =~ s/\bLN\b\s*\(/log(/g;
         if ($valu =~ m/\"/) {
            $ty = "const char *";
            my $cxfn = "$cxnamel(void)";
            push(@cx_funs, lf_cmadd("$ty $cxfn { return ($name); }", 1));
            if (Fwip_Translate::fwipt_lang_is(LANG_H)) {
               push(@c_def, lf_cmadd("#define $name $valu", 1));
               push(@cx_func_proto, lf_cmadd("$ty $cxfn;"));
            }
         } elsif ($what !~ m/BLOCK_DEF/) {
            push(@cx_funs, lf_cmadd("$ty $cxnamel(void) { return ($name); }"
                  , 1));
            if (Fwip_Comment::FWIPC_LINE_LENGTH < length($cx_funs[-1])) {
               $cx_funs[-1] =~ s/(\{) (return)/$1\n${bq}$2/;
            }
            if (Fwip_Translate::fwipt_lang_aint(LANG_C)) {
               push(@c_def, lf_cmadd(lf_quincy($name, $valu), 1));
 #              if (Fwip_Comment::FWIPC_LINE_LENGTH < length($c_def[-1])) {
 #                 $c_def[-1] =~ s/(\#define\s+\S+)\s+(\S)
 #                       /$1 \\\n${bq}${bq}$2/x;
 #              }
               push(@cx_func_proto, lf_cmadd("$ty $cxnamel(void);"));
            }
            $_ = "";
         } else {
            if (Fwip_Translate::fwipt_lang_is(LANG_C)) {
               $_ = lf_quincy($name, $valu);
            } else {
               $_ = "";
            }
         }
      }

      s/^\bREDIM\s+($rxp_an)\[\s*\]\s*,\s*(.*)\s*;
         /$1 = realloc($1\n${bq}, ($2) * sizeof(${1}[0]));/xg;
      s/^\bREDIM\s+($rxp_an)\[\s*\]\s*;/free($1);/;

      s/PRINTSTR\s*\((.*)\);/printf("%s", $1);/;
      s/PRINTVAL\s*\((.*?)\)\s*;/printf("%.18g", (double)$1);/x;

   # BC --- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
      if (s/ARRAY\s*(\w+)\[\s*\]\s*://) {
         $array_name = $1;
         $array_index = 0;
      } elsif (s/ARRAY_END//) {
         $array_name = "";
      } elsif ($array_name =~ m/\S/) {
         s/(\S.*;)/$array_name\[$array_index\] = $1/;
         $array_size{$array_name} = $array_index++;
      }
      while (m/ARRAYLAST\((\w+)\[\s*\]\)/) {
         if (!defined($array_size{$1})) {
            die "BC:array_size\{$1\} NOT DEFINED";
         }
         s/ARRAYLAST\((\w+)\[\s*\]\)/ $array_size{$1} /e;
      }

      s/(0x[0-9A-Fa-f]+)/ hex($1) /eg;
      s/(0b[01]+)/ hex($1) /eg;
      s/0o([0-7]+)/ oct("0" . $1) /eg;
      if (m/$rxp_fd/) {
         my ($ret, $func, $args, $rest) = ($1, $2, $3, $4);

         $func = lc($func);  # BC cant handle upper case
         Fwip_Translate::fwipt_ls_inc($_);

         $args =~ s/\s*\b([A-Z]+)\b\s*/ /g;
         $args =~ s/\s+(\w+)/ $1/g;
         $args =~ s/\s+,\s*/, /g;
         $args =~ s/\b(\w+\[\s*\])/*$1/g;
         $rest =~ s/^\s+/\n${bq}/;
         $_ = "define $func($args) {$rest";
      }

      s/(\bRETURN\b\s*.+)(\[\s*\])([^)])/$1$2/g;

      s/\bREDIM\b.*//;

      s/^\b(IMPORT\s*\"(.*?)\"\s*;)/$cmout0$1\n/;
      # BC  ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (s/^ *((?:BLOCK_DEF +)?CONST) +(\w+)\b *(\S.*?) *;//s) {
         my ($what, $name, $valu) = ($1, $2, $3);
         my $cxnamel = funcyaddcnx(lc($name), $what);
         if ($valu !~ m/\"/) {
            $valu =~ s/EXP\s*\(/e(/g;
            $valu =~ s/LN\s*\(/l(/g;
            $valu =~ s~ATAN2\s*\((.+?),\s*(.+?)\)~a(($1) / ($2))~xg;
            $valu =~ s/(\d+(\.\d+)?)[eE]\+?(-?\d+)/($1 * 10^$3)/xg;
            $valu =~ s/([A-Z0-9_]+\()/ lc($1) /eg;

            if ($cxnamel ne $name) {
#            push(@cx_funs, lf_cmadd("$cxnamel = ($name);", 1));
            }
            $_ = lf_cmadd("$cxnamel = $valu;");
         }
      }

      s/\*\*/^/g;

      s/PRINTSTR\s*\((.*)\)/print $1/;
      s/PRINTVAL\s*\((.*?)\)\s*;/print $1;/;
      my $dlag = 0;

      if (s/BLOCK_(?:INT|DBL|STR|BOL)\s+($rxp_an)\[([^\]]+)\]\[([^\]]+)\]
                  /auto $1\[($2 + 1) * $3\]/xg) {
         $bc_2darrdim{$1} = "$3";
         $dlag = 1;
      } elsif (s/BLOCK_(?:INT|DBL|STR|BOL)\s+($rxp_an)\[([^\]]*)\]
                  /auto $1\[$2\]/xg) {
         $dlag = 1;
      } elsif (s/BLOCK_(?:INT|DBL|STR|BOL)\s+(\w+(\s*=.*)?)(?=;)
                  /auto $1/xg) {
         $dlag = 1;
      }

      if ($dlag != 0) {
         s/auto //;
         if (! m/(=)/) {
            s/;/ = 0;/;
         }
      }

      s/(\d+(\.\d*)?)E\+?(-?\d+)/($1 * 10^$3)/g;
      s/\( *\+ */(/g;
   }

   if (m/\s*\b(MODE_\w+)\s*:/ and !defined($lv_mode{$1})) {
      die "$1";
   }

   if (s/\s*\b(MODE_\w+)\s*:/$lv_mode{$1}/e) {
      $lv_mode_current = $1;
   }
   s/\b(MODE_\w+_END)/$lv_mode{$lv_mode_current . "_END"}/e;

   $_ = Fwip_Translate::fwipt_loopy($_);

   s/\bmy \$(\w+)\[.*\];/my \@$1;/g;
   die "RRR:$_\n" if (m/\bmy\b.*\[/);

   if (m/^\s+$/) {
      $_ = "";
   }
   s/^/Fwip_Translate::fwipt_ls_get()/gems;
   Fwip_Translate::fwipt_ls_next();
   $_ = lf_cmadd($_);

   # PYTHON ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   if (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
      my $zd = "for ii in range";
      # take care of 2D arrays first
      s/^(\s*)(\w+)\[([^\]]+)\]\[([^\]]+)\];
               /$1$2 = [[0 $zd($4)] $zd($3)];/xg;
      s/\b(pass|break|yield);/$1 ;/g;
      s/^\s*\w+;/;/g;
      s/\b(pass|break|yield) ;/$1;/g;
      s/^(\s*\w+)\[([^\]]+)\];/$1 = [0 $zd($2)];/g;

      s/^(\s*\w+)\[\s*\]\s*$/$1 = [0]/g;
      s/(\w+)\[\s*\]/$1/g;
      s/ \* \* / ** /g;
   # VB6 -- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # VBDOTNET --- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
      if (Fwip_Translate::fwipt_lang_is(LANG_VB6)) {
         # change "var += valu" into "var = var + valu", et al.
         s@(\s*)(\S+)\s*([-+/*]|\<\<|\>\>)=(.*)@$1$2 = $2 $3$4@x;
      }
      if (s/\b(Private)\s+(Long|Double|String|Boolean)
            \s+($rxp_an)(\[.*\])/$1 $3$4 As $2/xg) {
         s/\[0\]/[]/;
      }
      s/\b(Private)\s+(Long|Double|String|Boolean)
         \s+($rxp_vn).*/$1 $3 As $2/xg;

      s/==/=/g;
      1 while(s/^([^"]*)\b\]\[/$1, /g);
      if (!m/ As (\S+)\[\s*\]/g) {
         s/(?<! As )(\S+)\[\s*\](?! +As )/$1/g;
      }
      s/(\S) +,/$1,/g;
      s/(\S)  +As/$1 As/g;
      1 while(s/^([^"]*)\[/$1(/g);
      1 while(s/^([^"]*)\]/$1)/g);
      if (Fwip_Translate::fwipt_current_function_get() eq ""
               and m/\b(Private|Public)\s+/) {
         s/;//g;
         push(@vbglobal_vars, "$_");
         $_ = "";
      }
   # C ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
      s/^(\s*double|\s*long) (\w+)\[\s*\];/$1 *$2 = NULL;/g;
      s/(\w+)\[\s*\]/$1/g;
   # BC --- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
      s/\[\s*\]\s*=\s*/ = /g;
   # PERL - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      s/(my +\w+)\[.*\];/$1;/;
      s/\$(\w+)\[\s*\]/\@$1/g;  # sigils
      s/(\w+)\[\s*\]/$1/g;
      s/\$\@(\w+)/\@\$$1/g; # sigils 2019-08-13
   }
   #   s/^\s+(\w+|\w+\[\s*\]);\s*$//mg;

   # PYTHON ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # VB6 -- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # VBDOTNET --- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   if (Fwip_Translate::fwipt_lang_is(LANG_PYTHON, LANG_VB6, LANG_VBDOTNET)) {
      s/;$//mg;
      s/;\s*($cmout0)/$1/g;
      s/ \* \* / ** /g;
   }

   if (m/\S/) {
      if (Fwip_Translate::fwipt_lang_aint(LANG_H, LANG_RPN)) {
         push(@outa, $_);
      }
      # VB6 ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)
            and $outa[$#outa] =~ m/End Function/
            and $outa[$#outa - 1] =~ m/Exit Function/) {
         $outa[$#outa - 1] =~ s/Exit Function//g;
      }
   }
   die "$_" if (m/ \* \* /);
}

sub space_out_words($$ )
{
   my ($subb, $max_len) = @_;

   $subb =~ s/\s+$//;
   while (length($subb) < $max_len) {
      if ($subb !~ s/(.*[]a-zA-Z0-9:?)]) \b/$1  /) {
         last;
      }
   }

   "$subb\n";
}

if (Fwip_Translate::fwipt_lang_aint(LANG_C)) {
   @cx_funs = ();
}

sub joinrx($ )
{
   my $ff = $_[0];

   $ff =~ s/^ //;
   my @ff = sort { lc($a) cmp lc($b) } split(/ +/, $ff);

   my $ii;
   foreach my $vv (reverse (3..15)) {
      $ii = 0;
      while ($ii < $#ff) {
         my $fcn = $ff[$ii] . " " . $ff[$ii + 1];
         if ($fcn =~ m/^((is|w[m01p]|\w{$vv})\w*)(\S*) \1\S*/) {
            my $pre = $1;
            my $suffy = $3;
            my $prerx = $pre;
            $prerx =~ s/(\[|\]|\(|\)|\+|\-)/\\$1/g;
            while ($ii + 1 <= $#ff and $ff[$ii + 1] =~ m/^$prerx(.+)$/) {
               $suffy .= "|" . $1;
               splice(@ff, $ii + 1, 1);
            }
            if ($suffy =~ m/./) {
               $ff[$ii] = "$pre($suffy)";
            }
         }
         $ii++;
      }
   }

   foreach my $gg (@ff) {
      my $gg_orig = $gg;
      if (($gg =~ y/(/(/) != ($gg =~ y/)/)/)) {
         die "PRE:$gg_orig -> $gg";
      }

      my $gn = $gg;
      while (($gg =~ s/\(\|d\(\|inv\)\|h\(\|inv\)
               \|inv\|t\(\|inv\)\|\)/[dht]?(inv)?/xg)
               or ($gg =~ s/\(\|c\(\|inv\|x\(\|inv\)\)\|inv\)
               /[cx]?\(inv\)?/xg)
               or ($gg =~ s/d\(inv\)\?\|h\(inv\)\?
               \|inv\|t\(inv\)\?/[dht]?(inv)?/xg)
               or ($gg =~ s/\(\|([^()]+)\)/($1)?/g)
               or ($gg =~ s/\(\|([^()]*\([^()]+\)[^()]*)\)/($1)?/g)
               or ($gg =~ s/\(([^()]+)\|\)/($1)?/g)
               or ($gg =~ s/\?{2,}/?/g)
               or ($gg =~ s/\((.)\)/$1/g)
               or ($gg =~ s/\((\w+)\)([^?*+])/$1$2/g)
               or ($gg =~ s/\(([^|()]+?)(.+)
                  \|([^|()]+?)\2
                  \|([^|()]+?)\2\)/($1|$3|$4)($2)/xg)
               or ($gg =~ s/\(([^|()]+?)(.+)\|([^|()]+?)\2\)\
                  /($1|$3)($2)/xg)
               or ($gg =~ s/\((.)\|(.)\|(.)\)/[$1$2$3]/g)
               or ($gg =~ s/\((.)\|(.)\)/[$1$2]/g)
               or ($gg =~ s/\|(.)\|(.)\)/|[$1$2])/g)
               or ($gg =~ s/\((.)\|(.)\|(.)\|/([$1$2$3]|/g)
               or ($gg =~ s/\((.)\|(.)\|/([$1$2]|/g)
            ) {
         my ($po, $pc) = (($gg =~ y/(/(/), ($gg =~ y/)/)/));
         if ($po != $pc) {
            die "*****$po != $pc\nORIG=$gn\nNOW =$gg";
         }
         $gn = $gg;
      }
      $gg =~ s/\(([^(|)]+)\)$/$1/g;
   }
   my $res = join(" ", @ff);
   $res;
#=cut
}

sub lf_wrapit($$$ )
{
   my ($max_len, $indent, $line) = @_;
   my $out = "";
   my $ff = $line;

   $ff =~ s/^ //;
   my @ff = split(/ +/, $ff);
   my $curline = $indent;
   my $totalout = "";

   my $prev_line;
   foreach my $pp (@ff) {
      $prev_line = $curline;
      $curline =~ s/\b$/ /;
      $curline .= "$pp";
      my $mx = $max_len;
      while ($max_len < length($curline)) {
         if ($curline =~ s/^(.{0,$mx}\S)(( |\|).*)$/$1/) {
            my ($bef, $aft) = ($1,$2);
            $aft =~ s/^\s+//;
            if ($bef =~ m/#/) {
               $aft =~ s/^/#/;
            }
            $totalout .= $bef . "\n";
            $curline = "$indent$aft";
         } else {
            $totalout .= space_out_words($prev_line, $max_len);
            $curline = "$indent$pp";
         }
      }
   }
   if (length($indent) <= length($curline)) {
      $totalout .= "$curline\n";
   }

   $totalout;
}

# Assemble the description function ----- ----- ----- ----- ----- ----- -----

my $descs_code = "";
my $descl_code = "";
my @descl_arr = ();
if (Fwip_Translate::fwipt_lang_aint(LANG_UNITS, LANG_VARYLOG)) {
   my ($deb, $dee, $det);
   my $mlmmm = Fwip_Comment::FWIPC_LINE_LENGTH;
   if (Fwip_Translate::fwipt_lang_is(LANG_C)) {
      ($deb, $dee, $det) = ("\"", "\"\\", "\\n");
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_H)) {
      ($deb, $dee, $det) = ("\"", "\"\\", "\\n");
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
      ($deb, $dee, $det) = ("\"", "\"\\", "\\n");
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      ($deb, $dee, $det) = ("\"", "\" .", "\\n");
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
      ($deb, $dee, $det) = ("\"", "\" + \\", "\\n");
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
      ($deb, $dee, $det) = ("print \"", "\";", "\\n");
      $mlmmm -= 0;#14;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
      ($deb, $dee) = ("${bq}${bq}& \"", "\" _");
      $det = "${bq}${bq}& vbNewLine";
   } else {
      die "UNKOWN LANGUAGE=" . Fwip_Translate::fwipt_lang_get();
   }

   my $dd = $dee;
   $dd =~ s/(.)/\\$1/sg;
   my $delen = length("${bq}$deb$dee\n");
   my $mlmm = $mlmmm;
   my $mlm = $mlmm - $delen + 1;
   foreach my $args (0..$#funcy_args) {
      $descl_arr[$args] = " ";
      if (defined($funcy_args[$args]) and $funcy_args[$args] =~ m/./) {
         my $subb = "$packagename ";
         my $ff = $funcy_args[$args];
         $ff =~ s/^ //;
         if ($args == 0) {
            $subb .= "Constants";
         } else {
            $subb .= ($args - 1) . "-ary Functions";
         }
         my $fillets = "${bq}$subb: " . joinrx($ff);
         my $filleta = join(" ", sort { lc($a) cmp lc($b)} split(/ +/, $ff));
         my $filletl = "${bq}$subb: $filleta";

         foreach ($fillets, $filletl, $filleta) {
            s/(.{1,$mlm})/${bq}$deb$1$dee\n/g;
            # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- -----
            # VB6 ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            if (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
#               s/$dd\n$/$dee\n${bq}$det\n/;
               s/$dd\n$/" & vbNL\n/;
            } else {
               s/$dd$/$dee\n${bq}$deb$det$dee\n/;
            }
         }

         $descs_code .= "\n$fillets";
         $descl_code .= "\n$filletl";
         $descl_arr[$args] = "$filleta";
      }
   }
}

$descs_code =~ s/^\n//;
$descs_code =~ s/"[^"]+$/"/;

$descl_code =~ s/^\n//;
$descl_code =~ s/"[^"]+$/"/;

foreach my $pp (@outa, @include_files, @c_def, @func_prototype
         , @cx_func_proto) {
   my @qq = split(/\n/, $pp);
   foreach (@qq) {
      my ($aa, $bb);
      if (m/^(.*?)($lv_cm0.*)/) {
         ($aa, $bb) = ($1, $2);
      } else {
         ($aa, $bb) = ($_, "");
      }
      $_ = Fwip_Translate::fwipt_keyword_replace($aa) . $bb;
   }
   $pp = join("\n", @qq);
}

my $txt = "${lcpn}_description";
my $desc_pre = Fwip_Comment::fwipc_comm("Description", $txt);
chomp($desc_pre);

sub unshift_outa($@ )
{
   my ($title, @aa) = @_;
   if (0 <= $#aa) {
      unshift(@outa, Fwip_Comment::fwipc_comm($title, $lang_name), @aa);
   }
}

if (Fwip_Translate::fwipt_lang_is(LANG_UNITS)) {
} elsif (Fwip_Translate::fwipt_lang_is(LANG_VARYLOG)) {
# PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
} elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
   # do not attempt to export language defined functions
   my $ee = join(" ", grep {
         # 2020-05-15 kdw  rmed tan/defined function
         !m/^(abs|sin|cos|log|exp|sqrt|atan2)$/ and !m/^LC_/i;
      } keys %funcy_names);
   my $hh = join(" ", sort (split(/ +/, $ee)));
   $hh =~ s/^ +//;
   my $export_list = lf_wrapit(Fwip_Comment::FWIPC_LINE_LENGTH, ${bq}, $hh);

   unshift(@outa, <<EndOfExportPerl, @func_prototype);
\@EXPORT_OK = ( qw(
$export_list)); $cmout0 End of EXPORT_OK
\%EXPORT_TAGS = ( ALL => [ \@EXPORT_OK ] );
EndOfExportPerl
   chomp($descs_code);
   chomp($descl_code);

   push(@outa, <<EndOfDescPerl);
$desc_pre
sub ${lcpn}_description() {
$descl_code;
}
sub ${lcpn}_desc() {
$descs_code;
}
EndOfDescPerl
# C - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
} elsif (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H, LANG_RPN)) {
   # C ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # H ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # RPN -- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   if (Fwip_Translate::fwipt_lang_is(LANG_C)) {
      @c_def = ();
      @func_prototype = ();
      @cx_func_proto = ();
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
      $descs_code = "";
      $descl_code = "";
      sub get_key($ ) {
         my $len = 0;
         if ($_[0] =~ m/\"([^"]+)\"/) {
            $len = length($1);
            sprintf("%4.4d:$1", 9999 - $len);
         } else {
            "9999:";
         }
      }
      @outa = ();
      my @outp = ();
      foreach my $pp (@include_files, @cx_func_proto, @c_def
                  , @func_prototype) {
         if ($pp =~ m@^//@) {
            push(@outa, $_);
         } elsif ($pp =~ m@^(bool|long|double)@) {
            $pp =~ s/\s*\\\n\s*//smg;
            $pp =~ s/\n//smg;
            $pp =~ s/\s+/ /msg;
            $pp =~ s/\s+,/,/msg;
            if ($pp =~ m/^([a-z]+)\s+([A-Za-z]\w+)\((.*)\);/x) {
               my ($ret, $name, $args) = ($1, $2, $3);
               next if ($name =~ m/^lf_/);
               my $fi = "";
               foreach my $ar (split(/\s*,\s*/, $args)) {
                  $fi .= uc($1) if ($ar =~ m/(\S)/);
               }
               $ret = uc($1) if ($ret =~ m/(\S)/);
               if ($fi =~ m/C/) {
                  next; # func has const array args
               }
               $fi =~ s/[VN]+$//g; # rm void and null args
               $fi = "RPN_${ret}_$fi";
               push(@outp, "{$fi, \"$name\", {$name}},");
               if ($name =~ m/^cx(.*)/) {
                  my $uname = ($1);   # uc($1)
                  push(@outp, "{RPN_C_, \"$uname\","
                        . " {.dbl = $uname}},");
               }
            }
         }
      }
      @func_prototype = map {$_->[1];}
         sort {$a->[0] cmp $b->[0]}
         map {[get_key($_),$_]; } @outp;
      @cx_func_proto = ();
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_H) and $descs_code =~ m/\S/) {
      push(@outa, (<<EndOfDescC));
$desc_pre
#define ${packagename}_DESCRIPTION \\
$descl_code
#define ${packagename}_DESC \\
$descs_code
EndOfDescC
   }
   foreach (@outa, @c_def, @func_prototype, @cx_func_proto) {
      for my $ii (qw(double int long)) {
         s/(\s*$ii\s)($rxp_an)\[0\]/$1*$2 = NULL/x;
      }
   }
   unshift_outa("FUNC_PROTOTYPE", @func_prototype);
   unshift_outa("CX_FUNC_PROTO", @cx_func_proto);
   unshift_outa("C_DEF", @c_def);
   unshift_outa("INCLUDE", @include_files);
} elsif (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
   # PYTHON ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   my %consts = ();
   chomp($descs_code);
   chomp($descl_code);
   push(@outa, <<EndOfDescPython);
$desc_pre
def ${lcpn}_description():
${bq}return( \\
$descl_code
)
def ${lcpn}_desc():
${bq}return( \\
$descs_code
)
EndOfDescPython
} elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
   # BC --- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   chomp($descs_code);
   chomp($descl_code);
   push(@outa, <<EndOfDescBC);
$desc_pre
define ${lcpn}_description() {
${bq}print "Usage: bcc [Expression]\\n";
$descl_code;
}
define ${lcpn}_desc() {
${bq}print "Usage: bcc [Expression]\\n";
$descs_code;
}
EndOfDescBC

   sub toind($$$ )
   {
      my @aa = (@_);
      foreach ($aa[1], $aa[2]) {
         if (!m/^[a-zA-Z_0-9]+$/) {
            $_ = "($_)";
         }
      }
      "${aa[0]}[$bc_2darrdim{$aa[0]} * $aa[1] + $aa[2]]";
   }
   foreach (@outa) {
      if (m/(\w+)\[([^\]]+)\]\[([^\]]+)\]/ and defined($bc_2darrdim{$1})) {
         s/(\w+)\[([^\]]+)\]\[([^\]]+)\]/toind($1,$2,$3)/eg;
      }
      # replace uppercase names w/ lowercase equivalents
      while (s/^([^#"]*)\b(?!<\.)(\w*[A-Z]\w+)\b(?!\()/${1}cx\L$2/xm) {
         next;
      }
      s/^((cx\w+) = \(\2\);)/# $1/mg;
   }
} elsif (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
   # VBDOTNET --- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # VB6 -- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   # VisualBasic has a ridiculous limit on line continuations
   my $vbd = "desc_string";

   foreach ($descs_code, $descl_code) {
      s/^(.*:)/${bq}$vbd = $vbd _\n$1/mg;
      s/((.*\s_\n){12})/${bq}$vbd = $vbd _\n$1/mg;
      s/ _(\n\s+$vbd)/$1/mg;
      s/\s*_$//sg;
      s/^\s+$vbd = $vbd\n//mg;
   }

   chomp($descs_code);
   chomp($descl_code);
   push(@outa, <<EndOfDescVB);
$desc_pre
Public Function ${lcpn}_description() As String
${bq}Dim $vbd As String
${bq}$vbd = ""
$descl_code
${bq}${lcpn}_description = $vbd
End Function

Public Function ${lcpn}_desc() As String
${bq}Dim $vbd As String
${bq}$vbd = ""
$descs_code
${bq}${lcpn}_desc = $vbd
End Function

EndOfDescVB

   foreach (@outa, @vbglobal_vars, @cx_funs) {
      s/\"\\t\"/vbTab/g;
      s/\"\\n\"/vbLf/g;
      s/\"\\r\"/vbCr/g;
   }
}

my @currtime = (localtime());
my $varylog_curr = sprintf("%s %4.4d-%2.2d-%2.2d kdw "
         , $cmout0, $currtime[5] + 1900, $currtime[4] + 1
         , $currtime[3]);

if (Fwip_Translate::fwipt_lang_is(LANG_VARYLOG)) {
   @varylog_block = reverse sort @varylog_block;
   @outa = (@varylog_block);
} else {
   unshift_outa("Global-Variables", @vbglobal_vars);
   unshift_outa("Constant", @cx_funs);

   unshift(@outa
      , "$varylog_curr For Changelog, See File $packagename\.varylog"
      , Fwip_Translate::fwipt_initcode($packagename));

   my $end_code_block = "";

   if (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      # PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      $end_code_block = "1; $cmout0 Final return value";
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_H)) {
      # H - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      $end_code_block = "#endif $cmout0 #ifndef INCLUDED_${packagename}_h";
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_RPN)) {
      # RPN ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      $end_code_block = "#endif $cmout0 #ifndef INCLUDED_${packagename}_rpn";
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VBDOTNET)) {
      # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      $end_code_block = "End Class";
   }

   if ($end_code_block =~ m/\S/) {
      push(@outa, $end_code_block);
   }
}

my $curr_year = $currtime[5] + 1900;
unshift(@outa, "$cmout4 Copyright (C) $curr_year by Kevin D. Woerner");

if (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
   # join together all var decls into one decl.
   my $prev_line;
   for (my $sg = 0; $sg < $#outa; $sg++) {
      if ($outa[$sg] =~ m/^ +auto /) {
         if ($outa[$sg + 1] =~ m/^ *\# Global Bc +/) {
            splice(@outa, $sg + 1, 1);
            redo;
         }
         if ($outa[$sg + 1] =~ s/^ +auto +//) {
            $outa[$sg] =~ s/;$/", " . $outa[$sg + 1]/eg;
            splice(@outa, $sg + 1, 1);
            redo;
         }
         # in BC all arrays are auto sized
         $outa[$sg] =~ s/\[[^]]+\]/[]/g;
      }
      if ($outa[$sg] =~ s/^auto //) {
         $outa[$sg] =~ s/\];/] = 0;/;
         $outa[$sg] =~ s/\[\w+\]/[0]/g;
      }
   }
}
my @outb = ();
foreach my $llm (@outa) {
   die "HAS NULL:$llm" if ($llm =~ m/\0/);

   foreach (split(/\n/, $llm)) {
      if (m/\S/) {
         s/ +$//gs;
         chomp;
         push(@outb, $_);
      }
   }
}

$funcy_bcrx =~ s/^\|+//g;
$funcy_bcrx =~ s/\|\|+/\|/g;
my @outc = ();
foreach (@outb) {
   my $rrss = 0;
   while (s/([^a-z_A-Z0-9 )#])\((\b\w+)\)(?!\?)/$1""""$2''''/g) {
      s/\"\"\"\"(void|NULL|long|double|bool)\'\'\'\'/($1)/g;
      s/\"\"\"\"(.*?)\'\'\'\'/$1/g;
      last if (5 < $rrss++);
   }

   s/\((\([^()]+\))\)/$1/g;
   die $_ if (m/\binv\?/);
   s/ \+= -([0-9]+)\)/ -= $1)/g;
   if (Fwip_Translate::fwipt_lang_is(LANG_C)) {
      # C - ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/\b(cx\w*)/$1()/g;
      s/\(\)\(/(/g;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
      # BC  ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if ($funcy_bcrx =~ m/./) {
         while (s/^([^#]*[^|0-9a-zA-Z_])($funcy_bcrx)\b/$1cx\L$2/gmx) {
         }
      }
#      s/^([^#]*)\b([A-Z_][A-Z_]+)\b/$1cx\L$\2/g;
      if (m/^[^#]*$rxp_mn/) {
         s/$rxp_mn(\w+)/\L$1/g;
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_VBDOTNET)) {
      # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/\bPrivate Dim /Private Shared /g;
      s/Private lv_/Private Shared lv_/g;
      s/ Shared Shared/ Shared/g;
      s/ Shared Const / Const /g;
#      s/Private( Shared \w+\()/Friend $1/g;
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PERL)) {
      # PERL ---- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      if (m/^[^#]*$rxp_mn/) {
         s/($rxp_mn)/${1}::/g;
         s/\.::/::/g;
      }
   } elsif (Fwip_Translate::fwipt_lang_is(LANG_PYTHON)) {
      # PYTHON -- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
      s/\b$packagename\.\b//g;
   }

# --- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
   my $gh;
   do {
      $gh = s@\B(\(\d+\s*[-+/*]\s*-?\d+\))@ eval($1) @eg;

      $gh += s/\B\(\s*(\d+)\s*\)/$1/g;

      if (!m/$cmout0/ and s@(^.*[,=]\s*)
               ((?:-?\d+\s*[-+/*]\s*)+-?\d+)(\)|,\s*|\s*$|;)
            @ "$1" . eval($2) . "$3" @xmeg) {
         $gh++;
      }

      $gh += s@\b(\((\d+\ [-+/*]\ )+-?\d+\s*\))@ "(" . eval($1) . ")" @xeg;
      $gh += s/(\ [+-]\ \d+\ [-\+]\ -?\d+\s*)([\]\),;])
               / " + " . eval($1) ." $2" /xeg;
      $gh += s/ [+-] 0\s*\)/)/g;
      $gh += s/(\S) +,/$1,/g;
      $gh += s/([,=])\s+([+-])\s+(\d)/$1 $2$3/g;
      if (! Fwip_Translate::fwipt_lang_is(LANG_UNITS)) {
         $gh += s/ \+ - */ - /g;
      }
      $gh += s/(\w+) -(\d+)/$1 - $2/g;
   } while ($gh != 0);

   my $rr = length($_) - Fwip_Comment::FWIPC_LINE_LENGTH;
   if (0 < $rr) {
      if (s/##{$rr}##/###/) {
      } elsif (s@(\S.*) {$rr}($cmout0.)@$1$2@) {
      } elsif (s@^(\s*$cmout0\s)\s+@$1@) {
      } else {
         m/^(\s*)/;
         my $lead = "$1${bq}${bq}${bq}";
         my $new = "";
         my $cont = "";
         if (Fwip_Translate::fwipt_lang_is(LANG_VB6, LANG_VBDOTNET)) {
            # VBDOTNET  ----- ----- ----- ----- ----- ----- ----- ----- -----
            # VB6 ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            $cont = " _";
         } elsif (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
            # BC  ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            $cont = "\\";
         } elsif (Fwip_Translate::fwipt_lang_is(LANG_C, LANG_H, LANG_UNITS
                  , LANG_PYTHON, LANG_RPN)) {
            # C - ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            # H - ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            # RPN ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
            # UNITS --- ----- ----- ----- ----- ----- ----- ----- ----- -----
            # PYTHON -- ----- ----- ----- ----- ----- ----- ----- ----- -----
            $cont = "\\";
         }
         my $cxc = 0;
         my $mlm = Fwip_Comment::FWIPC_LINE_LENGTH + 1;
         my $mlmm = $mlm - length("${bq} ..");
         while (m/^.{$mlm}/m) {
            if (s/^(.{0,$mlmm}\S)([, ]|[*\/+-] \()//
                     or s/^(.{0,$mlmm}\()([^(])//) {
               my $ch = ($2 eq " " ? "" : $2);
               my $df = "$1$cont";
               if ($df =~ m/$cmout0/) {
                  $_ = "$cmout0$_";
               }
               push(@outc, $df);
               $_ = "$ch$_";
               s/^ +//;
               $_ = "$lead$_";
            } else {
               #die "UNBREAKABLE-LONG-LINE:"
               #      . length($_) . ":$_\n";
               last;
            }

            if (200 < $cxc++) {
               print STDERR "GIVE-UP-LONG-LINE:$_\n";
               last;
            }
         }
      }
   }

   push(@outc, $_);
}
@outb = ();

die if ($outc[0] !~ m/Copyright/);
if (Fwip_Translate::fwipt_lang_is(LANG_BC)) {
   # BC --- ----- ----- ----- ----- ----- ----- ----- ----- -----
   foreach (@outc) {
      # convert "e+?" to "E" in exponents
      die if (s/\b([0-9]+)e+?(-?[0-9]+)\b/${1}E$2/g);

      # BC doesn't like leading "+" on numbers
      s/= *([+-]) +(\(?[0-9])/= $1$2/g;
      s/= *\+ *(\(?[0-9]|\\)/= $1/g;
      s/ \+(\(?[0-9])/ $1/g;
      s/\( *\+ */(/g;
      s/, +/,/g;
      s/(\w*[A-Z]\w*?)\(/\L$1(/g;
      s/^( *(cx\w+) *= *\(\2\);.*)/#$1/gm;
   }
}

print join("\n", @outc, "");

if ($verbose_flag){
   Fwip_Translate::fwipt_keyword_printout();
}
