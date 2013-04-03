.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.0.1e
FETCH?=curl -k

TARGET ?= $(shell uname -m)

ifeq ($(TARGET),x86_64)
	openssl_target="linux-x86_64"
else
	openssl_target="linux-elf"
endif

all: build

fetch: openssl-$(VERSION).tar.gz
unpack: openssl-$(VERSION)/
patch: unpack
prepare: patch

configure: prepare
	cd openssl-$(VERSION) && ./Configure --prefix=$(PREFIX) shared zlib enable-md2 $(openssl_target)
	@touch $@

build: configure
	$(MAKE) -C openssl-$(VERSION) -j 1 depend
	$(MAKE) -C openssl-$(VERSION) -j 1

install: build
	$(MAKE) -C openssl-$(VERSION) install INSTALL_PREFIX=$(DESTDIR)

clean:
	$(RM) configure
	$(RM) -r openssl-$(VERSION)/

distclean: clean
	$(RM) openssl-$(VERSION).tar.gz

openssl-$(VERSION).tar.gz:
	$(CURL) https://www.openssl.org/source/openssl-$(VERSION).tar.gz > $@

openssl-$(VERSION)/: openssl-$(VERSION).tar.gz
	tar xzf $<

