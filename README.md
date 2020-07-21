# FWIP-Support
#    Copyright (C) 2020 by Kevin D. Woerner
# 2020-07-21 kdw  created

Programs implementing the FWIP meta-language

I got tired of writing a useful function in one language,
   discovering it would be useful in another language,
   porting it over,
   discovering some bug / glitch in said function
   fixing it in one place and not the other,
   and then wonder why it wasn't working the code I didn't fix.

So I wrote a 'meta-language', FWIP with a very simplistic syntax,
   that I could write my useful functions in,
   and then have the computer spew out code for various languages
   (currently Supported languages: Python, Perl, GNU BC,
      Visual Basic 6, and VB.Net)

Typical usage:
   fwip-preprocess Kw.fwip |
      fwip.tab |
      fwip-formaty |
      fwip-translator -nKw --py > Kw.py
