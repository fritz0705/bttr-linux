.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.10.09
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) $(CONFIGURE_FLAGS)

all: build

fetch: nasm-$(VERSION).tar.xz
unpack: | nasm-$(VERSION)/
patch: unpack
prepare: | nasm-$(VERSION)/

configure: prepare
	cd nasm-$(VERSION)/ && ./configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C nasm-$(VERSION)/

install: build
	$(MAKE) -C nasm-$(VERSION)/ install INSTALLROOT=$(DESTDIR)

clean:
	$(RM) configure prepare
	$(RM) -r nasm-$(VERSION)/

distclean: clean
	$(RM) nasm-$(VERSION).tar.xz

nasm-$(VERSION)/: nasm-$(VERSION).tar.xz
	tar xaf $<

nasm-$(VERSION).tar.xz:
	$(FETCH) http://www.nasm.us/pub/nasm/releasebuilds/$(VERSION)/nasm-$(VERSION).tar.xz > $@


.PHONY: Version
Version:
	@echo $(VERSION) > $@

