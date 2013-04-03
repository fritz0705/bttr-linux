.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.26
FETCH?=curl

all: build

fetch: libidn-$(VERSION).tar.gz
unpack: libidn-$(VERSION)/
patch: unpack
prepare: libidn-$(VERSION)/
	mkdir build
	@touch $@

configure: prepare
	cd build && ../libidn-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libidn-$(VERSION)/

distclean: clean
	$(RM) libidn-$(VERSION).tar.gz

libidn-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/libidn/libidn-$(VERSION).tar.gz > $@

libidn-$(VERSION)/: libidn-$(VERSION).tar.gz
	tar xzf $<
