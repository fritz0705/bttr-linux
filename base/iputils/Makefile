.PHONY: all fetch unpack patch prepare configure build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=s20121221
FETCH?=curl

all: build

fetch: iputils-$(VERSION).tar.bz2
unpack: iputils-$(VERSION)/
patch: unpack
prepare: iputils-$(VERSION)
configure: prepare

build: configure
	$(MAKE) -C iputils-$(VERSION)

install: build
	PREFIX=$(PREFIX) DESTDIR=$(DESTDIR) ./install.sh iputils-$(VERSION)

clean:
	$(RM) -r build/
	$(RM) -r iputils-$(VERSION)

distclean: clean
	$(RM) iputils-$(VERSION).tar.bz2

iputils-$(VERSION).tar.bz2:
	$(FETCH) http://www.skbuff.net/iputils/iputils-$(VERSION).tar.bz2 > $@

iputils-$(VERSION)/: iputils-$(VERSION).tar.bz2
	tar xjf $<

