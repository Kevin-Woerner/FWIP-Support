//   Copyright (C) 2018-2020 by Kevin D. Woerner
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

%token ABSL_FUN_KW
%token ABS_FUN_KW
%token AND_KW
%token ARRAYLAST_FUN_KW
%token ARRAY_END_KW
%token ARRAY_KW
%token ATAN2_FUN_KW
%token AWAIT_END_KW
%token AWAIT_EXIT_KW
%token AWAIT_KW
%token BITSHIFTL_FUN_KW
%token BITSHIFTR_FUN_KW
%token BITWISEAND_FUN_KW
%token BITWISENOT_FUN_KW
%token BITWISEOR_FUN_KW
%token BITWISEXOR_FUN_KW
%token BLOCK_END_KW
%token BLOCK_KW
%token BOL_KW
%token BY_KW
%token CALL_KW
%token CEILL_FUN_KW
%token CEIL_FUN_KW
%token CONST_KW
%token COS_FUN_KW
%token COUNT_KW
%token DBL_KW
%token DIE_KW
%token ELSE_KW
%token ELSIF_KW
%token EXP_FUN_KW
%token FALSE_KW
%token FLOORL_FUN_KW
%token FLOOR_FUN_KW
%token FOR_END_KW
%token FOR_EXIT_KW
%token FOR_KW
%token FROM_KW
%token FUNC_END_KW
%token FUNC_KW
%token IF_END_KW
%token IF_KW
%token IMPORT_KW
%token INT_KW
%token LANGUAGE_END_KW
%token LANGUAGE_KW
%token LANGUAGE_NOT_KW
%token LANG_BC_KW
%token LANG_C_KW
%token LANG_FWIPP_KW
%token LANG_PERL_KW
%token LANG_PYTHON_KW
%token LANG_UNITS_KW
%token LANG_VARYLOG_KW
%token LANG_VB6_KW
%token LANG_VBDOTNET_KW
%token LN_FUN_KW
%token LOCAL_BOL_KW
%token LOCAL_CONST_KW
%token LOCAL_DBL_KW
%token LOCAL_FUNC_KW
%token LOCAL_INT_KW
%token LOCAL_STR_KW
%token LOCAL_USE_KW
%token MASTER_KW
%token MODE_INTEGER_END_KW
%token MODE_INTEGER_KW
%token MOD_FUN_KW
%token NOT_KW
%token NUL_KW
%token OR_KW
%token POW_FUN_KW
%token PRINTSTR_FUN_KW
%token PRINTVAL_FUN_KW
%token READONLY_KW
%token REDIM_KW
%token RETURN_KW
%token SIN_FUN_KW
%token SQRT_FUN_KW
%token STRING_NL_KW
%token STRING_TAB_KW
%token STR_KW
%token TAN_FUN_KW
%token TO_KW
%token TRUE_KW
%token WHILE_END_KW
%token WHILE_EXIT_KW
%token WHILE_KW
%token WRITEABLE_KW
%token WRITEONLY_KW
%token XOR_KW

%token ARRAY_CLOSE_TOKEN   "]"
%token ARRAY_OPEN_TOKEN    "["
%token COMMA_TOKEN         ","
%token INDENT_TOKEN        ":"
%token PAREN_CLOSE_TOKEN   ")"
%token PAREN_OPEN_TOKEN    "("
%token STATEMENT_END_TOKEN ";"
%token ASSIGN_TOKEN        "="
%token ASSADD_TOKEN        "+="
%token ASSSUB_TOKEN        "-="
%token ASSMUL_TOKEN        "*="
%token ASSDIV_TOKEN        "/="
%token ASSMOD_TOKEN        "%="
%token ADD_TOKEN           "+"
%token SUB_TOKEN           "-"
%token MUL_TOKEN           "*"
%token DIV_TOKEN           "/"
%token MOD_TOKEN           "%"
%token CMP_EQ_TOKEN        "=="
%token CMP_GT_TOKEN        ">"
%token CMP_GE_TOKEN        ">="
%token CMP_LE_TOKEN        "<="
%token CMP_LT_TOKEN        "<"
%token CMP_NE_TOKEN        "<>"

