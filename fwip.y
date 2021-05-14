//   Copyright (C) 2018-2021 by Kevin D. Woerner
// 2021-05-13 kdw  minor var rename
// 2021-05-10 kdw  updated / reorg token values
// 2021-04-23 kdw  updated token values
// 2021-04-22 kdw  more tokens given string descriptors
// 2021-04-21 kdw  tokens given values
// 2021-04-16 kdw  rme refs to lang-fwipp
// 2021-03-28 kdw  long lines update
// 2021-03-02 kdw  hex number support I
// 2021-02-26 kdw  shift/redcue work
// 2021-02-18 kdw  string work II
// 2021-02-15 kdw  string work
// 2021-02-13 kdw  experiment
// 2021-02-01 kdw  yyerror exits; yylex calls yyerror
// 2020-08-20 kdw  boolean expr change
// 2020-07-30 kdw  clean up
// 2020-07-29 kdw  block-def work
// 2020-07-25 kdw  s/BITWISE/BIT/
// 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
// 2020-07-09 kdw  mode-extended rmd
// 2020-07-08 kdw  more verbose on error
// 2020-06-22 kdw  local-use decl before var decls
// 2020-06-17 kdw  "%" operator
// 2020-06-16 kdw  keywords changed
// 2020-06-04 kdw  allow ws between func and "("
// 2020-06-03 kdw  writeonly keyword
// 2020-05-30 kdw  CONST syntax change
// 2020-05-29 kdw  whitespace rework
// 2020-05-27 kdw  rework
// 2020-05-20 kdw  general work
// 2020-05-18 kdw  boolean func work
// 2020-05-16 kdw  r/r count reduction
// 2020-05-14 kdw  local funcs only in blocks
// 2020-05-13 kdw  all funcs return values
// 2020-05-12 kdw  language syntax
// 2020-05-11 kdw  REPL[A]CE replaced with LO[C]AL_CO[N]ST
// 2020-05-06 kdw  rmed boolean vars
// 2020-05-05 kdw  precedence work
// 2020-05-04 kdw  fwip test good
// 2020-05-01 kdw  reduce/reduce conflict work
// 2020-04-28 kdw  tweaks here and there
// 2020-04-22 kdw  more rework
// 2020-04-20 kdw  rework
// 2020-04-10 kdw  M[O]DE.* cleanup
// 2020-04-09 kdw  MO[D]E syntax change
// 2020-04-08 kdw  preprocessor sigil change
// 2020-04-02 kdw  new gcc complaint
// 2020-03-11 kdw  more work
// 2020-03-09 kdw  more work
// 2020-03-06 kdw  L[A]NG.* names
// 2020-03-05 kdw  keywords (TRU|FALS)[E]VAL changed
// 2020-03-01 kdw  .*_NE[X]T deprecated, et al.
// 2019-09-10 kdw  language_not keyword
// 2019-08-18 kdw  B[O]OL -> B[O]L
// 2019-08-17 kdw  L[O]G -> L[N]
// 2019-08-15 kdw  CON[S]TANT -> CON[S]T keyword change
// 2019-08-12 kdw  more work
// 2019-08-02 kdw  more work
// 2019-05-24 kdw  local keyword replacing private
// 2019-05-23 kdw  fu[n]ction keyword -> f[u]nc
// 2019-04-21 kdw  updated
// 2019-03-19 kdw  re[t]_val -> re[t]valu
// 2018-12-31 kdw  assign keyword
// 2018-11-19 kdw  (A[S]S)?(|M[U]L|D[I]V|A[D]D|S[U]B)
// 2018-07-25 kdw  work
// 2018-06-30 kdw  work
// 2018-06-27 kdw  const work
// 2018-06-19 kdw  languages
// 2018-06-15 kdw  work
// 2018-05-20 kdw  ubuntu work
// 2018-05-18 kdw  created
%{
   #include <stdio.h>
   #include <ctype.h>
   #include <math.h>
   struct YYSTYPE {
      int typef;
      double v_double;
      char v_str[240];
   };

   int yylex(struct YYSTYPE *lval_p);
   void yyerror (char const *);
%}

%define api.pure full
%define api.push-pull pull
%define api.value.type { struct YYSTYPE }

