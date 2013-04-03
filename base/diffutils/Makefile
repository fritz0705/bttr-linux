.PHONY: all fetch unpack build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.3
FETCH?=curl

all: build

fetch: diffutils-$(VERSION).tar.xz
unpack: diffutils-$(VERSION)/
patch: diffutils-$(VERSION)
	sed -i -e '/gets is a/d' diffutils-$(VERSION)/lib/stdio.in.h
	@touch $@

prepare: diffutils-$(VERSION)/ patch
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../diffutils-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure patch
	$(RM) -r build/
	$(RM) -r diffutils-$(VERSION)/

distclean: clean
	$(RM) diffutils-$(VERSION).tar.xz

diffutils-$(VERSION).tar.xz:
	$(FETCH) ftp://ftp.gnu.org/gnu/diffutils/diffutils-$(VERSION).tar.xz > $@

diffutils-$(VERSION)/: diffutils-$(VERSION).tar.xz
	tar xJf $<

