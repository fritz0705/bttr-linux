.PHONY: all fetch unpack patch build install clean distclean

PREFIX ?= /usr
DESTDIR ?=
VERSION ?= 2.69
FETCH ?= curl -L --retry 3

all: build

fetch: autoconf-$(VERSION).tar.gz
unpack: autoconf-$(VERSION)/
patch: unpack
prepare: autoconf-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../autoconf-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) prepare configure
	$(RM) -r autoconf-$(VERSION)/

distclean: clean
	$(RM) autoconf-$(VERSION).tar.gz

autoconf-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/autoconf/autoconf-$(VERSION).tar.gz > $@

autoconf-$(VERSION)/: autoconf-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

