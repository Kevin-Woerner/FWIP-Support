package Fwip_Wrap;
#    Copyright (C) 2019-2021 by Kevin D. Woerner
# 2021-05-14 kdw  comment mistakenly changed
# 2021-04-14 kdw  indent for line break
# 2021-04-12 kdw  indent bfr , changed
# 2021-04-02 kdw  VB: func return work
# 2021-03-21 kdw  debugging
# 2021-03-09 kdw  var renam
# 2021-03-07 kdw  func arg reformat
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-05-20 kdw  dont print, just return value
# 2020-04-10 kdw  no backslashes in output
# 2020-03-12 kdw  var renam
# 2020-03-05 kdw  rmed several key words
# 2020-02-21 kdw  tweak
# 2019-12-09 kdw  rmed unused "use"s, exporter
# 2019-10-02 kdw  tweak
# 2019-08-12 kdw  3rd arg for fwipwrap
# 2019-08-05 kdw  created
use strict;
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Comment qw();
sub LMT () { 30; }
sub fwip_wrap($;$$ )
{
   my $ln = $_[0];
   my $verbose = (defined($_[1]) ? $_[1] : 0);
   my $mlm = (defined($_[2]) ? $_[2] : Fwip_Comment::FWIPC_LINE_LENGTH);
   my $mllm = $mlm - 3;
   my $cyc = 0;
   my $bq = "   ";
   my $lv_cm0 = Fwip_Comment::FWIPC_CM0;
   my $ree = "";
   $ln =~ m/^(\s*)/;
   my $lead = "$1";
   if (0 < $mlm) {
      my $orig = $ln;
      # format function arguments correctly
      while ($ln =~ s/^(\s*)\b((BLOCK_FUNC|FUNC)\b[^\#\n]*)(,.*)
               /$1$2\n$1${bq}${bq}${bq}$4/x and $cyc < LMT / 2) {
         $cyc++;
      }
      while ($ln =~ m/^.{$mlm}./m) {
         if ($verbose and $cyc == 0) {
            print STDERR "\nBEFORE:$cyc:$ln";
         }
         $cyc++;
         if ($cyc < 2 * LMT) {
            if ($ln !~ s/(\S\s+)\s(\S)/$1$2/) {
               $ln = $orig;
               $cyc = 2 * LMT + 1;
            }
         } else {
            if ($ln =~ s~^(.{0,$mllm}\S)(?=\#|,|\ ([=+*/-]|\b
                     (OR|AND|NOT)\b)\ )~~x
               or (3 * LMT < $cyc and $ln =~ s@^(.{0,$mllm}\S)(?=\s+\S)@@)) {
               my $res = $1;
               if ($res !~ m/$lv_cm0/) {
                  $ln =~ s/^\s*/$lead${bq}${bq}${bq}/;
               } else {
                  $ln =~ s/^\s*/$lead${bq}$lv_cm0/;
               }
               $ree .= "$res\n";
            }

            if (6 * LMT < $cyc) {
               die "$0:Long line:" . length($ln) . ":$ree\n$0:Long line:$ln";
            } elsif (5 * LMT < $cyc) {
               $ln =~ s/^   //;
            } elsif (4 * LMT < $cyc) {
               $ln =~ s/-----/----/;
            }
         }
      }
      if ($cyc != 0 and $verbose) {
         print STDERR "AFTERR:$cyc:$ln";
      }
   }
   $ree . $ln;
}

1;
