.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.8.22
FETCH?=curl -L

all: build

fetch: cracklib-$(VERSION).tar.gz
unpack: cracklib-$(VERSION)/
patch: unpack
prepare: cracklib-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../cracklib-$(VERSION)/configure --prefix=$(PREFIX) \
		--without-python
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r cracklib-$(VERSION)/

distclean: clean
	$(RM) cracklib-$(VERSION).tar.gz

cracklib-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/cracklib/cracklib-$(VERSION).tar.gz > $@

cracklib-$(VERSION)/: cracklib-$(VERSION).tar.gz
	tar xzf $<