%token COMMENT
%token STRING_EXPLICIT
%token DOUBLE_EXPLICIT
%token INTEGER_EXPLICIT

%token ARR_NAME
%token ARR_NAME_DEF
%token CONST_NAME
%token CONST_NAME_DEF
%token FUNC_NAME
%token FUNC_NAME_DEF
%token VAR_NAME
%token VAR_NAME_DEF

%left AND_KW OR_KW XOR_KW
%left NOT_KW
%left "+=" "-=" "*=" "/="
%left "==" "<" "<=" ">" ">=" "<>"
%left "+" "-"
%left "*" "/" "%"
%left "(" ")" "[" "]"

// Grammar rules and actions follow.

%%
fwip_program :
   comment_ge0
   fwip_import
   chunk_ge1 ;

chunk_eq1 :
   comment_ge1
   | CONST_KW CONST_NAME_DEF num_expr_eq1 ";"
   | FUNC_KW funcret_set FUNC_NAME_DEF "("
         funcarg_decl_ge0 ")" ":"
         variable_decls
         fwip_statement_ge0
         RETURN_KW num_expr_eq1 ";"
         comment_ge0
      FUNC_END_KW
   | FUNC_KW BOL_KW FUNC_NAME_DEF "("
         funcarg_decl_ge0 ")" ":"
         variable_decls
         fwip_statement_ge0
         RETURN_KW bol_expr_com ";"
         comment_ge0
      FUNC_END_KW
   | BLOCK_KW ":"
      comment_ge0
      local_const_ge0
      local_decl_ge0
      local_func_ge0
      chunk_ge1
      BLOCK_END_KW
   | language_start_eq1 language_ge1 ":"
      chunk_ge1
      LANGUAGE_END_KW ;

chunk_ge1 :
   chunk_eq1
   | chunk_eq1
      chunk_ge1 ;

comment_ge1 :
   COMMENT
   | COMMENT comment_ge1 ;

comment_ge0 :
   %empty
   | comment_ge1 ;

import_ge0 :
   %empty
   | IMPORT_KW STRING_EXPLICIT ";"
      comment_ge0
      import_ge0 ;

fwip_import :
   MASTER_KW ";"
   | import_ge0 ;

func_DretD_name :
   FLOOR_FUN_KW
   | CEIL_FUN_KW
   | SQRT_FUN_KW
   | ABS_FUN_KW
   | SIN_FUN_KW
   | COS_FUN_KW
   | TAN_FUN_KW
   | EXP_FUN_KW
   | LN_FUN_KW ;

func_DDretD_name :
   ATAN2_FUN_KW
   | POW_FUN_KW ;

func_DretL_name :
   FLOORL_FUN_KW
   | CEILL_FUN_KW ;

func_LretL_name :
   ABSL_FUN_KW
   | BITWISENOT_FUN_KW ;

func_LLretL_name :
   MOD_FUN_KW
   | BITWISEAND_FUN_KW
   | BITWISEXOR_FUN_KW
   | BITWISEOR_FUN_KW
   | BITSHIFTL_FUN_KW
   | BITSHIFTR_FUN_KW ;

num_expr_eq1 :
   num_expr_eq1 "+" num_expr_eq1
   | num_expr_eq1 "-" num_expr_eq1
   | num_expr_eq1 "*" num_expr_eq1
   | num_expr_eq1 "/" num_expr_eq1
   | num_expr_eq1 "%" num_expr_eq1
   | ARRAYLAST_FUN_KW "(" ARR_NAME "[" "]" ")"
   | func_DretD_name "(" num_expr_eq1 ")"
   | func_DretL_name "(" num_expr_eq1 ")"
   | func_LretL_name "(" num_expr_eq1 ")"
   | func_DDretD_name "(" num_expr_eq1 "," num_expr_eq1 ")"
   | func_LLretL_name "(" num_expr_eq1 "," num_expr_eq1 ")"
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

