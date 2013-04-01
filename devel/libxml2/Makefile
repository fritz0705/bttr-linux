.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=2.9.0
FETCH=curl

all: build

fetch: libxml2-$(VERSION).tar.gz
unpack: libxml2-$(VERSION)/
patch: unpack
prepare: libxml2-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libxml2-$(VERSION)/configure --prefix=$(PREFIX) \
		--with-threads --with-history
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libxml2-$(VERSION)/

distclean: clean
	$(RM) libxml2-$(VERSION).tar.gz

libxml2-$(VERSION).tar.gz:
	$(FETCH) ftp://xmlsoft.org/libxml2/libxml2-$(VERSION).tar.gz > $@

libxml2-$(VERSION)/: libxml2-$(VERSION).tar.gz
	tar xzf $<

