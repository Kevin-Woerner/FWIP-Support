#! /bin/bash
#    Copyright (C) 2020-2021 by Kevin D. Woerner
# 2021-05-14 kdw  usage; general improvements
# 2021-05-12 kdw  options added, et al.
# 2021-05-11 kdw  *.fwipp added
# 2021-05-10 kdw  updated
# 2020-05-11 kdw  simplified
# 2020-04-01 kdw  updated
# 2020-03-31 kdw  updated
verbose_flag=0
unset file_arr
function usage ()
{
   echo <<EOF
$1
Usage: $0 FWIP-PROGRAM
Options:
   -v    : verbose
EOF
   exit -1
}
for arg ; do
   if [[ "${arg:0:1}" == "-" ]] ; then
      while [[ "$arg" != "-" ]] ; do
         case $arg in
            -v*) let verbose_flag++ ;;
            -*) usage "Bad Option:$arg" ;;
         esac
         arg="-${arg:2}"
      done
   elif [[ -f "$arg" ]] ; then
      file_arr+=("$arg")
   else
      usage "Not an option or file:$arg"
   fi
done

perlcode=$(cat <<EOF
use strict;
my \$curr_func;
my \$line_number = 0;
my %funcs_called_by = ();
my %builtin = ();
my @call_stack = ();
sub pp(\$\$ );
sub pp(\$\$ )
{
   my (\$name, \$ch) = @_;
   my \$pp = "   " x \$#call_stack;
   my \$recurse = "";
   foreach (@call_stack) {
      if (\$_ eq \$name) {
         \$recurse = "*";
      }
   }
   push(@call_stack, \$name);
   my \$pre;
   if ($verbose_flag) {
      \$pre = join(":", @call_stack);
      \$pre =~ s/(\w+):\1\b/\$1/;
   } else {
      \$pre = "   " x (\$#call_stack) . \$name;
   }
   printf("%5d %3d \$ch %s\$recurse\\n"
            , \$line_number, \$#call_stack, \$pre);
   if (\$recurse eq "") {
      if (\$ch ne "-") {
         foreach my \$func (@{\$funcs_called_by{\$name}}) {
            pp(\$func, (defined(\$builtin{\$func}) ? "b" : "R"));
         }
         pop(@call_stack);
      }
   }
}

while (<>) {
   chomp;
   s/^\\s*(\\d+)\\s+//;
   \$line_number = \$1;
   if (m/^247\\s+(.*)/) { # func define
      \$curr_func = \$1;
      @call_stack = ();
      pp(\$curr_func, "-");
   } elsif (m/^246\\s+(.*)/) {  # func call
      my \$ff = \$1;
      \$ff =~ s/.*\.//;
      push(@{\$funcs_called_by{\$curr_func}}, \$ff);
      pp(\$ff, "F");
   } elsif (m/^3\\d\\d\\s+(.*)/) { # builtin call
      my \$ff = \$1;
      push(@{\$funcs_called_by{\$curr_func}}, \$ff);
      \$builtin{\$ff} = 1;
      pp(\$ff, "b");
   }
}
EOF
)

if [[ 0 -eq ${#file_arr[@]} ]] ; then
   cat | fwip.tab | perl -e "$perlcode"
else
   for ii in "${file_arr[@]}"; do
      if [[ "$ii" =~ .*\.fwipp ]] ; then
         cat $ii | fwip.tab | perl -e "$perlcode"
      elif [[ "$ii" =~ .*\.fwip ]] ; then
         fwippreprocess $ii | fwip.tab | perl -e "$perlcode"
      else
         echo "$0:Unrecognized file suffix: $ii"
      fi
   done
fi
