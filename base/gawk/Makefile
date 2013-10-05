.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=4.1.0
FETCH?=curl -L --retry 3

all: build

fetch: gawk-$(VERSION).tar.gz
unpack: gawk-$(VERSION)/
patch: unpack
prepare: gawk-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gawk-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r gawk-$(VERSION)/

distclean: clean
	$(RM) gawk-$(VERSION).tar.gz

gawk-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gawk/gawk-$(VERSION).tar.gz > $@

gawk-$(VERSION)/: gawk-$(VERSION).tar.gz
	tar xzf $<

