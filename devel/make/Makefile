.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=4.0
FETCH?=curl -L --retry 3

all: build

fetch: make-$(VERSION).tar.gz
unpack: make-$(VERSION)/
patch: unpack
prepare: make-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../make-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build all

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r make-$(VERSION)/

distclean: clean
	$(RM) make-$(VERSION).tar.gz

make-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/make/make-$(VERSION).tar.gz > $@

make-$(VERSION)/: make-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

