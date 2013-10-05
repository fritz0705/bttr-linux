.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.5.2
FETCH?=curl -k -L --retry 3

all: build

fetch: libbsd-$(VERSION).tar.xz
unpack: libbsd-$(VERSION)/
patch: unpack
prepare: libbsd-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libbsd-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libbsd-$(VERSION)/

distclean: clean
	$(RM) libbsd-$(VERSION).tar.xz

libbsd-$(VERSION).tar.xz:
	$(FETCH) http://libbsd.freedesktop.org/releases/libbsd-$(VERSION).tar.xz > $@

libbsd-$(VERSION)/: libbsd-$(VERSION).tar.xz
	tar xJf $<

