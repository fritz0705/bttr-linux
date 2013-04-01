.PHONY: all fetch unpack patch build install clean distclean

PREFIX=/usr
DESTDIR=
VERSION=1.10
FETCH=curl

all: build

fetch: gdbm-$(VERSION).tar.gz
unpack: gdbm-$(VERSION)/
patch: unpack
prepare: gdbm-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../gdbm-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r gdbm-$(VERSION)/

distclean: clean
	$(RM) gdbm-$(VERSION).tar.gz

gdbm-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.gnu.org/gnu/gdbm/gdbm-$(VERSION).tar.gz > $@

gdbm-$(VERSION)/: gdbm-$(VERSION).tar.gz
	tar xzf $<

