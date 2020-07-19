#! /bin/bash
#    Copyright (C) 2017-2020 by Kevin D. Woerner
# 2020-03-25 kdw  added 2th and 3th arguments
# 2020-03-24 kdw  script name errors
# 2020-03-17 kdw  minor refactor
# 2020-02-28 kdw  file names
# 2019-09-05 kdw  file permissions
# 2019-07-12 kdw  K[W]_D[I]R_.* env vars
# 2019-06-27 kdw  form size changed
# 2019-06-12 kdw  0 output format
# 2019-05-31 kdw  dont print CR at end of output
# 2018-12-18 kdw  kwelements separated
# 2018-11-27 kdw  vb dir
# 2018-06-08 kdw  hex numbers
# 2018-06-07 kdw  refactor
# 2018-02-15 kdw  Kw(sun|planets)
# 2017-04-20 kdw  rmed refs to var name
# 2017-03-31 kdw  temp file name change
# 2017-03-01 kdw  rm output & exe files prior to recreating
# 2017-02-15 kdw  output format changed
# 2017-02-11 kdw  return if not Windows
# 2017-02-10 kdw  created

function vb_run ()
{
   if [ -z "$COMSPEC" ] ; then
      return -1;
   fi
   vb6_code="${1//===/sttvb = sttvb &}"
   shift
   temp_dir=$1
   shift
   bsfl=$1
   VBCYG_OUTFILE="$temp_dir/${bsfl}.tmp"
   VBDOS_OUTFILE=$(cygpath -aw "$VBCYG_OUTFILE")
   VBDOS_EXEDIR=$(cygpath -aw "$temp_dir")
   VBDOS_KWDIR=$(cygpath -aw "$KW_DIR_INCLUDE")

   cat <<EOF | perl -pe "s/\b0x([0-9a-fA-f]+)/\&H\$1/g" | \
         u2d > "$temp_dir/${bsfl}.frm"
VERSION 5.00
Begin VB.Form ${bsnm}
   Caption         =   "frm_${bsnm}"
   ClientHeight    =   200
   ClientLeft      =   60
   ClientTop       =   60
   ClientWidth     =   200
   LinkTopic       =   "frm_${bsnm}"
   ScaleHeight     =   200
   ScaleWidth      =   200
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "${bsnm}"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Function fmt(ev As Double) As String
   fmt = Format(ev, "+0.0000000000000000000e+00;" _
      & "-0.0000000000000000000e+00;+0")
End Function

Private Sub Form_Load()
   Dim sttvb As String
   Dim fn As String
   Dim fh As Integer

   'CODE INSERTION BEGIN
   $vb6_code
   'CODE INSERTION END

   fh = FreeFile()
   fn = "$VBDOS_OUTFILE"
   On Error GoTo LB_ERR
   Open fn For Output As #fh
   Print #fh, sttvb;
   Close (fh)
   GoTo LB_END
LB_ERR:
   Call MsgBox(Error() & ":" & fn & vbNewLine & sttvb)
LB_END:
   On Error GoTo 0
   Call Unload(Me)
End Sub
EOF
   chmod 640 "$temp_dir/${bsfl}.frm"

   cat <<EOF | u2d > "$temp_dir/${bsfl}.vbp"
Type=Exe
Form=${bsfl}.frm
Module=Kw; $VBDOS_KWDIR\\Kw.bas
Module=Kwsun; $VBDOS_KWDIR\\Kwsun.bas
Module=Kwplanets; $VBDOS_KWDIR\\Kwplanets.bas
Module=Kwelements; $VBDOS_KWDIR\\Kwelements.bas
Startup="${bsnm}"
HelpFile=""
Title="${bsnm}"
ExeName32="${bsfl}.exe"
Path32="$VBDOS_EXEDIR"
Command32=""
Name="${bsnm}_project"
HelpContextID="0"
CompatibleMode="0"
MajorVer=1
MinorVer=0
RevisionVer=0
AutoIncrementVer=0
ServerSupportFiles=0
VersionCompanyName="HOCNCaP Anthropoid"
CompilationType=0
OptimizationType=0
FavorPentiumPro(tm)=0
CodeViewDebugInfo=0
NoAliasing=0
BoundsCheck=0
OverflowCheck=0
FlPointCheck=0
FDIVCheck=0
UnroundedFP=0
StartMode=0
Unattended=0
Retained=0
ThreadPerObject=0
MaxNumberOfThreads=1
EOF
   chmod 640 "$temp_dir/${bsfl}.vbp"
   VBDOS_VBPFULL=$(cygpath -aw "$temp_dir/${bsfl}.vbp")

   rm -rf "$VBDOS_EXEDIR/${bsfl}.exe"
   vbdir="C:\\Program Files (x86)\\Microsoft Visual Studio\\VB98"
   "$(cygpath -au "$COMSPEC")" /C \
         "$vbdir\\vb6.exe" /m "$VBDOS_VBPFULL"

   if [ -e "$VBDOS_EXEDIR/${bsfl}.exe" ] ; then
      "$VBDOS_EXEDIR/${bsfl}.exe"
      cat "$VBCYG_OUTFILE"
   else
      echo "VB6 compilation failed"
   fi
}
