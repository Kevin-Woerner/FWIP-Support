#! /usr/bin/make -f
#    Copyright (C) 2015-2020 by Kevin D. Woerner
# 2020-11-29 kdw  dependencies
# 2020-11-12 kdw  simplfied
# 2020-07-17 kdw  immensely simplified
# 2015-09-20 kdw  created

include ../Makefile.makedir

include $(MAKEDIR)/Makefile.beg

FWIP_MODULE:=$(patsubst $(srcdir)/%,$(kdir_bindir_include)/%, \
      $(wildcard $(srcdir)/*.pm))

FWIP_SCRIPT:=$(FWIP_TRANSLATOR) $(FWIP_PREPROCESS) \
   $(FWIP_DESC) $(FWIP_FORMATY) $(FWIP_TAB) $(FWIP_WRAP) \
   $(kdir_bindir_script)/fwe \
   $(kdir_bindir_script)/fwe-vb-run \
   $(kdir_bindir_script)/fwip2 \
   $(kdir_bindir_script)/fwip-call

$(FWIP_SCRIPT) : $(FWIP_MODULE)

.PHONY : all
all : $(FWIP_SCRIPT)

include $(MAKEDIR)/Makefile.end