%token AND_KW              101 "AND"
%token ARRAY_END_KW        102 "ARRAY_END"
%token ARRAY_KW            103 "ARRAY"
%token AWAIT_END_KW        104 "AWAIT_END"
%token AWAIT_EXIT_KW       105 "AWAIT_EXIT"
%token AWAIT_KW            106 "AWAIT"
%token BLOCK_DEF_KW        107 "BLOCK_DEF"
%token BLOCK_END_KW        108 "BLOCK_END"
%token BLOCK_KW            109 "BLOCK"
%token BLOCK_USE_KW        110 "BLOCK_USE"
%token BOL_KW              111 "BOL"
%token BY_KW               112 "BY"
%token CALL_KW             113 "CALL"
%token CONST_KW            114 "CONST"
%token COUNT_KW            115 "COUNT"
%token DBL_KW              116 "DBL"
%token DIE_KW              117 "DIE"
%token ELSE_KW             118 "ELSE"
%token ELSIF_KW            119 "ELSIF"
%token FALSE_KW            120 "FALSE"
%token FOR_END_KW          121 "FOR_END"
%token FOR_EXIT_KW         122 "FOR_EXIT"
%token FOR_KW              123 "FOR"
%token FROM_KW             124 "FROM"
%token FUNC_END_KW         125 "FUNC_END"
%token FUNC_KW             126 "FUNC"
%token IF_END_KW           127 "IF_END"
%token IF_KW               128 "IF"
%token IMPORT_KW           129 "IMPORT"
%token IMPORT_MASTER_KW    130 "IMPORT_MASTER"
%token INT_KW              131 "INT"
%token LANGUAGE_END_KW     132 "LANGUAGE_END"
%token LANGUAGE_KW         133 "LANGUAGE"
%token LANGUAGE_NOT_KW     134 "LANGUAGE_NOT"
%token LANG_BC_KW          135 "LANG_BC"
%token LANG_C_KW           136 "LANG_C"
%token LANG_PERL_KW        137 "LANG_PERL"
%token LANG_PYTHON_KW      138 "LANG_PYTHON"
%token LANG_UNITS_KW       139 "LANG_UNITS"
%token LANG_VARYLOG_KW     140 "LANG_VARYLOG"
%token LANG_VB6_KW         141 "LANG_VB6"
%token LANG_VBDOTNET_KW    142 "LANG_VBDOTNET"
%token MODE_INTEGER_END_KW 143 "MODE_INTEGER_END"
%token MODE_INTEGER_KW     144 "MODE_INTEGER"
%token NOT_KW              145 "NOT"
%token NUL_KW              146 "NUL"
%token OR_KW               147 "OR"
%token READONLY_KW         148 "READONLY"
%token REDIM_KW            149 "REDIM"
%token RETURN_KW           150 "RETURN"
%token STRING_NL_KW        151 "STRING_NL"
%token STRING_TAB_KW       152 "STRING_TAB"
%token STR_KW              153 "STR"
%token TO_KW               154 "TO"
%token TRUE_KW             155 "TRUE"
%token WHILE_END_KW        156 "WHILE_END"
%token WHILE_EXIT_KW       157 "WHILE_EXIT"
%token WHILE_KW            158 "WHILE"
%token WRITEABLE_KW        159 "WRITEABLE"
%token WRITEONLY_KW        160 "WRITEONLY"
%token XOR_KW              161 "XOR"

%token COMMENT             199

%token ARRAY_CLOSE_TK      201 "]"
%token ARRAY_OPEN_TK       202 "["
%token COMMA_TK            203 ","
%token INDENT_TK           204 ":"
%token PAREN_CLOSE_TK      205 ")"
%token PAREN_OPEN_TK       206 "("
%token STATEMENT_END_TK    207 ";"
%token ASSIGN_TK           208 "="
%token ASSADD_TK           209 "+="
%token ASSSUB_TK           210 "-="
%token ASSMUL_TK           211 "*="
%token ASSDIV_TK           212 "/="
%token ASSMOD_TK           213 "%="
%token ADD_TK              214 "+"
%token SUB_TK              215 "-"
%token MUL_TK              216 "*"
%token DIV_TK              217 "/"
%token MOD_TK              218 "%"
%token CMP_EQ_TK           219 "=="
%token CMP_GT_TK           220 ">"
%token CMP_GE_TK           221 ">="
%token CMP_LE_TK           222 "<="
%token CMP_LT_TK           223 "<"
%token CMP_NE_TK           224 "<>"

%token STRING_EXPLICIT     231
%token DOUBLE_EXPLICIT     232
%token INTEGER_EXPLICIT    233

%token VAR_NAME            240
%token VAR_NAME_DEF        241
%token ARR_NAME            242
%token ARR_NAME_DEF        243
%token CONST_NAME          244
%token CONST_NAME_DEF      245
%token FUNC_NAME           246
%token FUNC_NAME_DEF       247

