.PHONY: all fetch unpack build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.18.3
FETCH?=curl -L --retry 3

_cfg_flags =

_cfg_flags += $(if $(WITH_LIBCROCO),,--with-included-libcroco)
_cfg_flags += $(if $(WITH_GLIB),,--with-included-glib)
_cfg_flags += $(if $(WITH_LIBXML2),,--with-included-libxml)
_cfg_flags += $(if $(WITH_LIBUNISTRING),,--with-included-libunistring)

override CONFIGURE_FLAGS := $(_cfg_flags) $(CONFIGURE_FLAGS)

all: build

fetch: gettext-$(VERSION).tar.gz
unpack: gettext-$(VERSION)/
patch: gettext-$(VERSION)/
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-runtime/gnulib-lib/stdio.in.h
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-tools/libgettextpo/stdio.in.h
	sed -i -e '/gets is a/d' gettext-$(VERSION)/gettext-tools/gnulib-lib/stdio.in.h
	@touch $@

prepare: gettext-$(VERSION)/ patch
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gettext-$(VERSION)/configure --prefix=$(PREFIX) \
		$(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure patch
	$(RM) -r build/
	$(RM) -r gettext-$(VERSION)/

distclean: clean
	$(RM) gettext-$(VERSION).tar.gz

gettext-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gettext/gettext-$(VERSION).tar.gz > $@

gettext-$(VERSION)/: gettext-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

