.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=2.2.51
FETCH=curl

all: build

fetch: acl-$(VERSION).src.tar.gz
unpack: acl-$(VERSION)/
patch: unpack
prepare: acl-$(VERSION)/

configure: prepare
	cd acl-$(VERSION)/ && ./configure --prefix=$(PREFIX)
	@touch configure

build: configure
	$(MAKE) -C acl-$(VERSION)

install: build
	$(MAKE) -C acl-$(VERSION)/ install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r acl-$(VERSION)/

distclean: clean
	$(RM) acl-$(VERSION).src.tar.gz

acl-$(VERSION)/: acl-$(VERSION).src.tar.gz
	tar xzf $<

acl-$(VERSION).src.tar.gz:
	$(FETCH) http://mirror3.layerjet.com/nongnu/acl/acl-$(VERSION).src.tar.gz > $@

