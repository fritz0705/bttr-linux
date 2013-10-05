.PHONY: all fetch unpack build install clean distclean

PREFIX?=/usr
DESTDIR?=

VERSION?=1.26
FETCH?=curl -L --retry 3

all: build

fetch: tar-$(VERSION).tar.gz
unpack: tar-$(VERSION)/
patch: tar-$(VERSION)/
	sed -i -e '/gets is a/d' tar-$(VERSION)/gnu/stdio.in.h
	@touch $@

prepare: patch tar-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../tar-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) patch prepare configure
	$(RM) -r build/
	$(RM) -r tar-$(VERSION)/

distclean: clean
	$(RM) tar-$(VERSION).tar.gz

tar-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/tar/tar-$(VERSION).tar.gz > $@

tar-$(VERSION)/: tar-$(VERSION).tar.gz
	tar xzf $<

