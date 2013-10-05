.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.1.2
FETCH?=curl -L --retry 3

all: build

fetch: mpfr-$(VERSION).tar.gz
unpack: mpfr-$(VERSION)/
patch: unpack
prepare: mpfr-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../mpfr-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-thread-safe \
		--enable-shared
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r mpfr-$(VERSION)/

distclean: clean
	$(RM) mpfr-$(VERSION).tar.gz

mpfr-$(VERSION).tar.gz:
	$(FETCH) http://www.mpfr.org/mpfr-current/mpfr-$(VERSION).tar.gz > $@

mpfr-$(VERSION)/: mpfr-$(VERSION).tar.gz
	tar xzf $<

