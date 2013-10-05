.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.5.1
FETCH?=curl -L --retry 3

all: build

fetch: libgcrypt-$(VERSION).tar.bz2
unpack: libgcrypt-$(VERSION)/
patch: unpack
prepare: libgcrypt-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libgcrypt-$(VERSION)/configure --prefix=$(PREFIX) \
		--disable-static --disable-padlock-support
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libgcrypt-$(VERSION)/

distclean: clean
	$(RM) libgcrypt-$(VERSION).tar.bz2

libgcrypt-$(VERSION).tar.bz2:
	$(FETCH) ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-$(VERSION).tar.bz2 > $@

libgcrypt-$(VERSION)/: libgcrypt-$(VERSION).tar.bz2
	tar xjf $<

