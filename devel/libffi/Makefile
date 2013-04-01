.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=3.0.13
FETCH=curl

all: build

fetch: libffi-$(VERSION).tar.gz
unpack: libffi-$(VERSION)/
patch: unpack
prepare: libffi-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libffi-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libffi-$(VERSION)/

distclean: clean
	$(RM) libffi-$(VERSION).tar.gz

libffi-$(VERSION).tar.gz:
	$(FETCH) ftp://sourceware.org/pub/libffi/libffi-$(VERSION).tar.gz > $@

libffi-$(VERSION)/: libffi-$(VERSION).tar.gz
	tar xzf $<

