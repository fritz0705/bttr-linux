.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.6
FETCH?=curl -L --retry 3

all: build

fetch: gzip-$(VERSION).tar.gz
unpack: gzip-$(VERSION)/
patch: unpack
prepare: gzip-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gzip-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r gzip-$(VERSION)/

distclean: clean
	$(RM) gzip-$(VERSION).tar.gz

gzip-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gzip/gzip-$(VERSION).tar.gz > $@

gzip-$(VERSION)/: gzip-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

