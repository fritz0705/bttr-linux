.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
SBINDIR?=/sbin
CONFDIR?=/etc/iproute2
ARPDDIR?=/var/lib/arpd
else
SBINDIR?=$(PREFIX)/sbin
CONFDIR?=$(PREFIX)/etc/iproute2
ARPDDIR?=$(PREFIX)/var/lib/arpd
endif

DESTDIR?=

VERSION?=3.8.0
FETCH?=curl

all: build

fetch: iproute2-$(VERSION).tar.gz
unpack: iproute2-$(VERSION)/
patch: unpack
prepare: iproute2-$(VERSION)/

configure: prepare
	cd iproute2-$(VERSION) && ./configure
	@touch $@

build: configure
	$(MAKE) -C iproute2-$(VERSION) PREFIX=$(PREFIX)

install: build
	$(MAKE) -C iproute2-$(VERSION) DESTDIR=$(DESTDIR) \
		SBINDIR=$(SBINDIR) CONFDIR=$(CONFDIR) ARPDDIR=$(ARPDIR) \
		install

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r iproute2-$(VERSION)/

distclean: clean
	$(RM) iproute2-$(VERSION).tar.gz

iproute2-$(VERSION).tar.gz:
	$(FETCH) http://kernel.org/pub/linux/utils/net/iproute2/iproute2-$(VERSION).tar.gz > $@

iproute2-$(VERSION)/: iproute2-$(VERSION).tar.gz
	tar xzf $<

