.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
FETCH=curl
VERSION=5.01

all: build

fetch: syslinux-$(VERSION).tar.xz
unpack: syslinux-$(VERSION)/
patch: unpack
prepare: syslinux-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../syslinux-$(VERSION)/configure \
		--prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build/

install: build
	$(MAKE) -C build/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r syslinux-$(VERSION)/

distclean: clean
	$(RM) syslinux-$(VERSION).tar.xz

syslinux-$(VERSION).tar.xz:
	$(FETCH) http://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-$(VERSION).tar.xz > $@
	
syslinux-$(VERSION)/: syslinux-$(VERSION).tar.xz
	tar xJf $<