%token ABSL_FUN_KW         300 "ABSL"
%token ABS_FUN_KW          301 "ABS"
%token ARRAYLAST_FUN_KW    302 "ARRAYLAST"
%token ATAN2_FUN_KW        303 "ATAN2"
%token BITSHIFTL_FUN_KW    304 "BITSHIFTL"
%token BITSHIFTR_FUN_KW    305 "BITSHIFTR"
%token BITAND_FUN_KW       306 "BITAND"
%token BITNOT_FUN_KW       307 "BITNOT"
%token BITOR_FUN_KW        308 "BITOR"
%token BITXOR_FUN_KW       309 "BITXOR"
%token CEILL_FUN_KW        310 "CEILL"
%token CEIL_FUN_KW         311 "CEIL"
%token COS_FUN_KW          312 "COS"
%token EXP_FUN_KW          313 "EXP"
%token FLOORL_FUN_KW       314 "FLOORL"
%token FLOOR_FUN_KW        315 "FLOOR"
%token LN_FUN_KW           316 "LN"
%token MOD_FUN_KW          317 "MOD"
%token POW_FUN_KW          318 "POW"
%token PRINTSTR_FUN_KW     319 "PRINTSTR"
%token PRINTVAL_FUN_KW     320 "PRINTVAL"
%token SIN_FUN_KW          321 "SIN"
%token SQRT_FUN_KW         322 "SQRT"
%token TAN_FUN_KW          323 "TAN"

 //%precedence "AND" "OR" "XOR"
%left "+" "-"
%precedence "*" "/" "%"

// Grammar rules and actions follow.

%%

fwip_program :
   fwip_import
   fwip_code_ge1 ;

fwip_code_eq1 :
   COMMENT
   | const_def_eq1
   | func_def_eq1
   | BLOCK_KW ":" block_defs_ge1 fwip_code_ge0 BLOCK_END_KW
   | language_start_eq1 language_ge1 ":" fwip_code_ge1 LANGUAGE_END_KW ;

fwip_code_ge1 :
   fwip_code_eq1
   | fwip_code_eq1 fwip_code_ge1 ;

fwip_code_ge0 :
   %empty
   | fwip_code_ge1 ;

comment_ge0 :
   %empty
   | comment_ge0 COMMENT ;

language_eq1 :
   LANG_PERL_KW | LANG_PYTHON_KW | LANG_BC_KW | LANG_C_KW | LANG_VB6_KW
   | LANG_VARYLOG_KW | LANG_UNITS_KW | LANG_VBDOTNET_KW ;

language_ge1:
   language_eq1
   | language_eq1 language_ge1 ;

language_start_eq1 :
   LANGUAGE_KW | LANGUAGE_NOT_KW ;

vartype_kws :
   STR_KW | INT_KW | DBL_KW | BOL_KW ;

func_retval_kws :
   INT_KW | DBL_KW ;

import_ge0 :
   comment_ge0
   | import_ge0 IMPORT_KW STRING_EXPLICIT ";" ;

fwip_import :
   import_ge0
   | comment_ge0 IMPORT_MASTER_KW ";" ;

func_call_DretD_name :
   FLOOR_FUN_KW
   | CEIL_FUN_KW
   | SQRT_FUN_KW
   | ABS_FUN_KW
   | SIN_FUN_KW
   | COS_FUN_KW
   | TAN_FUN_KW
   | EXP_FUN_KW
   | LN_FUN_KW ;

func_call_DDretD_name :
   ATAN2_FUN_KW
   | POW_FUN_KW ;

func_call_DretL_name :
   FLOORL_FUN_KW
   | CEILL_FUN_KW ;

func_call_LretL_name :
   ABSL_FUN_KW
   | BITNOT_FUN_KW ;

func_call_LLretL_name :
   MOD_FUN_KW
   | BITAND_FUN_KW
   | BITXOR_FUN_KW
   | BITOR_FUN_KW
   | BITSHIFTL_FUN_KW
   | BITSHIFTR_FUN_KW ;

func_def_eq1 :
   FUNC_KW func_retval_kws FUNC_NAME_DEF "(" funcarg_decl_ge0 ")" ":"
         variable_decls
         fwip_statement_ge0
         RETURN_KW num_expr_eq1 ";"
         comment_ge0
      FUNC_END_KW
   | FUNC_KW BOL_KW FUNC_NAME_DEF "(" funcarg_decl_ge0 ")" ":"
         variable_decls
         fwip_statement_ge0
         RETURN_KW bol_expr_com ";"
         comment_ge0
      FUNC_END_KW ;

