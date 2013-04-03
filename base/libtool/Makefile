.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.4.2
FETCH?=curl

all: build

fetch: libtool-$(VERSION).tar.gz
unpack: libtool-$(VERSION)/
patch: unpack
prepare: libtool-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libtool-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libtool-$(VERSION)/

distclean: clean
	$(RM) libtool-$(VERSION).tar.gz

libtool-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/libtool/libtool-$(VERSION).tar.gz > $@

libtool-$(VERSION)/: libtool-$(VERSION).tar.gz
	tar xzf $<

