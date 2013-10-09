.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
SYSCONFDIR?=/etc
LIBDIR=/lib
DESTDIR?=
VERSION?=2.34.3
FETCH?=curl -L --retry 3

all: build

fetch: glib-$(VERSION).tar.xz
unpack: glib-$(VERSION)/
patch: unpack
prepare: glib-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../glib-$(VERSION)/configure --prefix=$(PREFIX) --libdir=$(LIBDIR) \
		--sysconfdir=$(SYSCONFDIR) --with-pcre=system --disable-fam \
		PYTHON=python2
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r glib-$(VERSION)/

distclean: clean
	$(RM) glib-$(VERSION).tar.xz

glib-$(VERSION).tar.xz:
	$(FETCH) http://ftp.gnome.org/pub/GNOME/sources/glib/2.34/glib-$(VERSION).tar.xz > $@

glib-$(VERSION)/: glib-$(VERSION).tar.xz
	tar xJf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

