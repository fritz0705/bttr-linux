DESTDIR?=
VERSION?=1

ARCH ?= $(shell uname -m)

# Empty targets
all:
fetch:
unpack:
patch:
prepare:
configure:
build:
clean:
distclean:

include install-$(ARCH).mk

install-$(ARCH).mk:
	$(error Unknown architecture $(ARCH))


.PHONY: Version
Version:
	@echo $(VERSION) > $@

