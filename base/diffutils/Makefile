.PHONY: all fetch unpack build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=3.3
FETCH=curl

all: build

fetch: diffutils-$(VERSION).tar.gz
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
	$(RM) diffutils-$(VERSION).tar.gz

diffutils-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/diffutils/diffutils-$(VERSION).tar.gz > $@

diffutils-$(VERSION)/: diffutils-$(VERSION).tar.gz
	tar xzf $<

