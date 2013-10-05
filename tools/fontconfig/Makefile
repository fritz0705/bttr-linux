.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
SYSCONFDIR?=/etc
LOCALSTATEDIR?=/var
DESTDIR?=
VERSION?=2.10.2
FETCH?=curl -L --retry 3

all: build

fetch: fontconfig-$(VERSION).tar.bz2
unpack: fontconfig-$(VERSION)/
patch: unpack
prepare: fontconfig-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../fontconfig-$(VERSION)/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) \
		--with-templatedir=$(SYSCONFDIR)/fonts/conf.avail \
		--with-xmldir=$(SYSCONFDIR)/fonts \
		--localstatedir=$(LOCALSTATEDIR) \
		--disable-static \
		--with-default-fonts=$(PREFIX)/share/fonts \
		--with-add-fonts=$(PREFIX)/share/fonts
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r fontconfig-$(VERSION)/

distclean: clean
	$(RM) fontconfig-$(VERSION).tar.bz2

fontconfig-$(VERSION).tar.bz2:
	$(FETCH) http://www.fontconfig.org/release/fontconfig-$(VERSION).tar.bz2 > $@

fontconfig-$(VERSION)/: fontconfig-$(VERSION).tar.bz2
	tar xjf $<

