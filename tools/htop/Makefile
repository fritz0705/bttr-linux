.PHONY: all fetch unpack build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.0.2
FETCH?=curl

all: build

fetch: htop-$(VERSION).tar.gz
unpack: htop-$(VERSION)/
patch: htop-$(VERSION)/
	sed -i 's|ncursesw/curses.h|curses.h|' htop-$(VERSION)/RichString.c htop-$(VERSION)/RichString.h htop-$(VERSION)/configure
	@touch $@

prepare: patch htop-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../htop-$(VERSION)/configure --prefix=$(PREFIX) \
		--enable-unicode \
		--enable-openvz \
		--enable-vserver \
		--enable-cgroup
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) patch prepare configure
	$(RM) -r build/
	$(RM) -r htop-$(VERSION)/

distclean: clean
	$(RM) htop-$(VERSION).tar.gz

htop-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/htop/htop-$(VERSION).tar.gz > $@

htop-$(VERSION)/: htop-$(VERSION).tar.gz
	tar xzf $<

