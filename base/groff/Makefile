.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.22.2
FETCH?=curl -L --retry 3

override __CONFIGURE_FLAGS := --prefix=$(PREFIX)
ifeq ($(WITH_X11),yes)
override __CONFIGURE_FLAGS += --with-x
else
override __CONFIGURE_FLAGS += --without-x
endif
override __CONFIGURE_FLAGS += $(CONFIGURE_FLAGS)

all: build

fetch: groff-$(VERSION).tar.gz
unpack: groff-$(VERSION)/
patch: unpack
prepare: groff-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../groff-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r groff-$(VERSION)/

distclean: clean
	$(RM) groff-$(VERSION).tar.gz

groff-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/groff/groff-$(VERSION).tar.gz > $@

groff-$(VERSION)/: groff-$(VERSION).tar.gz
	tar xzf $<

