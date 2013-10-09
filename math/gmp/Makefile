.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=5.1.3
FETCH?=curl -L --retry 3

all: build

fetch: gmp-$(VERSION).tar.bz2
unpack: gmp-$(VERSION)/
patch: unpack
prepare: gmp-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gmp-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-cxx
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure prepare
	$(RM) -r build/
	$(RM) -r gmp-$(VERSION)/

distclean: clean
	$(RM) gmp-$(VERSION).tar.bz2

gmp-$(VERSION).tar.bz2:
	$(FETCH) ftp://ftp.gmplib.org/pub/gmp-$(VERSION)/gmp-$(VERSION).tar.bz2 > $@

gmp-$(VERSION)/: gmp-$(VERSION).tar.bz2
	tar xjf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

