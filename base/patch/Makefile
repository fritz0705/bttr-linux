.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=2.7.1
FETCH=curl

all: build

fetch: patch-$(VERSION).tar.gz
unpack: patch-$(VERSION)/
patch: unpack
prepare: patch-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../patch-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r patch-$(VERSION)/

distclean: clean
	$(RM) patch-$(VERSION).tar.gz

patch-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/patch/patch-$(VERSION).tar.gz > $@

patch-$(VERSION)/: patch-$(VERSION).tar.gz
	tar xzf $<

