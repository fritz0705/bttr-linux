.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.4.3
FETCH=curl

all: build
	
fetch: libssh2-$(VERSION).tar.gz
unpack: libssh2-$(VERSION)/
patch: unpack
prepare: libssh2-$(VERSION)/
	mkdir build
	@touch $@

configure: prepare
	cd build && ../libssh2-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libssh2-$(VERSION)/

distclean: clean
	$(RM) libssh2-$(VERSION).tar.gz

libssh2-$(VERSION).tar.gz:
	$(FETCH) http://www.libssh2.org/download/libssh2-$(VERSION).tar.gz > $@

libssh2-$(VERSION)/: libssh2-$(VERSION).tar.gz
	tar xzf $<

