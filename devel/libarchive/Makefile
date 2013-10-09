.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=3.1.2
FETCH?=curl -L --retry 3

all: build

fetch: libarchive-$(VERSION).tar.gz
unpack: libarchive-$(VERSION)/
patch: unpack
prepare: libarchive-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libarchive-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libarchive-$(VERSION)/

distclean: clean
	$(RM) libarchive-$(VERSION).tar.gz

libarchive-$(VERSION).tar.gz:
	$(FETCH) http://libarchive.org/downloads/libarchive-$(VERSION).tar.gz > $@

libarchive-$(VERSION)/: libarchive-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