num_cmp_eq1 : "=="
   | "<>"
   | ">="
   | ">"
   | "<="
   | "<" ;

bol_expr_com :
   FUNC_NAME "(" funcarg_ge0 ")"
   | VAR_NAME
   | num_expr_eq1 num_cmp_eq1 num_expr_eq1
   | NOT_KW bol_expr_com
   | "(" bol_expr_com ")"
   | bol_expr_com AND_KW bol_expr_com
   | bol_expr_com OR_KW bol_expr_com
   | bol_expr_com XOR_KW bol_expr_com ;

string_set:
   STRING_EXPLICIT
   | STRING_TAB_KW
   | STRING_NL_KW ;

assignment_op : "*="
   | "+="
   | "-="
   | "/=" ;

fwip_statement_eq1 :
   assignable_value_eq1 assignment_op num_expr_eq1 ";"
   | assignable_value_eq1 "=" num_expr_eq1 ";"
   | assignable_value_eq1 "=" TRUE_KW ";"
   | assignable_value_eq1 "=" FALSE_KW ";"
   | comment_ge1
   | IF_KW bol_expr_com ":"
         fwip_statement_ge1
      elseif_ge0
      else_le1
      IF_END_KW
   | WHILE_KW bol_expr_com ":"
         fwip_statement_ge1
      WHILE_END_KW
   | FOR_KW VAR_NAME for_ftb_le1 ":"
         fwip_statement_ge1
      FOR_END_KW
   | AWAIT_KW bol_expr_com count_num_le1 ":"
         fwip_statement_ge1
      AWAIT_END_KW
   | ARRAY_KW ARR_NAME "[" "]" ":"
         array_val_ge1
      ARRAY_END_KW
   | REDIM_KW ARR_NAME "[" "]" "," num_expr_eq1 ";"
   | REDIM_KW ARR_NAME "[" "]" ";"
   | WHILE_EXIT_KW ";"
   | FOR_EXIT_KW ";"
   | AWAIT_EXIT_KW ";"
   | PRINTSTR_FUN_KW "(" string_set ")" ";"
   | PRINTVAL_FUN_KW "(" num_expr_eq1 ")" ";"
   | CALL_KW FUNC_NAME "(" funcarg_ge0 ")" ";"
   | language_start_eq1 language_ge1 ":"
      fwip_statement_ge1
      LANGUAGE_END_KW
   | MODE_INTEGER_KW ":"
         fwip_statement_ge1
      MODE_INTEGER_END_KW
   | DIE_KW STRING_EXPLICIT ";" ;

fwip_statement_ge1 :
   fwip_statement_eq1
   | fwip_statement_eq1
      fwip_statement_ge1 ;

fwip_statement_ge0 :
   %empty
   | fwip_statement_ge1 ;

language_eq1 :
   LANG_PERL_KW  | LANG_PYTHON_KW   | LANG_BC_KW
   | LANG_C_KW   | LANG_VARYLOG_KW  | LANG_UNITS_KW
   | LANG_VB6_KW | LANG_VBDOTNET_KW | LANG_FWIPP_KW ;

language_ge1:
   language_eq1
   | language_eq1 language_ge1 ;

language_start_eq1 :
   LANGUAGE_KW | LANGUAGE_NOT_KW ;

elseif_ge0 :
   %empty
   | ELSIF_KW bol_expr_com ":"
      fwip_statement_ge1
   elseif_ge0 ;

else_le1 :
   %empty
   | ELSE_KW ":"
         fwip_statement_ge1 ;

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

vartype_set :
   STR_KW
   | INT_KW
   | DBL_KW
   | BOL_KW ;

funcret_set :
   INT_KW
   | DBL_KW ;

dim :
   CONST_NAME
   | INTEGER_EXPLICIT ;

