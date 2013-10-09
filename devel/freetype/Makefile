.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.4.11
FETCH?=curl -L --retry 3

all: build

fetch: freetype-$(VERSION).tar.bz2
unpack: freetype-$(VERSION)/
patch: unpack
prepare: freetype-$(VERSION)/
	mkdir build
	@touch $@

configure: prepare
	cd build && ../freetype-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r freetype-$(VERSION)/

distclean: clean
	$(RM) freetype-$(VERSION).tar.bz2

freetype-$(VERSION).tar.bz2:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/freetype/freetype-$(VERSION).tar.bz2 > $@

freetype-$(VERSION)/: freetype-$(VERSION).tar.bz2
	tar xjf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

