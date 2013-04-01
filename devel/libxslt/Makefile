.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.1.28
FETCH=curl

all: build

fetch: libxslt-$(VERSION).tar.gz
unpack: libxslt-$(VERSION)/
patch: unpack
prepare: libxslt-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libxslt-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libxslt-$(VERSION)/

distclean: clean
	$(RM) libxslt-$(VERSION).tar.gz

libxslt-$(VERSION).tar.gz:
	$(FETCH) ftp://xmlsoft.org/libxml2/libxslt-$(VERSION).tar.gz > $@

libxslt-$(VERSION)/: libxslt-$(VERSION).tar.gz
	tar xzf $<

