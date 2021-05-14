package Fwip_Comment;
#    Copyright (C) 2017-2021 by Kevin D. Woerner
# 2021-04-14 kdw  rep char changed
# 2021-03-05 kdw  upped line length to 77
# 2020-06-18 kdw  optional arg added to fwi[p]c_comm
# 2019-12-09 kdw  rmed unused "use"s, exporter
# 2019-06-28 kdw  comment changed
# 2019-06-12 kdw  rmed var nul_to from f[w]ipc_set
# 2019-05-31 kdw  calc of "-"'s changed
# 2018-12-07 kdw  explicit imported funcitons
# 2018-12-06 kdw  commentized changed
# 2018-10-07 kdw  vb dot net work
# 2018-05-06 kdw  comme?ntized changed
# 2018-05-05 kdw  commentized changed
# 2018-03-02 kdw  export / renamd stuff
# 2017-07-04 kdw  func name changed
# 2017-05-31 kdw  do not export fwip-comment functions
# 2017-05-11 kdw  make 'package' line 1st; rm shebang line
# 2017-03-28 kdw  created
use strict;

sub FWIPC_LINE_LENGTH()   { 77; }

sub FWIPC_CM0 () { "#"; }
sub FWIPC_CM4 () { FWIPC_CM0 . "   "; }

{
   my $cmout0;
   my $cmout4;
   sub fwipc_set($ )
   {
      $cmout0 = $_[0];
      $cmout4 = $cmout0;
      my $lenn = 4 - length($cmout0);
      if (0 < $lenn) {
         $cmout4 .= (" " x $lenn);
      }

      ($cmout0, $cmout4);
   }

   fwipc_set("#");

   sub fwipc_comm($$;$ )
   {
      my $des = $_[0];
      my $txt = $_[1];
      my $prf = (defined($_[2]) ? $_[2] : "");
      my $prfstr = substr($des, 0, 1);
      my $outcm4 = "$cmout4";
      $des =~ s/(.)/ $1 x 10 /e;
      while (length($outcm4) < 4) {
         $outcm4 .= " ";
      }

      my $ss = "$prf$outcm4$des ";
      my $rr = " $txt #";
      my $nn = FWIPC_LINE_LENGTH - length($ss . $rr);

      my $ret = $ss . ("#" x $nn) . "$rr\n";
   }
}

1;
