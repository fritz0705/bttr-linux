.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.0.21-stable
FETCH?=curl

all: build

fetch: libevent-$(VERSION).tar.gz
unpack: libevent-$(VERSION)/
patch: unpack
prepare: libevent-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../libevent-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r libevent-$(VERSION)/

distclean: clean
	$(RM) libevent-$(VERSION).tar.gz

libevent-$(VERSION).tar.gz:
	$(FETCH) https://github.com/downloads/libevent/libevent/libevent-$(VERSION).tar.gz > $@

libevent-$(VERSION)/: libevent-$(VERSION).tar.gz
	tar xzf $<

