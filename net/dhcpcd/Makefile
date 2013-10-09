.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=5.6.7
FETCH?=curl -L --retry 3

all: build

fetch: dhcpcd-$(VERSION).tar.bz2
unpack: dhcpcd-$(VERSION)/
patch: unpack
prepare: dhcpcd-$(VERSION)/

configure: prepare
	cd dhcpcd-$(VERSION)/ && ./configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C dhcpcd-$(VERSION)/

install: build
	$(MAKE) -C dhcpcd-$(VERSION)/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) configure
	$(RM) -r dhcpcd-$(VERSION)/

distclean: clean
	$(RM) dhcpcd-$(VERSION).tar.bz2

dhcpcd-$(VERSION).tar.bz2:
	$(FETCH) http://roy.marples.name/downloads/dhcpcd/dhcpcd-$(VERSION).tar.bz2 > $@

dhcpcd-$(VERSION)/: dhcpcd-$(VERSION).tar.bz2
	tar xjf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

