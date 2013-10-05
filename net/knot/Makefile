.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.1.3
FETCH?=curl -L --retry 3

SYSCONFDIR?=$(PREFIX)/etc
LOCALSTATEDIR?=$(PREFIX)/var

ifeq ($(PREFIX),/usr)
SYSCONFDIR?=/etc/knot
LOCALSTATEDIR?=/var
endif

all: build

fetch: knot-$(VERSION).tar.gz
unpack: knot-$(VERSION)/
patch: unpack
prepare: knot-$(VERSION)/

configure: prepare
	cd knot-$(VERSION) && ./configure --prefix=$(PREFIX) --localstatedir=$(LOCALSTATEDIR) --sysconfdir=$(SYSCONFDIR)
	@touch $@

build: configure
	$(MAKE) -C knot-$(VERSION)/

install: build
	$(MAKE) -C knot-$(VERSION)/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure
	$(RM) -r knot-$(VERSION)/

distclean: clean
	$(RM) knot-$(VERSION).tar.gz

knot-$(VERSION).tar.gz:
	$(FETCH) https://secure.nic.cz/files/knot-dns/knot-$(VERSION).tar.gz > $@

knot-$(VERSION)/: knot-$(VERSION).tar.gz
	tar xzf $<

