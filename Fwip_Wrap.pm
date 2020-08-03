package Fwip_Wrap;
#    Copyright (C) 2019-2020 by Kevin D. Woerner
# 2020-07-24 kdw  s/LO[C]AL_/BL[O]CK_/
# 2020-05-20 kdw  dont print, just return value
# 2020-04-10 kdw  no backslashes in output
# 2020-03-12 kdw  var renam
# 2020-03-05 kdw  rmed several key words
# 2020-02-21 kdw  tweak
# 2019-12-09 kdw  rmed unused "use"s, exporter
# 2019-10-02 kdw  tweak
# 2019-08-12 kdw  3rd arg for fwip-wrap
# 2019-08-05 kdw  created
use strict;
use lib "$ENV{KW_DIR_INCLUDE}";
use Fwip_Comment qw();
sub CNN () { 30; }
sub fwip_wrap($;$$ )
{
   my $ln = $_[0];
   my $verbose = (defined($_[1]) ? $_[1] : 0);
   my $mlm = (defined($_[2]) ? $_[2]
         : Fwip_Comment::FWIPC_LINE_LENGTH);
   my $mllm = $mlm - 3;
   my $cxc = 0;
   my $bq = "   ";
   my $lv_cm0 = Fwip_Comment::FWIPC_CM0;
   my $ree = "";
   $ln =~ m/^(\s*)/;
   my $lead = "$1";
   if (0 < $mlm) {
      my $orig = $ln;
      # format function arguments correctly
      while ($ln =~ s/^(\s*)\b((BLOCK_FUNC|FUNC)\b[^\#\n]*)(,.*)
               /$1$2\n$1${bq}${bq}$4/x and $cxc < CNN / 2) {
         $cxc++;
      }
      while ($ln =~ m/^.{$mlm}./m) {
         if ($verbose and $cxc == 0) {
            print STDERR "\nBEFORE:$cxc:$ln";
         }
         $cxc++;
         if ($cxc < 2 * CNN) {
            if ($ln !~ s/(\S\s+)\s(\S)/$1$2/) {
               $ln = $orig;
               $cxc = 2 * CNN + 1;
            }
         } else {
            if ($ln =~ s~^(.{0,$mllm}\S)(?=\#|,|\ ([=+*/-]|\b
                     (OR|AND|NOT)\b)\ )~~x
               or (3 * CNN < $cxc
                  and $ln =~ s@^(.{0,$mllm}\S)(?=\s+\S)@@)) {
               my $res = $1;
               if ($res !~ m/$lv_cm0/) {
                  $ln =~ s/^\s*/$lead${bq}${bq}/;
               } else {
                  $ln =~ s/^\s*/$lead${bq}$lv_cm0/;
               }
               $ree .= "$res\n";
            }

            if (6 * CNN < $cxc) {
               die "$0:Long line:" . length($ln) . ":$ree\n"
                  .  "$0:Long line:" . $ln;
            } elsif (5 * CNN < $cxc) {
               $ln =~ s/^   //;
            } elsif (4 * CNN < $cxc) {
               $ln =~ s/----/---/;
            }
         }
      }
      if ($cxc != 0 and $verbose) {
         print STDERR "AFTERR:$cxc:$ln";
      }
   }
   $ree . $ln;
}

1;
