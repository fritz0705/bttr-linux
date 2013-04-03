.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.29
FETCH?=curl

LIBDIR?=$(PREFIX)/lib

ifeq ($(PREFIX),/)
INCLUDEDIR?=/usr/include
else
INCLUDEDIR?=$(PREFIX)/include
endif

ifeq ($(PREFIX),/)
MAN3DIR?=/usr/man/man3
else
MAN3DIR?=$(PREFIX)/man/man3
endif

all: build

fetch: libowfat-$(VERSION).tar.bz2
unpack: libowfat-$(VERSION)/
patch: unpack
prepare: patch
configure: prepare

build: configure
	$(MAKE) -C libowfat-$(VERSION)/

install: build
	$(MAKE) -C libowfat-$(VERSION)/ install \
		LIBDIR=$(DESTDIR)/$(LIBDIR) \
		INCLUDEDIR=$(DESTDIR)/$(INCLUDEDIR) \
		MAN3DIR=$(DESTDIR)/$(MAN3DIR)

clean:
	$(RM) prepare configure
	$(RM) -r libowfat-$(VERSION)/

distclean: clean
	$(RM) libowfat-$(VERSION).tar.gz

libowfat-$(VERSION).tar.bz2:
	$(FETCH) http://dl.fefe.de/libowfat-$(VERSION).tar.bz2 > $@

libowfat-$(VERSION)/: libowfat-$(VERSION).tar.bz2
	tar xjf $<

