.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
FETCH?=curl -L --retry 3
VERSION?=5.01

all: build

fetch: syslinux-$(VERSION).tar.xz
unpack: syslinux-$(VERSION)/
patch: unpack
prepare: | syslinux-$(VERSION)/
configure: prepare

build: configure
	$(MAKE) -C syslinux-$(VERSION)/

install: build
	$(MAKE) -C syslinux-$(VERSION)/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r syslinux-$(VERSION)/

distclean: clean
	$(RM) syslinux-$(VERSION).tar.xz

syslinux-$(VERSION).tar.xz:
	$(FETCH) http://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-$(VERSION).tar.xz > $@
	
syslinux-$(VERSION)/: syslinux-$(VERSION).tar.xz
	tar xJf $<