num_binary_op : "+" | "-" | "*" | "/" | "%" ;
num_cmp_eq1 : "==" | "<>" | ">=" | ">" | "<=" | "<" ;
assignment_op : "*=" | "+=" | "-=" | "/=" | "%=" ;
bool_val: TRUE_KW | FALSE_KW ;
bool_binary_op : AND_KW | OR_KW | XOR_KW  ;

num_expr_eq1 :
   num_expr_eq1 num_binary_op num_expr_eq1
   //   num_expr_eq1 "+" num_expr_eq1
   //   | num_expr_eq1 "-" num_expr_eq1
   //   | num_expr_eq1 "*" num_expr_eq1
   //   | num_expr_eq1 "/" num_expr_eq1
   //   | num_expr_eq1 "%" num_expr_eq1
   | ARRAYLAST_FUN_KW "(" ARR_NAME "[" "]" ")"
   | func_call_DretD_name "(" num_expr_eq1 ")"
   | func_call_DretL_name "(" num_expr_eq1 ")"
   | func_call_LretL_name "(" num_expr_eq1 ")"
   | func_call_DDretD_name "(" num_expr_eq1 "," num_expr_eq1 ")"
   | func_call_LLretL_name "(" num_expr_eq1 "," num_expr_eq1 ")"
   | FUNC_NAME "(" funcarg_ge0 ")"
   | assignable_value_eq1
   | "(" num_expr_eq1 ")"
   | "+" num_expr_eq1
   | "-" num_expr_eq1
   | DOUBLE_EXPLICIT
   | INTEGER_EXPLICIT
   | CONST_NAME ;

assignable_value_eq1 :
   VAR_NAME
   | ARR_NAME "[" num_expr_eq1 "]"
   | ARR_NAME "[" num_expr_eq1 "]" "[" num_expr_eq1 "]" ;

bol_expr_com :
   num_expr_eq1 num_cmp_eq1 num_expr_eq1
   //   num_expr_eq1 "<" num_expr_eq1
   //   | num_expr_eq1 "<=" num_expr_eq1
   //   | num_expr_eq1 "<>" num_expr_eq1
   //   | num_expr_eq1 ">" num_expr_eq1
   //   | num_expr_eq1 ">=" num_expr_eq1
   //   | num_expr_eq1 "==" num_expr_eq1
   | NOT_KW bol_expr_com
   | bol_expr_com bool_binary_op bol_expr_com
   //   | bol_expr_com AND_KW bol_expr_com
   //   | bol_expr_com OR_KW bol_expr_com
   //   | bol_expr_com XOR_KW bol_expr_com
   | "(" bol_expr_com ")"
   | num_expr_eq1 ;

fwip_statement_eq1 :
   assignable_value_eq1 assignment_op num_expr_eq1 ";"
   | assignable_value_eq1 "=" num_expr_eq1 ";"
   | assignable_value_eq1 "=" bool_val ";"
   | COMMENT
   | IF_KW bol_expr_com ":" fwip_statement_ge1 elseif_ge0 else_le1 IF_END_KW
   | WHILE_KW bol_expr_com ":" fwip_statement_ge1 WHILE_END_KW
   | FOR_KW VAR_NAME for_ftb_le1 ":" fwip_statement_ge1 FOR_END_KW
   | AWAIT_KW bol_expr_com count_num_le1 ":" fwip_statement_ge1 AWAIT_END_KW
   | ARRAY_KW ARR_NAME "[" "]" ":" array_val_ge1 ARRAY_END_KW
   | REDIM_KW ARR_NAME "[" "]" "," num_expr_eq1 ";"
   | REDIM_KW ARR_NAME "[" "]" ";"
   | WHILE_EXIT_KW ";"
   | FOR_EXIT_KW ";"
   | AWAIT_EXIT_KW ";"
   | PRINTSTR_FUN_KW "(" string_sub ")" ";"
   | PRINTVAL_FUN_KW "(" num_expr_eq1 ")" ";"
   | CALL_KW FUNC_NAME "(" funcarg_ge0 ")" ";"
   | language_start_eq1 language_ge1 ":" fwip_statement_ge1 LANGUAGE_END_KW
   | MODE_INTEGER_KW ":" fwip_statement_ge1 MODE_INTEGER_END_KW
   | DIE_KW STRING_EXPLICIT ";" ;

fwip_statement_ge1 :
   fwip_statement_eq1
   | fwip_statement_eq1 fwip_statement_ge1 ;

fwip_statement_ge0 :
   %empty
   | fwip_statement_ge1 ;

