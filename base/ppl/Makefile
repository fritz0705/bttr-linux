.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.0.1
FETCH=curl

all: build

fetch: ppl-$(VERSION).tar.gz
unpack: ppl-$(VERSION)/
patch: unpack
prepare: ppl-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../ppl-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r ppl-$(VERSION)/

distclean: clean
	$(RM) ppl-$(VERSION).tar.gz

ppl-$(VERSION).tar.gz:
	$(FETCH) http://bugseng.com/products/ppl/download/ftp/releases/$(VERSION)/ppl-$(VERSION).tar.gz > $@

ppl-$(VERSION)/: ppl-$(VERSION).tar.gz
	tar xzf $<

