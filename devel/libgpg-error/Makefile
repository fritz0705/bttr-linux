.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.11
FETCH?=curl -L --retry 3

all: build

fetch: libgpg-error-$(VERSION).tar.bz2
unpack: libgpg-error-$(VERSION)/
patch: unpack
prepare: libgpg-error-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libgpg-error-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libgpg-error-$(VERSION)/

distclean: clean
	$(RM) libgpg-error-$(VERSION).tar.bz2

libgpg-error-$(VERSION).tar.bz2:
	$(FETCH) ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-$(VERSION).tar.bz2 > $@

libgpg-error-$(VERSION)/: libgpg-error-$(VERSION).tar.bz2
	tar xjf $<
