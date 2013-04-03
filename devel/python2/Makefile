.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.7.3
FETCH?=curl

all: build

fetch: Python-$(VERSION).tar.bz2
unpack: Python-$(VERSION)/
patch: unpack
prepare: Python-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../Python-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r Python-$(VERSION)/

distclean: clean
	$(RM) Python-$(VERSION).tar.bz2

Python-$(VERSION).tar.bz2:
	$(FETCH) http://python.org/ftp/python/$(VERSION)/Python-$(VERSION).tar.bz2 > $@

