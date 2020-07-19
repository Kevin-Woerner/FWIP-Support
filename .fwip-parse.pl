#! /usr/bin/perl -W
#    Copyright (C) 2017-2020 by Kevin D. Woerner
# 2020-05-29 kdw  more self-contained
# 2020-01-07 kdw  getopt line updated
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-06-27 kdw  help message expanded
# 2018-12-07 kdw  explicit imported funcitons
# 2018-03-05 kdw  use exported funcs
# 2018-02-17 kdw  preprocessor stuff mved
# 2017-04-03 kdw  Fw?ip_P?arse func renam
# 2017-03-12 kdw  tweaking
# 2017-03-10 kdw  tweaking
# 2017-03-07 kdw  CONSTANT, et al. changed
# 2017-03-06 kdw  created
use strict;
use Carp qw();
use Getopt::Long qw(:config bundling no_ignore_case);
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Parse qw();

my $verbose_flag = 0;
if (!Getopt::Long::GetOptions("v+", \$verbose_flag)) {
   die <<EndOfUsage;
Usage: $0 [FILE]
Parse input as a FWIP file
Options:
   -v  Verbose
EndOfUsage
}

my $rxp_mn = Fwip_Parse::rx_modulename();
my $rxp_fn = Fwip_Parse::rx_functionname();
my $rxp_vn = Fwip_Parse::rx_variablename();
my $rxp_an = Fwip_Parse::rx_arrayname();
my $rxp_vd = Fwip_Parse::rx_variabledecl();
my $rxp_cn = Fwip_Parse::rx_constantname();

sub lf_token2string($%)
{
   my $out = "";
   my ($verbose_flag, $hashref) = @_;
   if ($hashref->{TOKEN} =~ m/./) {
      if ($verbose_flag) {
         $out .= sprintf "%-6d %-27s "
               , $hashref->{COUNT}, $hashref->{TYPE};
      }
      $out .= sprintf "%s\n", $hashref->{TOKEN};
   }
   $out;
}

my $fr= "";
my %zq = ();
my @jj = split(/\s+/, $fr);
for (my $ii = 0; $ii < $#jj; $ii += 2) {
   $zq{$jj[$ii]} = $jj[$ii + 1];
}

