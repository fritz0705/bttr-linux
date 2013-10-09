.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.12.1
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) $(CONFIGURE_FLAGS)

all: build

fetch: isl-$(VERSION).tar.bz2
unpack: | isl-$(VERSION)/
patch: unpack
prepare: | isl-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../isl-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r isl-$(VERSION)/

distclean: clean
	$(RM) isl-$(VERSION).tar.bz2

isl-$(VERSION)/: isl-$(VERSION).tar.bz2
	tar xaf $<

isl-$(VERSION).tar.bz2:
	$(FETCH) http://isl.gforge.inria.fr/isl-$(VERSION).tar.gz > $@