elseif_ge0 :
   %empty
   | ELSIF_KW bol_expr_com ":" fwip_statement_ge1 elseif_ge0 ;

else_le1 :
   %empty
   | ELSE_KW ":" fwip_statement_ge1 ;

for_by_le1 :
   %empty
   | BY_KW num_expr_eq1 ;

for_to_le1 :
   %empty
   | TO_KW num_expr_eq1 ;

for_ftb_le1 :
   FROM_KW num_expr_eq1 for_to_le1 for_by_le1 ;

count_num_le1 :
   %empty
   | COUNT_KW VAR_NAME for_ftb_le1 ;

variable_decl_eq1 :
   vartype_kws VAR_NAME_DEF ";"
   | vartype_kws ARR_NAME_DEF "[" num_expr_eq1 "]" ";"
   | vartype_kws ARR_NAME_DEF "[" "]" ";" ;

variable_decl_ge0 :
   comment_ge0
   | variable_decl_ge0
      variable_decl_eq1 ;

variable_decls :
   block_use_ge0
   variable_decl_ge0 ;

funcarg_decl_eq1 :
   vartype_kws VAR_NAME_DEF
   | READONLY_KW vartype_kws ARR_NAME_DEF "[" "]"
   | WRITEONLY_KW vartype_kws ARR_NAME_DEF "[" "]"
   | WRITEABLE_KW vartype_kws ARR_NAME_DEF "[" "]" ;

funcarg_decl_ge1 :
   funcarg_decl_eq1
   | funcarg_decl_ge1 "," funcarg_decl_eq1 ;

funcarg_decl_ge0 :
   NUL_KW
   | funcarg_decl_ge1 ;

funcarg_eq1 :
   num_expr_eq1
   | ARR_NAME "[" "]"
   | bool_val ;

funcarg_ge1 :
   funcarg_eq1
   | funcarg_eq1 "," funcarg_ge1;

funcarg_ge0 :
   %empty
   | funcarg_ge1 ;

string_sub :
   STRING_EXPLICIT
   | STRING_TAB_KW
   | STRING_NL_KW ;

string_eq1:
   string_sub
   | string_eq1 string_sub ;

const_def_eq1 :
   CONST_KW CONST_NAME_DEF num_expr_eq1 ";"
   | CONST_KW CONST_NAME_DEF string_eq1 ";" ;

const_def_ge1 :
   const_def_eq1
   | const_def_eq1 const_def_ge1 ;

block_use_eq1 :
   BLOCK_USE_KW VAR_NAME ";"
   | BLOCK_USE_KW ARR_NAME "[" "]" ";"
   | BLOCK_USE_KW ARR_NAME "[" "]" "[" "]" ";" ;

block_use_ge0 :
   %empty
   | block_use_ge0 comment_ge0 block_use_eq1 ;

dim :
   CONST_NAME
   | INTEGER_EXPLICIT ;

var_def_eq1 :
   vartype_kws VAR_NAME_DEF ";"
   | vartype_kws VAR_NAME_DEF "=" num_expr_eq1 ";"
   | vartype_kws ARR_NAME_DEF "[" dim "]" ";"
   | vartype_kws ARR_NAME_DEF "[" dim "]" "[" dim "]" ";" ;

block_const_def_ge1 :
   block_const_def_ge1 comment_ge0 BLOCK_DEF_KW const_def_eq1
   | comment_ge0 BLOCK_DEF_KW const_def_eq1 ;

block_var_def_ge1 :
   block_var_def_ge1 comment_ge0 BLOCK_DEF_KW var_def_eq1
   | comment_ge0 BLOCK_DEF_KW var_def_eq1 ;

block_func_def_ge1 :
   block_func_def_ge1 comment_ge0  BLOCK_DEF_KW func_def_eq1
   | comment_ge0 BLOCK_DEF_KW func_def_eq1 ;

block_defs_ge1 :
   block_const_def_ge1 block_var_def_ge1 block_func_def_ge1 func_def_eq1
   | block_const_def_ge1 block_func_def_ge1 func_def_eq1
   | block_const_def_ge1 block_var_def_ge1  func_def_eq1
   | block_var_def_ge1   block_func_def_ge1 func_def_eq1
   | block_const_def_ge1 comment_ge0        func_def_eq1
   | block_const_def_ge1 comment_ge0        const_def_ge1
   | block_var_def_ge1   func_def_eq1
   | block_func_def_ge1  func_def_eq1 ;

array_val_eq1 :
   comment_ge0 num_expr_eq1 ";" ;