{
   my @tkn;
   my $count;
   my $seen_cnst = "XxYyZz";
   my $seen_replace = "XxYyZz";
   my %numtext = ("x" => "HEX", "o" => "OCT", "b" => "BIN");
   my %defined_variables = ();
   my %seen_constants = ();
   my %seen_functions = ();
   my $scope = "";
   my $indent_type = "";
   my $inpt = "";
   sub indent_set($ )
   {
      if ($indent_type =~ m/^[^_]/) {
         die "OOPSI:$indent_type:$inpt";
      }
      $indent_type = $_[0];
   }
   my $arr_str = "";
   my $end_str = "";
   sub end_set($ )
   {
      if ($end_str =~ m/./) {
#         print STDERR join("\n", map { $_->{TOKEN};} @tkn);
#         die "OOPSE:$end_str:$inpt";
      }
      if (!defined($_[0])) {
         Carp::confess("CROAK:$inpt");
      }
      $end_str = $_[0];
   }
   sub lf_push_token($$ )
   {
      if (defined($zq{$_[1]})) {
         $_[1] = $zq{$_[1]};
      }
      push(@tkn, { TYPE => $_[0], TOKEN => $_[1]
            , COUNT => $count });
   }
   sub lf_vari($$ )
   {
      my ($st, $oo) = @_;

      if (defined($defined_variables{$oo})) {
         lf_push_token("$st-ACCESS", "$oo");
      } else {
         lf_push_token("$st-DECL", "$oo");
      }
      $defined_variables{$oo}++;
   }
   sub lf_func($$ )
   {
      my ($st, $oo) = @_;
      my $pp = $oo;
      if ($pp =~ s/($rxp_mn)//) {
         lf_push_token("$st-MUSE", "$oo");
      } elsif (defined($seen_functions{$pp})) {
         lf_push_token("$st-USE", "$oo");
      } else {
         lf_push_token("$st-DECL", "$oo");
      }
      $seen_functions{$pp}++;
   }
   sub lf_parse_string($ )
   {
      my @line_number = ();
      @tkn = ();
      $count = 0;
      my $input = $_[0];

      my @input_lines = split(/\n/, $input);
      my $comment_start_line = -1;
      # Continuation lines
      my @tline = ();
      my $curr = "";
      my $prev_ii = 1;
      for (my $ii = 0; $ii <= $#input_lines; $ii++) {
         $input_lines[$ii] =~ s/^ +//;
         $input_lines[$ii] =~ s/\\$//;
         $curr .= " " . $input_lines[$ii];
         if ($input_lines[$ii] =~ m/#/) {
            push(@tline, $curr);
            push(@line_number, $prev_ii);
            $prev_ii = $ii + 1;
            $curr = "";
         }
      }
      push(@tline, $curr);
      push(@line_number, $prev_ii);
      my $ind = 0;
      foreach my $line (@tline) {
         $inpt = $line;
         $count = $line_number[$ind++];
         my $oo;
         my $pp;
         my $qq;
         my $mm;
         $line =~ s/^\s+//;
         while ($line =~ m/\S/) {
            $line =~ s/^\s+//;
            if ($line =~ s/^(#.*)//) {
               lf_push_token("COMMENT", "$1");
            } elsif ($line =~ s/^\s*(LANGUAGE(_NOT)?)\b//) {
               $oo = $1;
               lf_push_token("FWIP PRE", $oo);
               indent_set("PRE-$oo");
               if ($line =~ s/(\S.*?)(?=:)//) {
                  $mm = $1;
                  foreach my $ff (split(/\s+/, $mm)) {
                     lf_push_token("FWIP PRE-$oo", "$ff");
                  }
               }
            } elsif ($line =~ s/^\s*(LANGUAGE_END)\b//) {
               lf_push_token("FWIP PRE", "$1");
            } elsif ($line =~ s/^(LOCAL_CONST)\s+(\w+)\s*(=)\s*
                        //x) {
               my @tt = ($1, $2, $3);
               $seen_replace .= "|$tt[1]";
               lf_push_token("FWIP PRE-LOCAL_CONST", "$tt[0]");
               lf_push_token("LOCAL_CONST-NAME", "$tt[1]");
               lf_push_token("LOCAL_CONST-EQ", "$tt[2]");
               $seen_constants{$tt[1]} = 1;
               end_set("PRE-LOCAL_CONST");
            } elsif ($line =~ s/^(\?\?\w*)//) {
               lf_push_token("FWIP PREPRE", "$1");
            } elsif ($line =~ s/^(\?\w+)//) {
               my $tt = $1;
               lf_push_token("FWIP PRE", "$tt");
            } elsif ($line =~ s/^(CONST)\b\s+(\w+)\s*(=)\s*//) {
               my @aa = ($1, $2, $3);
               lf_push_token("FWIP CONSTANT", "$aa[0]");
               lf_push_token("CONSTANT-DEF", "$aa[1]");
               lf_push_token("CONSTANT-EQ", "$aa[2]");
               $seen_constants{$aa[1]} = 0;
               end_set("CONSTANT");
               $seen_cnst .= "|$aa[1]";
            } elsif ($line =~ s/^(LOCAL_FUNC|FUNC)\b//) {
               $oo = $1;
               indent_set("$oo-DEF");
               $scope = ""; # "FUNC-$oo-";
               lf_push_token("FWIP $oo-DEF", $oo);
            } elsif ($line =~ s/^(FUNC_END)\b//) {
               lf_push_token("FWIP FUNC-DEF-END", "$1");
               %defined_variables = ();
               $scope = "";
            } elsif ($line =~ s/^(READONLY|WRITEABLE)\b//) {
               lf_push_token("FWIP FUNC-ARG-PROPERTY", "$1");
            } elsif ($line =~ s/^($rxp_vd)\b//) {
               $oo = $1;
               if ($indent_type =~ m/FUNC/) {
                  lf_push_token("FWIP FUNC-ARG-DECL-$oo", $oo);
               } else {
                  if ($scope eq "") {
                     lf_push_token("FWIP VAR-DECL-$oo", $oo);
                     end_set("VAR-DECL-$oo");
                  } else {
                     lf_push_token("FWIP $scope$oo", $oo);
                     end_set("$scope$oo");
                  }
               }
            } elsif ($line =~ s/^(LOCAL_USE)\b//) {
               $oo = $1;
               lf_push_token("FWIP VAR-$oo", $oo);
               end_set("VAR-$oo");
               $scope = "VAR-$oo-";
            } elsif ($line =~ s/^(MASTER)\b//) {
               $oo = $1;
               lf_push_token("FWIP $oo", $oo);
               end_set($oo);
            } elsif ($line =~ s/^(IMPORT)\b//) {
               lf_push_token("FWIP $1", "$1");
               $end_str = $1;
            } elsif ($line =~ s/^(STRING_(NL|TAB))\b//) {
               lf_push_token("FWIP $1", "$1");
            } elsif ($line =~ s/^(SIN|COS|TAN|ATAN2|MOD|POW
                     |LN|EXP|FLOOR|CEIL|SQRT|ABS)\b//x) {
               lf_push_token("FWIP FUNCTION-$1", "$1");
            } elsif ($line =~ s/^(ARRAYLAST)\b//) {
               lf_push_token("FWIP BUILTIN-$1", "$1");
            } elsif ($line =~ s/^(RETURN|DIE)\b//) {
               $oo = $1;
               lf_push_token("FWIP $oo", $oo);
               end_set($oo);
            } elsif ($line =~ s/^(ARRAY)\b//) {
               $oo = $1;
               lf_push_token("FWIP ARRAYINIT", $oo);
               indent_set($oo);
               $arr_str = "ARRAYITEM";
               end_set($oo);
            } elsif ($line =~ s/^(ARRAY_END)\b//) {
               lf_push_token("FWIP ARRAYINIT_END", "$1");
               $arr_str = "";
            } elsif ($line =~ s/^(REDIM)\b//) {
               lf_push_token("FWIP ARRAYRESIZE", "$1");
               end_set("ARRAYRESIZE");
            } elsif ($line =~ s/^(AND|OR|NOT|XOR)\b//) {
               lf_push_token("FWIP LOGICAL", "$1");
            } elsif ($line =~ s/^(TRUE|FALSE)\b//) {
               lf_push_token("FWIP BOOLEAN", "$1");
            } elsif ($line =~ s/^(BLOCK_END)\b//) {
               lf_push_token("FWIP $1", "$1");
            } elsif ($line =~ s/^(BLOCK)\b//) {
               $oo = $1;
               lf_push_token("FWIP $oo", $oo);
               indent_set($oo);
            } elsif ($line =~ s/^(IF)\b//) {
               $oo = $1;
               lf_push_token("FWIP $1", $oo);
               indent_set($oo);
            } elsif ($line =~ s/^(IF_END)\b//) {
               lf_push_token("FWIP IF-$1", "$1");
            } elsif ($line =~ s/^(ELSE|ELSIF)//) {
               $oo = $1;
               lf_push_token("FWIP IF-$oo", "$oo");
               indent_set("IF-$oo");
            } elsif ($line =~ s/^(FROM|TO|BY|COUNT)\b//) {
               lf_push_token("FWIP LOOP-$1", "$1");
            } elsif ($line =~ s/^((FOR|AWAIT|WHILE)_EXIT)\b//x) {
               lf_push_token("FWIP LOOP-$1", "$1");
               end_set("LOOP-$1");
            } elsif ($line =~ s/^((FOR|AWAIT|WHILE)_END)\b//x) {
               lf_push_token("FWIP LOOP-$1", "$1");
               $end_str = "";
            } elsif ($line =~ s/^(FOR|AWAIT|WHILE)\b//) {
               $oo = $1;
               lf_push_token("FWIP LOOP-$1", $oo);
               indent_set("LOOP-$oo");
            } elsif ($line =~ s/^(\<\>|\<=?|\>=?|==)//) {
               lf_push_token("FWIP COMPARISON-$1", "$1");
            } elsif ($line =~ s/^([-+\/*^]=)//) {
               $oo = $1;
               lf_push_token("FWIP ASSIGN-OP-$oo", $oo);
               end_set("ASSIGN-OP-$oo");
            } elsif ($line =~ s/^(=)//) {
               $oo = $1;
               if ($scope ne "") {
                  lf_push_token("FWIP $scope$oo", $oo);
                  $end_str = "$scope$oo";
               } else {
                  lf_push_token("FWIP ASSIGN", $oo);
                  end_set("ASSIGN-$oo");
               }
            } elsif ($line =~ s/^([-+\/*])//) {
               lf_push_token("FWIP OPERATOR", "$1");
            } elsif ($line =~ s/^(PRINTSTR|PRINTVAL)\b//) {
               $oo = $1;
               lf_push_token("FWIP $1", "$1");
               end_set($oo);
            } elsif ($line =~ s/^(MODE_\w+_END)\b//) {
               lf_push_token("FWIP $1", "$1");
            } elsif ($line =~ s/^(MODE_\w+\b)//) {
               $oo = $1;
               lf_push_token("FWIP $oo", $oo);
               indent_set($oo);
            } elsif ($line =~ s/^(CALL)\b//) {
               $oo = $1;
               lf_push_token("FWIP $oo", "$oo");
               end_set($oo);
            } elsif ($line =~ s/^([()])//) {
               lf_push_token("FWIP PAREN", "$1");
            } elsif ($line =~ s/^([][])//) {
               lf_push_token("FWIP ARRAY-ACCESS", "$1");
            } elsif ($line =~ s/^(;)//) {
               lf_push_token("FWIP $end_str", "$1");
               $end_str = $arr_str;
               $scope = "";
            } elsif ($line =~ s/^(,)//) {
               lf_push_token("FWIP $1", "$1");
            } elsif ($line =~ s/^(:)//) {
               lf_push_token("FWIP $indent_type", "$1");
               $indent_type = "";
            } elsif ($line =~ s/^(scvx_[a-z]+)//) {
               lf_vari("SECANT-VAR", $1);
            } elsif ($line =~ s/^(nrvx_[a-z]+)//) {
               lf_vari("RAPHSON-VAR", $1);
            } elsif ($line =~ s/^(\".*?\")//) {
               lf_push_token("STRING", "$1");
            } elsif ($line =~ s/^(($rxp_mn)?$seen_cnst)\b//x) {
               $oo = $1;
               if (defined($seen_constants{$oo})) {
                  lf_push_token("CONSTANT-USE", "$oo");
               } else {
                  lf_push_token("CONSTANT-DEF", "$oo");
               }
               $seen_constants{$oo}++;
            } elsif ($line =~ s/^($seen_replace)\b//) {
               $oo = $1;
               lf_push_token("LOCAL_CONST-USE", $oo);
               $seen_constants{$oo}++;
            } elsif ($line =~ s/^($rxp_fn)\s*(?=\()//) {
               lf_func("FUNCTION", "$1");
            } elsif ($line =~ s/^($rxp_an)\s*(?=\[)//) {
               lf_vari("VARIABLE-ARRAY", $1);
            } elsif ($line =~ s/^($rxp_vn)//) {
               lf_vari("VARIABLE-SCALAR", $1);
            } elsif ($line =~ s/^($rxp_cn)\b//) {
               lf_push_token("EXTERN_CONSTANT-USE", "$1");
            } elsif ($line
                     =~ s/^0 *(x)([0-9A-Fa-f_ ]*[0-9A-Fa-f])//
                  or $line =~ s/^0 *(o)([0-7_ ]*[0-7])//
                  or $line =~ s/^0 *(b)([01_ ]*[01])//) {
               my ($type, $hexx) = ($1, $2);
               $hexx =~ y/_ //d;
               lf_push_token("NUMBER-$numtext{$type}"
                        , "0$type$hexx");
            } elsif ($line
                  =~ s/^([-+]?[0-9_ ]*[0-9]) *(?![.E0-9_])//) {
               my $nnu = "$1";
               $nnu =~ y/ _//d;
               lf_push_token("NUMBER-INT", "$nnu");
            } elsif ($line
                     =~ s/^([-+]?[0-9_\ ]*[0-9](\.[0-9_\ ]*)?
                  (E[-+]?[0-9_\ ]*[0-9])?)//x) {
               my $nnu = "$1";
               $nnu =~ y/ _//d;
               lf_push_token("NUMBER-FLOAT", "$nnu");
            } elsif ($line =~ s/^(\S)//) {
               lf_push_token("UNKNOWN?", "$1");
               die ""
                  . "CONSTRX:$seen_cnst\n"
                  . "RESTOFLINE:\"$line\"\n"
                  . "INPUTLINE:\"$inpt\"\n"
                  . "---PARSE WARNING:\"$1\"\n"
                  ;
            } else {
               die "WHAT?:\"$inpt\"\n";
            }
         }
      }

      for (my $jj = 1; $jj < $#tkn; $jj++) {
         if ($tkn[$jj]->{TYPE} eq "OP"
               and $tkn[$jj]->{TOKEN} eq "-"
               and $tkn[$jj + 1]->{TYPE} =~ m/^(NUMBER|VARIABLE)/
               and $tkn[$jj - 1]->{TYPE} =~ m/^FWIP (COMMA
                  |PAREN-L|COMPARE|(OP-)?ASSIGN)$/x) {
            $tkn[$jj]->{TYPE} = "NEG-" . $tkn[$jj + 1]->{TYPE};
            $tkn[$jj]->{TOKEN} = "-" . $tkn[$jj + 1]->{TOKEN};
            splice(@tkn, $jj + 1, 1);
         }
         my $msg;
         if ($tkn[$jj]->{TYPE} =~ m/^(NUMBER)/) {
            if ($tkn[$jj + 1]->{TYPE} =~ m/^NUMBER/) {
               $msg = "NUMBER followed by NUMBER";
            } elsif ($tkn[$jj + 1]->{TYPE} =~ m/^VARIABLE/) {
               $msg = "NUMBER followed by VARIABLE";
            }
         } elsif ($tkn[$jj]->{TYPE} =~ m/^(VARIABLE-SCALAR)/) {
            if ($tkn[$jj + 1]->{TYPE} =~ m/^(NUMBER)/) {
               $msg = "VARIABLE followed by NUMBER";
            }
         }
         if (defined($msg)) {
            die join(" ", map { $_->{TOKEN};}
                     @tkn[0..($jj + 1)]) . "\nAdjacent $msg";
         }

      }
      (@tkn);
   }
}

local $/ = undef;

foreach my $tt (lf_parse_string(<>)) {
   print lf_token2string($verbose_flag, $tt);
}
