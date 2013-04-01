.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=4.2.2
FETCH=curl

all: build

fetch: sed-$(VERSION).tar.gz
unpack: sed-$(VERSION)/
patch: unpack
prepare: sed-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../sed-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r sed-$(VERSION)/

distclean: clean
	$(RM) sed-$(VERSION).tar.gz

sed-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/sed/sed-$(VERSION).tar.gz > $@

sed-$(VERSION)/: sed-$(VERSION).tar.gz
	tar xzf $<