array_val_ge1 :
   array_val_eq1
   | array_val_eq1 array_val_ge1 ;

%%

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
enum {
   ERROR_VALUE = -2,
   EOF_VALUE = 0,
};

static int
isword(char ch)
{
   return (isalnum((int)ch) || ch == '_');
}
static int str_eq(const char *sa_pc
         , const char *sb_pc)
{
   size_t b_len;

   b_len = strlen(sb_pc);
   return (strncmp(sa_pc, sb_pc, b_len + 1) == 0 && !isword(sa_pc[b_len]));
}

static int
check_var_type(int tdef)
{
   return (tdef == DBL_KW || tdef == INT_KW || tdef == BOL_KW);
}

#define LINE_INC(xx_cc) \
   xx_cc = getc(stdin); \
   if (xx_cc == '\n' || xx_cc == '\r') { line_number++; }

#define LINE_DEC(xx_cc)  \
   if (xx_cc == '\r' || xx_cc == '\n') { line_number--; } \
   ungetc(xx_cc, stdin);

#define READ_INCLUDE(xx_var, xx_ptr, xx_test) \
   for (;;) { \
      LINE_INC(xx_var); *xx_ptr = xx_var; xx_ptr++; \
      if (xx_var == EOF || xx_test) { break; /* loop */ } \
   } \
   *xx_ptr = '\0'

#define READ_EXCLUDE(xx_var, xx_ptr, xx_test) \
   for (;;) { \
      LINE_INC(xx_var); \
      if (xx_var == EOF || xx_test) { LINE_DEC(xx_var); break; /* loop */ } \
      *xx_ptr = xx_var; xx_ptr++; \
   } \
   *xx_ptr = '\0'

#define SKIP_WS(xx_cc) \
   for (;;) { \
      LINE_INC(xx_cc); \
      if (!isspace(xx_cc)) { LINE_DEC(xx_cc); break;  /*loop */ } \
   }

