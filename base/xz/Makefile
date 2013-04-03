.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=5.0.4
FETCH?=curl

all: build

fetch: xz-$(VERSION).tar.gz
unpack: xz-$(VERSION)/
patch: unpack
prepare: xz-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../xz-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r xz-$(VERSION)/

distclean: clean
	$(RM) xz-$(VERSION).tar.gz

xz-$(VERSION).tar.gz:
	$(FETCH) http://tukaani.org/xz/xz-$(VERSION).tar.gz > $@
	
xz-$(VERSION)/: xz-$(VERSION).tar.gz
	tar xzf $<

