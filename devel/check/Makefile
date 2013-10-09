.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.9.10
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) --disable-static $(CONFIGURE_FLAGS)

all: build

fetch: check-$(VERSION).tar.gz
unpack: | check-$(VERSION)/
patch: unpack
prepare: | check-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../check-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r check-$(VERSION)/

distclean: clean
	$(RM) check-$(VERSION).tar.gz

check-$(VERSION)/: check-$(VERSION).tar.gz
	tar xaf $<

check-$(VERSION).tar.gz:
	$(FETCH) http://downloads.sourceforge.net/sourceforge/check/check-$(VERSION).tar.gz > $@



.PHONY: Version
Version:
	@echo $(VERSION) > $@

