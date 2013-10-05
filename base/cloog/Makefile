.PHONY: all fetch unpack patch build install clean distclean

PREFIX ?= /usr
DESTDIR ?= 
VERSION ?= 0.18.0
FETCH ?= curl -L --retry 3

all: build

fetch: cloog-$(VERSION).tar.gz
unpack: cloog-$(VERSION)/
patch: unpack
prepare: cloog-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../cloog-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure prepare
	$(RM) -r build/
	$(RM) -r cloog-$(VERSION)/

distclean: clean
	$(RM) cloog-$(VERSION).tar.gz

cloog-$(VERSION).tar.gz:
	$(FETCH) http://www.bastoul.net/cloog/pages/download/cloog-$(VERSION).tar.gz > $@

cloog-$(VERSION)/: cloog-$(VERSION).tar.gz
	tar xzf $<

