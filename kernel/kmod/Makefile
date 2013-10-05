.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=14
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) $(CONFIGURE_FLAGS)

all: build

fetch: kmod-$(VERSION).tar.xz
unpack: kmod-$(VERSION)/
patch: unpack
prepare: | kmod-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../kmod-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r kmod-$(VERSION)/

distclean: clean
	$(RM) kmod-$(VERSION).tar.xz

kmod-$(VERSION)/: kmod-$(VERSION).tar.xz
	tar xJf $<

kmod-$(VERSION).tar.xz:
	$(FETCH) https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-$(VERSION).tar.xz > $@

