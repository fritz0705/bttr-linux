.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=20130601-3.1
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) --enable-widec $(CONFIGURE_FLAGS)

all: build

fetch: libedit-$(VERSION).tar.gz
unpack: | libedit-$(VERSION)/
patch: unpack
prepare: | libedit-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libedit-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r libedit-$(VERSION)/

distclean: clean
	$(RM) libedit-$(VERSION).tar.gz

libedit-$(VERSION)/: libedit-$(VERSION).tar.gz
	tar xaf $<

libedit-$(VERSION).tar.gz:
	$(FETCH) http://www.thrysoee.dk/editline/libedit-$(VERSION).tar.gz > $@