local_use_decl_eq1 :
   LOCAL_USE_KW VAR_NAME ";"
   | LOCAL_USE_KW ARR_NAME "[" "]" ";"
   | LOCAL_USE_KW ARR_NAME "[" "]" "[" "]" ";" ;

local_use_decl_ge0 :
   %empty
   | local_use_decl_ge0
      local_use_decl_eq1 ;

variable_decl_eq1 :
   vartype_set VAR_NAME_DEF ";"
   | vartype_set ARR_NAME_DEF "[" num_expr_eq1 "]" ";"
   | vartype_set ARR_NAME_DEF "[" "]" ";" ;

variable_decl_ge0 :
   %empty
   | variable_decl_ge0
      variable_decl_eq1 ;

variable_decls :
   comment_ge0
      local_use_decl_ge0
      comment_ge0
      variable_decl_ge0 ;

funcarg_decl_eq1 :
   vartype_set VAR_NAME_DEF
   | READONLY_KW vartype_set ARR_NAME_DEF "[" "]"
   | WRITEONLY_KW vartype_set ARR_NAME_DEF "[" "]"
   | WRITEABLE_KW vartype_set ARR_NAME_DEF "[" "]" ;

funcarg_decl_ge1 :
   funcarg_decl_eq1
   | funcarg_decl_ge1 "," funcarg_decl_eq1 ;

funcarg_decl_ge0 :
   NUL_KW
   | funcarg_decl_ge1 ;

funcarg_eq1 :
   num_expr_eq1
   | ARR_NAME "[" "]"
   | TRUE_KW
   | FALSE_KW ;

funcarg_ge1 :
   funcarg_eq1
   | funcarg_eq1 "," funcarg_ge1;

funcarg_ge0 :
   %empty
   | funcarg_ge1 ;

local_const_ge0 :
   %empty
   | LOCAL_CONST_KW CONST_NAME_DEF num_expr_eq1 ";"
      comment_ge0
      local_const_ge0 ;

local_vartype_set :
   LOCAL_STR_KW
   | LOCAL_INT_KW
   | LOCAL_DBL_KW
   | LOCAL_BOL_KW ;

local_decl_eq1 :
   local_vartype_set VAR_NAME ";"
   | local_vartype_set VAR_NAME "=" num_expr_eq1 ";"
   | local_vartype_set ARR_NAME "[" dim "]" ";"
   | local_vartype_set ARR_NAME "[" dim "]" "[" dim "]" ";" ;

local_decl_ge0 :
   %empty
   | local_decl_eq1
      comment_ge0
      local_decl_ge0 ;

local_func_ge0 :
   %empty
   | LOCAL_FUNC_KW funcret_set FUNC_NAME_DEF "("
         funcarg_decl_ge0 ")" ":"
      variable_decls
      fwip_statement_ge0
      RETURN_KW num_expr_eq1 ";"
      comment_ge0
   FUNC_END_KW
   local_func_ge0
   | LOCAL_FUNC_KW BOL_KW FUNC_NAME_DEF "("
         funcarg_decl_ge0 ")" ":"
      variable_decls
      fwip_statement_ge0
      RETURN_KW bol_expr_com ";"
      comment_ge0
   FUNC_END_KW
   local_func_ge0 ;

array_val_eq1 :
   comment_ge0
   num_expr_eq1 ";" ;

array_val_ge1 :
   array_val_eq1
   | array_val_eq1
      array_val_ge1 ;

%%

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
enum {
   ERROR_VALUE = -1,
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
   return (strncmp(sa_pc, sb_pc, b_len) == 0
         && !isword(sa_pc[b_len]));
}

#define LINE_INC(xx_cc) \
   xx_cc = getc(stdin); \
   if (xx_cc == '\n' || xx_cc == '\r') { \
      line_number++; \
   }

#define LINE_DEC(xx_cc)  \
   if (xx_cc == '\r' || xx_cc == '\n') { \
      line_number--; \
   } \
   ungetc(xx_cc, stdin);

