#! /usr/bin/make -f
#    Copyright (C) 2015-2021 by Kevin D. Woerner
# 2021-05-14 kdw  fwip func renam
# 2021-02-01 kdw  fwip.tab added
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
   $(kdir_bindir_script)/fwip-tree

.PHONY : all
all : $(FWIP_SCRIPT) $(FWIP_TAB)

$(FWIP_TAB) : $(srcdir)/fwip.y

$(FWIP_SCRIPT) : $(FWIP_MODULE)

include $(MAKEDIR)/Makefile.end
