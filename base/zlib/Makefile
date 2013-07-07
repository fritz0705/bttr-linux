.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=

VERSION?=1.2.8
FETCH?=curl

all: build

fetch: zlib-$(VERSION).tar.gz
unpack: zlib-$(VERSION)/
patch: unpack
prepare: zlib-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd zlib-$(VERSION) && ./configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C zlib-$(VERSION)

install: build
	$(MAKE) -C zlib-$(VERSION) install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r zlib-$(VERSION)/

distclean: clean
	$(RM) zlib-$(VERSION).tar.gz

zlib-$(VERSION).tar.gz:
	$(FETCH) http://zlib.net/zlib-$(VERSION).tar.gz > $@

zlib-$(VERSION)/: zlib-$(VERSION).tar.gz
	tar xzf $<