#define READ_INCLUDE(xx_var, xx_ptr, xx_test) \
   for (;;) { \
      LINE_INC(xx_var); \
      *xx_ptr = xx_var; \
      xx_ptr++; \
      if (xx_var == EOF || xx_test) { \
         break; /* loop */ \
      } \
   } \
   *xx_ptr = '\0'

#define READ_EXCLUDE(xx_var, xx_ptr, xx_test) \
   for (;;) { \
      LINE_INC(xx_var); \
      if (xx_var == EOF || xx_test) { \
         LINE_DEC(xx_var); \
         break; /* loop */ \
      } \
      *xx_ptr = xx_var; \
      xx_ptr++; \
   } \
   *xx_ptr = '\0'

#define SKIP_WS(xx_cc) \
   for (;;) { \
      LINE_INC(xx_cc); \
      if (!isspace(xx_cc)) { \
         LINE_DEC(xx_cc); \
         break;  /*loop */ \
      } \
   }

#define IF_KWRD(xx_str) \
   if (str_eq(lval_p->v_str, #xx_str)) { \
      retvalu = xx_str ## _KW; }

#define IF_FUNC(xx_str) \
   if (str_eq(lval_p->v_str, #xx_str)) { \
      retvalu = xx_str ## _FUN_KW; }

#define CHECK1(xx_ch, xx_oo) \
   if (cc == xx_ch) { retvalu = xx_oo; }

#define CHECK2(xx_ch1, xx_ch2, xx_o1, xx_o2) \
   if (cc == xx_ch1) { \
      LINE_INC(cc); \
      if (cc == xx_ch2) { \
         *v_p = cc; \
         v_p++; \
         retvalu = xx_o1; \
      } else if (cc != EOF) { \
         LINE_DEC(cc); \
         retvalu = xx_o2; \
      } \
   }

int
yylex(struct YYSTYPE *lval_p)
{
   int cc = 'A';
   char *v_p;
   int retvalu;
   int saw;
   static int line_number = 1;
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
      saw = 0;
      for (;;) {
         LINE_INC(cc);
         if (cc == '.') {
            if (0 < saw) {
               lval_p->typef = ERROR_VALUE;
               return lval_p->typef;
            }
            saw++;
         }
         if (isdigit(cc) || cc == '.') {
            *v_p = cc;
            v_p++;
         } else {
            break;
         }
      }
      *v_p = '\0';
      if (cc == 'E') { // floating point exponential number
         saw++;
         *v_p = cc;
         v_p++;
         LINE_INC(cc);
         if (cc == '-' || cc == '+') {
            *v_p = cc;
            v_p++;
            LINE_INC(cc);
         }
         while (isdigit(cc)) {
            *v_p = cc;
            v_p++;
            LINE_INC(cc);
         }
      }
      *v_p = '\0';
      LINE_DEC(cc);
      sscanf(lval_p->v_str, "%lf", &lval_p->v_double);

      retvalu = (saw == 0 ? INTEGER_EXPLICIT : DOUBLE_EXPLICIT);
   } else if (isupper(cc)) {
      READ_EXCLUDE(cc, v_p, !(isword(cc) || cc == '.'));
      IF_KWRD(MODE_INTEGER_END)
      else IF_KWRD(LANG_VBDOTNET)
      else IF_KWRD(MODE_INTEGER)
      else IF_KWRD(LANGUAGE_NOT)
      else IF_KWRD(LANGUAGE_END)
      else IF_KWRD(LANG_VARYLOG)
      else IF_KWRD(LOCAL_CONST)
      else IF_KWRD(LANG_PYTHON)
      else IF_KWRD(WHILE_EXIT)
      else IF_KWRD(STRING_TAB)
      else IF_KWRD(AWAIT_EXIT)
      else IF_KWRD(LANG_UNITS)
      else IF_KWRD(LOCAL_FUNC)
      else IF_KWRD(LOCAL_DBL)
      else IF_KWRD(LOCAL_INT)
      else IF_KWRD(LOCAL_STR)
      else IF_KWRD(LOCAL_BOL)
      else IF_KWRD(WRITEABLE)
      else IF_KWRD(WRITEONLY)
      else IF_KWRD(LOCAL_USE)
      else IF_KWRD(ARRAY_END)
      else IF_KWRD(WHILE_END)
      else IF_KWRD(AWAIT_END)
      else IF_KWRD(STRING_NL)
      else IF_KWRD(BLOCK_END)
      else IF_KWRD(LANG_PERL)
      else IF_KWRD(LANGUAGE)
      else IF_KWRD(READONLY)
      else IF_KWRD(FUNC_END)
      else IF_KWRD(FOR_EXIT)
      else IF_KWRD(LANG_VB6)
      else IF_KWRD(FOR_END)
      else IF_KWRD(LANG_BC)
      else IF_KWRD(RETURN)
      else IF_KWRD(MASTER)
      else IF_KWRD(IMPORT)
      else IF_KWRD(IF_END)
      else IF_KWRD(LANG_C)
      else IF_KWRD(CONST)
      else IF_KWRD(WHILE)
      else IF_KWRD(REDIM)
      else IF_KWRD(ELSIF)
      else IF_KWRD(COUNT)
      else IF_KWRD(BLOCK)
      else IF_KWRD(AWAIT)
      else IF_KWRD(ARRAY)
      else IF_KWRD(FALSE)
      else IF_KWRD(FUNC)
      else IF_KWRD(FROM)
      else IF_KWRD(ELSE)
      else IF_KWRD(CALL)
      else IF_KWRD(TRUE)
      else IF_KWRD(STR)
      else IF_KWRD(BOL)
      else IF_KWRD(NUL)
      else IF_KWRD(INT)
      else IF_KWRD(FOR)
      else IF_KWRD(DIE)
      else IF_KWRD(DBL)
      else IF_KWRD(NOT)
      else IF_KWRD(AND)
      else IF_KWRD(XOR)
      else IF_KWRD(OR)
      else IF_KWRD(TO)
      else IF_KWRD(IF)
      else IF_KWRD(BY)
      else {
         if (isspace(cc)) {
            SKIP_WS(cc);
         }
         if (prev_typdef == CONST_KW
                  || prev_typdef == LOCAL_CONST_KW) {
            retvalu = CONST_NAME_DEF;
         } else if (cc == '(') {
            IF_FUNC(BITWISEAND)
            else IF_FUNC(BITWISEXOR)
            else IF_FUNC(BITWISENOT)
            else IF_FUNC(BITWISEOR)
            else IF_FUNC(BITSHIFTL)
            else IF_FUNC(BITSHIFTR)
            else IF_FUNC(ARRAYLAST)
            else IF_FUNC(PRINTVAL)
            else IF_FUNC(PRINTSTR)
            else IF_FUNC(FLOORL)
            else IF_FUNC(FLOOR)
            else IF_FUNC(ATAN2)
            else IF_FUNC(CEILL)
            else IF_FUNC(CEIL)
            else IF_FUNC(ABSL)
            else IF_FUNC(SQRT)
            else IF_FUNC(POW)
            else IF_FUNC(SIN)
            else IF_FUNC(COS)
            else IF_FUNC(TAN)
            else IF_FUNC(MOD)
            else IF_FUNC(ABS)
            else IF_FUNC(EXP)
            else IF_FUNC(LN)
            else if (prev_typdef == DBL_KW
                        || prev_typdef == INT_KW
                        || prev_typdef == BOL_KW) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            retvalu = CONST_NAME;
         }
      }
   } else if (islower(cc)) {
      READ_EXCLUDE(cc, v_p, !(islower(cc) || isdigit(cc)
                  || cc == '.' || cc == '_'));

      if (isupper(cc)) {
         READ_EXCLUDE(cc, v_p, !(isalnum(cc) || cc == '.'
               || cc == '_'));
         if (isspace(cc)) {
            SKIP_WS(cc);
         }
         if (cc == '(') { // if fail char is '('
            if (prev_typdef == DBL_KW
                     || prev_typdef == INT_KW
                     || prev_typdef == BOL_KW) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            if (prev_typdef == CONST_KW
                     || prev_typdef == LOCAL_CONST_KW) {
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
            if (prev_typdef == DBL_KW
                     || prev_typdef == INT_KW
                     || prev_typdef == BOL_KW) {
               retvalu = ARR_NAME_DEF;
            } else {
               retvalu = ARR_NAME;
            }
         } else if (cc == '(') { // if fail char is '('
            if (prev_typdef == DBL_KW
                     || prev_typdef == INT_KW
                     || prev_typdef == BOL_KW) {
               retvalu = FUNC_NAME_DEF;
            } else {
               retvalu = FUNC_NAME;
            }
         } else {
            if (prev_typdef == CONST_KW
                     || prev_typdef == LOCAL_CONST_KW) {
               retvalu = CONST_NAME_DEF;
            } else if (prev_typdef == DBL_KW
                     || prev_typdef == INT_KW
                     || prev_typdef == BOL_KW) {
               retvalu = VAR_NAME_DEF;
            } else {
               retvalu = VAR_NAME;
            }
         }
      }
   }
   else CHECK1(';', STATEMENT_END_TOKEN)
   else CHECK1(':', INDENT_TOKEN)
   else CHECK1(',', COMMA_TOKEN)
   else CHECK1('(', PAREN_OPEN_TOKEN)
   else CHECK1(')', PAREN_CLOSE_TOKEN)
   else CHECK1('[', ARRAY_OPEN_TOKEN)
   else CHECK1(']', ARRAY_CLOSE_TOKEN)
   else CHECK2('+', '=', ASSADD_TOKEN, ADD_TOKEN)
   else CHECK2('-', '=', ASSSUB_TOKEN, SUB_TOKEN)
   else CHECK2('*', '=', ASSMUL_TOKEN, MUL_TOKEN)
   else CHECK2('/', '=', ASSDIV_TOKEN, DIV_TOKEN)
   else CHECK2('%', '=', ASSMOD_TOKEN, MOD_TOKEN)
   else CHECK2('=', '=', CMP_EQ_TOKEN, ASSIGN_TOKEN)
   else CHECK2('>', '=', CMP_GE_TOKEN, CMP_GT_TOKEN)
   else if (cc == '<') {
      LINE_INC(cc);
      if (cc == '=') {
         *v_p = cc;
         v_p++;
         retvalu = CMP_LE_TOKEN;
      } else if (cc == '>') {
         *v_p = cc;
         v_p++;
         retvalu = CMP_NE_TOKEN;
      } else if (cc != EOF) {
         LINE_DEC(cc);
         retvalu = CMP_LT_TOKEN;
      }
   }
   *v_p = '\0';
   printf("%-6d %-4d %s\n", line_number
            , retvalu, &lval_p->v_str[0]);
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

   fprintf(stderr, "FWIP-PARSING-ERROR:%s\n*******\n", ss);
   ii = 0;
   while (ii < 8) {
      cc = getc(stdin);
      if (cc == EOF) {
         break;  // loop
      }
      fprintf(stderr, "%c", cc);
      if (cc == '\n') {
         ii++;
      }
   }
   fprintf(stderr, "*******\n");
   exit(-1);
}

int
main(int argc
      , const char **argv_ppc)
{
   int jj;

   (void)argc;
   jj = yyparse();
   fprintf(stderr, "%s:", argv_ppc[0]);
   if (jj != 0) {
      fprintf(stderr, "FAILURE:%d\n", jj);
   } else {
      fprintf(stderr, "SUCCESS\n");
   }
   return(jj);
}
