.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.14
FETCH?=curl -L --retry 3

all: build

fetch: automake-$(VERSION).tar.gz
unpack: automake-$(VERSION)/
patch: unpack
prepare: automake-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../automake-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r automake-$(VERSION)/

distclean: clean
	$(RM) automake-$(VERSION).tar.gz

automake-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/automake/automake-$(VERSION).tar.gz > $@

automake-$(VERSION)/: automake-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

