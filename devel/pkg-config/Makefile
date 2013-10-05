.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.28
FETCH?=curl -L --retry 3

configure_flags =

ifeq ($(HAVE_NO_GLIB),yes)
	configure_flags += --with-internal-glib
endif

all: build

fetch: pkg-config-$(VERSION).tar.gz
unpack: pkg-config-$(VERSION)/
patch: unpack
prepare: pkg-config-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../pkg-config-$(VERSION)/configure --prefix=$(PREFIX) $(configure_flags)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)
	ln -sf /usr/lib/pkgconfig $(DESTDIR)/lib/pkgconfig

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r pkg-config-$(VERSION)/

distclean: clean
	$(RM) pkg-config-$(VERSION).tar.gz

pkg-config-$(VERSION).tar.gz:
	$(FETCH) http://pkgconfig.freedesktop.org/releases/pkg-config-$(VERSION).tar.gz > $@

pkg-config-$(VERSION)/: pkg-config-$(VERSION).tar.gz
	tar xzf $<

