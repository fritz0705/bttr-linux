.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=

VERSION?=5.1
FETCH?=curl

all: build

fetch: texinfo-$(VERSION).tar.gz
unpack: texinfo-$(VERSION)/
patch: unpack
prepare: texinfo-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../texinfo-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r texinfo-$(VERSION)/

distclean: clean
	$(RM) texinfo-$(VERSION).tar.gz

texinfo-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/texinfo/texinfo-$(VERSION).tar.gz > $@

texinfo-$(VERSION)/: texinfo-$(VERSION).tar.gz
	tar xzf $<

