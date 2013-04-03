.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.7
FETCH?=curl

all: build

fetch: bison-$(VERSION).tar.gz
unpack: bison-$(VERSION)/
patch: unpack
prepare: bison-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../bison-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r bison-$(VERSION)/

distclean: clean
	$(RM) bison-$(VERSION).tar.gz

bison-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/bison/bison-$(VERSION).tar.gz > $@

bison-$(VERSION)/: bison-$(VERSION).tar.gz
	tar xzf $<

