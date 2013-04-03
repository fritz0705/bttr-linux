.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.1.0
FETCH?=curl -L

all: build

fetch: expat-$(VERSION).tar.gz
unpack: expat-$(VERSION)/
patch: unpack
prepare: expat-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../expat-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure prepare
	$(RM) -r build/
	$(RM) -r expat-$(VERSION)/

distclean: clean
	$(RM) expat-$(VERSION).tar.gz

expat-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/expat/expat-$(VERSION).tar.gz > $@

expat-$(VERSION)/: expat-$(VERSION).tar.gz
	tar xzf $<

