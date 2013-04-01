.PHONY: all fetch unpack build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.4.16
FETCH=curl

all: build

fetch: m4-$(VERSION).tar.gz
unpack: m4-$(VERSION)/
patch: unpack m4-$(VERSION)/
	sed -i -e '/gets is a/d' m4-$(VERSION)/lib/stdio.in.h
	@touch $@

prepare: patch m4-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../m4-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure patch
	$(RM) -r build/
	$(RM) -r m4-$(VERSION)/

distclean: clean
	$(RM) m4-$(VERSION).tar.gz

m4-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/m4/m4-$(VERSION).tar.gz > $@

m4-$(VERSION)/: m4-$(VERSION).tar.gz
	tar xzf $<

