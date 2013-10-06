.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.6.16
FETCH?=curl -L --retry 3

override CONFIGURE_FLAGS := --prefix=$(PREFIX) $(CONFIGURE_FLAGS)

all: build

fetch: ldns-$(VERSION).tar.gz
unpack: | ldns-$(VERSION)/
patch: unpack
prepare: | ldns-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../ldns-$(VERSION)/configure $(CONFIGURE_FLAGS)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) configure prepare
	$(RM) -r ldns-$(VERSION)/

distclean: clean
	$(RM) ldns-$(VERSION).tar.gz

ldns-$(VERSION)/: ldns-$(VERSION).tar.gz
	tar xaf $<

ldns-$(VERSION).tar.gz:
	$(FETCH) http://www.nlnetlabs.nl/downloads/ldns/ldns-$(VERSION).tar.gz > $@

