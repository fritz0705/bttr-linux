.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=4.4.2
FETCH?=curl

all: build

fetch: findutils-$(VERSION).tar.gz
unpack: findutils-$(VERSION)/
patch: unpack
prepare: findutils-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../findutils-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r findutils-$(VERSION)/

distclean: clean
	$(RM) findutils-$(VERSION).tar.gz

findutils-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/findutils/findutils-$(VERSION).tar.gz > $@
	
findutils-$(VERSION)/: findutils-$(VERSION).tar.gz
	tar xzf $<

