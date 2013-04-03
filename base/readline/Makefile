.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=6.2
FETCH?=curl

all: build

fetch: readline-$(VERSION).tar.gz
unpack: readline-$(VERSION)/
patch: unpack
prepare: readline-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../readline-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r readline-$(VERSION)/

distclean: clean
	$(RM) readline-$(VERSION).tar.gz

readline-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/readline/readline-$(VERSION).tar.gz > $@

readline-$(VERSION)/: readline-$(VERSION).tar.gz
	tar xzf $<

