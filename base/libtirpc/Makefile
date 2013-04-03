.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.2.2
FETCH?=curl

all: build

fetch: libtirpc-$(VERSION).tar.bz2
unpack: libtirpc-$(VERSION)/
patch: unpack
prepare: libtirpc-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd libtirpc-$(VERSION) && ./configure --prefix=$(PREFIX) \
		--enable-gss
	@touch $@

build: configure
	$(MAKE) -C libtirpc-$(VERSION)

install: build
	$(MAKE) -C libtirpc-$(VERSION) install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libtirpc-$(VERSION)/

distclean: clean
	$(RM) libtirpc-$(VERSION).tar.bz2

libtirpc-$(VERSION).tar.bz2:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-$(VERSION).tar.bz2 > $@

libtirpc-$(VERSION)/: libtirpc-$(VERSION).tar.bz2
	tar xzf $<