#define IF_KWRD(xx_str) \
   if (str_eq(lval_p->v_str, #xx_str)) { retvalu = xx_str ## _KW; }

#define IF_FUNC(xx_str) \
   if (str_eq(lval_p->v_str, #xx_str)) { retvalu = xx_str ## _FUN_KW; }

#define CHECK1(xx_ch, xx_oo) \
   if (cc == xx_ch) { retvalu = xx_oo; }

#define CHECK2(xx_ch1, xx_oa, xx_ch2, xx_ob) \
   if (cc == xx_ch1) { LINE_INC(cc); \
      if (cc == xx_ch2) { *v_p = cc; v_p++; retvalu = xx_ob; \
      } else if (cc != EOF) { LINE_DEC(cc); retvalu = xx_oa; } \
   }

#define CHECK3(xx_ch1, xx_oa, xx_ch2, xx_ob, xx_ch3, xx_oc) \
   if (cc == xx_ch1) { LINE_INC(cc); \
      if (cc == xx_ch2) { *v_p = cc; v_p++; retvalu = xx_ob; \
      } else if (cc == xx_ch3) { *v_p = cc; v_p++; retvalu = xx_oc; \
      } else if (cc != EOF) { LINE_DEC(cc); retvalu = xx_oa; } \
   }

static int line_number = 1;
static const char *program_name = NULL;
int
yylex(struct YYSTYPE *lval_p)
{
   int cc = 'A';
   char *v_p;
   int retvalu;
   int saw;
   static int prev_typdef = -1;

   // Skip white space.
   SKIP_WS(cc);
   if (cc == EOF) {
      // Return end-of-input.
      lval_p->typef = EOF_VALUE;
      return lval_p->typef;
   }
   cc = getc(stdin);
   v_p = &lval_p->v_str[0];
   *v_p = cc;
   v_p++;
   *v_p = '\0';
   retvalu = ERROR_VALUE;
   if (cc == '#') {
      READ_EXCLUDE(cc, v_p, cc == '\r' || cc == '\n');
      retvalu = COMMENT;
   } else if (cc == '"') {
      READ_INCLUDE(cc, v_p, cc == '"');
      retvalu = STRING_EXPLICIT;
   } else if (cc == '.' || isdigit(cc)) {
      // Process numbers.
      saw = INTEGER_EXPLICIT;
      for (;;) {
         LINE_INC(cc);
         if (cc == '.') {
            if (saw != INTEGER_EXPLICIT) {
               lval_p->typef = ERROR_VALUE;
               return lval_p->typef;
            }
            saw = DOUBLE_EXPLICIT;
         }
         if (isdigit(cc) || cc == '.') {
            *v_p = cc;
            v_p++;
         } else if (lval_p->v_str[0] == '0'  && cc == 'x'
                     && v_p == &lval_p->v_str[1]) {
            *v_p = cc;
            v_p++;
            for (;;) {
               LINE_INC(cc);
               if (!isxdigit(cc)) {
                  break;
               }
               *v_p = cc;
               v_p++;
            }
            break;
         } else {
            break;
         }
      }
      *v_p = '\0';
      if (cc == 'E' || cc == 'e') { // flt pt exponential number
         saw = DOUBLE_EXPLICIT;
         *v_p = cc;
         v_p++;
         LINE_INC(cc);
         if (cc == '-' || cc == '+') { // optional sign
            *v_p = cc;
            v_p++;
            LINE_INC(cc);
         }
         while (isdigit(cc)) {  // exponent
            *v_p = cc;
            v_p++;
            LINE_INC(cc);
         }
      }
      *v_p = '\0';
      LINE_DEC(cc);
      sscanf(lval_p->v_str, "%lf", &lval_p->v_double);

      retvalu = saw;
   } else if (isupper(cc)) {
      READ_EXCLUDE(cc, v_p, !(isword(cc) || cc == '.'));
      IF_KWRD(AND)
      else IF_KWRD(ARRAY)
      else IF_KWRD(ARRAY_END)
      else IF_KWRD(AWAIT)
      else IF_KWRD(AWAIT_END)
      else IF_KWRD(AWAIT_EXIT)
      else IF_KWRD(BLOCK)
      else IF_KWRD(BLOCK_DEF)
      else IF_KWRD(BLOCK_END)
      else IF_KWRD(BLOCK_USE)
      else IF_KWRD(BOL)
      else IF_KWRD(BY)
      else IF_KWRD(CALL)
      else IF_KWRD(CONST)
      else IF_KWRD(COUNT)
      else IF_KWRD(DBL)
      else IF_KWRD(DIE)
      else IF_KWRD(ELSE)
      else IF_KWRD(ELSIF)
      else IF_KWRD(FALSE)
      else IF_KWRD(FOR)
      else IF_KWRD(FOR_END)
      else IF_KWRD(FOR_EXIT)
      else IF_KWRD(FROM)
      else IF_KWRD(FUNC)
      else IF_KWRD(FUNC_END)
      else IF_KWRD(IF)
      else IF_KWRD(IF_END)
      else IF_KWRD(IMPORT)
      else IF_KWRD(IMPORT_MASTER)
      else IF_KWRD(INT)
      else IF_KWRD(LANGUAGE)
      else IF_KWRD(LANGUAGE_END)
      else IF_KWRD(LANGUAGE_NOT)
      else IF_KWRD(LANG_BC)
      else IF_KWRD(LANG_C)
      else IF_KWRD(LANG_PERL)
      else IF_KWRD(LANG_PYTHON)
      else IF_KWRD(LANG_UNITS)
      else IF_KWRD(LANG_VARYLOG)
      else IF_KWRD(LANG_VB6)
      else IF_KWRD(LANG_VBDOTNET)
      else IF_KWRD(MODE_INTEGER)
      else IF_KWRD(MODE_INTEGER_END)
      else IF_KWRD(NOT)
      else IF_KWRD(NUL)
      else IF_KWRD(OR)
      else IF_KWRD(READONLY)
      else IF_KWRD(REDIM)
      else IF_KWRD(RETURN)
      else IF_KWRD(STR)
      else IF_KWRD(STRING_NL)
      else IF_KWRD(STRING_TAB)
      else IF_KWRD(TO)
      else IF_KWRD(TRUE)
      else IF_KWRD(WHILE)
      else IF_KWRD(WHILE_END)
      else IF_KWRD(WHILE_EXIT)
      else IF_KWRD(WRITEABLE)
      else IF_KWRD(WRITEONLY)
      else IF_KWRD(XOR)
      else {
         if (isspace(cc)) {
            SKIP_WS(cc);
         }
         if (prev_typdef == CONST_KW) {
            retvalu = CONST_NAME_DEF;
         } else if (cc == '(') {
            IF_FUNC(ABS)
            else IF_FUNC(ABSL)
            else IF_FUNC(ARRAYLAST)
            else IF_FUNC(ATAN2)
            else IF_FUNC(BITSHIFTL)
            else IF_FUNC(BITSHIFTR)
            else IF_FUNC(BITAND)
            else IF_FUNC(BITNOT)
            else IF_FUNC(BITOR)
            else IF_FUNC(BITXOR)
            else IF_FUNC(CEIL)
            else IF_FUNC(CEILL)
            else IF_FUNC(COS)
            else IF_FUNC(EXP)
            else IF_FUNC(FLOOR)
            else IF_FUNC(FLOORL)
            else IF_FUNC(LN)
            else IF_FUNC(MOD)
            else IF_FUNC(POW)
            else IF_FUNC(PRINTSTR)
            else IF_FUNC(PRINTVAL)
            else IF_FUNC(SIN)
            else IF_FUNC(SQRT)
            else IF_FUNC(TAN)
            else if (check_var_type(prev_typdef)) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            retvalu = CONST_NAME;
         }
      }
   } else if (islower(cc)) {
      READ_EXCLUDE(cc, v_p, !(islower(cc) || isdigit(cc) || cc == '.'
               || cc == '_'));

      if (isupper(cc)) {
         READ_EXCLUDE(cc, v_p, !(isalnum(cc) || cc == '.' || cc == '_'));
         if (isspace(cc)) {
            SKIP_WS(cc);
         }
         if (cc == '(') { // if fail char is '('
            if (check_var_type(prev_typdef)) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            if (prev_typdef == CONST_KW) {
               retvalu = CONST_NAME_DEF;
            } else {
               retvalu = CONST_NAME;
            }
         }
      } else {
         if (isspace(cc)) {
            SKIP_WS(cc);
         }
         if (cc == '[') { // if fail char is '['
            if (check_var_type(prev_typdef)) {
               retvalu = ARR_NAME_DEF;
            } else {
               retvalu = ARR_NAME;
            }
         } else if (cc == '(') { // if fail char is '('
            if (check_var_type(prev_typdef)) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            if (prev_typdef == CONST_KW) {
               retvalu = CONST_NAME_DEF;
            } else if (check_var_type(prev_typdef)) {
               retvalu = VAR_NAME_DEF;
            } else {
               retvalu = VAR_NAME;
            }
         }
      }
   }
   else CHECK1(';', STATEMENT_END_TK)
   else CHECK1(':', INDENT_TK)
   else CHECK1(',', COMMA_TK)
   else CHECK1('(', PAREN_OPEN_TK)
   else CHECK1(')', PAREN_CLOSE_TK)
   else CHECK1('[', ARRAY_OPEN_TK)
   else CHECK1(']', ARRAY_CLOSE_TK)
   else CHECK2('+', ADD_TK, '=', ASSADD_TK)
   else CHECK2('-', SUB_TK, '=', ASSSUB_TK)
   else CHECK2('*', MUL_TK, '=', ASSMUL_TK)
   else CHECK2('/', DIV_TK, '=', ASSDIV_TK)
   else CHECK2('%', MOD_TK, '=', ASSMOD_TK)
   else CHECK2('=', ASSIGN_TK, '=', CMP_EQ_TK)
   else CHECK2('>', CMP_GT_TK, '=', CMP_GE_TK)
   else CHECK3('<', CMP_LT_TK, '=', CMP_LE_TK, '>', CMP_NE_TK)
   else {
      fprintf(stderr, "%-6d %-4d *******Unparsed-Char:0x%2.2X\n", line_number
               , retvalu, cc);
      yyerror(&lval_p->v_str[0]);
   }
   *v_p = '\0';
   printf("%-6d %-4d %s\n", line_number, retvalu, &lval_p->v_str[0]);
   lval_p->typef = retvalu;

   prev_typdef = lval_p->typef;
   return lval_p->typef;
}
// Called by yyparse on error.
void
yyerror(char const *ss)
{
   int ii;
   int cc;

   fprintf(stderr, "%-6d %-4s *******%s-PARSING-ERROR:%s\n", line_number, "-"
            , program_name, ss);
   ii = 0;
   fprintf(stderr, "%-6d %-4s", line_number, "-");
   while (ii < 8) {
      cc = getc(stdin);
      if (cc == EOF) {
         break;  // loop
      }
      fprintf(stderr, "%c", cc);
      if (cc == '\n') {
         ii++;
         line_number++;
         fprintf(stderr, "%-6d %-4s", line_number, "-");
      }
   }
   exit(-1);
}

int
main(int argc
         , const char **argv_ppc)
{
   int jj;

   (void)argc;
   program_name = argv_ppc[0];
   jj = yyparse();
   fprintf(stderr, "%s:", argv_ppc[0]);
   if (jj != 0) {
      fprintf(stderr, "ABJECT FAILURE:%d\n", jj);
   } else {
      fprintf(stderr, "SUCCESS\n");
   }
   return(jj);
}
