.PHONY: all fetch unpack build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.18.2.1
FETCH?=curl

all: build

fetch: gettext-$(VERSION).tar.gz
unpack: gettext-$(VERSION)/
patch: gettext-$(VERSION)/
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-runtime/gnulib-lib/stdio.in.h
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-tools/libgettextpo/stdio.in.h
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-tools/gnulib-lib/stdio.in.h
	@touch $@

prepare: gettext-$(VERSION)/ patch
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gettext-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure patch
	$(RM) -r build/
	$(RM) -r gettext-$(VERSION)/

distclean: clean
	$(RM) gettext-$(VERSION).tar.gz

gettext-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gettext/gettext-$(VERSION).tar.gz > $@

gettext-$(VERSION)/: gettext-$(VERSION).tar.gz
	tar xzf $<

