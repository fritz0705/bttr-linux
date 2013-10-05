.PHONY: all fetch unpack patch build install clean distclean

PREFIX ?= /usr
DESTDIR ?=
VERSION ?= 2.4.47
FETCH ?= curl -L --retry 3

all: build

fetch: attr-$(VERSION).src.tar.gz
unpack: attr-$(VERSION)/
patch: unpack
prepare: attr-$(VERSION)/

configure: prepare
	cd attr-$(VERSION) && ./configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C attr-$(VERSION)

install: build
	$(MAKE) -C attr-$(VERSION) install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r attr-$(VERSION)/

distclean: clean
	$(RM) attr-$(VERSION).src.tar.gz

attr-$(VERSION)/: attr-$(VERSION).src.tar.gz
	tar xzf $<

attr-$(VERSION).src.tar.gz:
	$(FETCH) http://download.savannah.gnu.org/releases/attr/attr-$(VERSION).src.tar.gz > $@

