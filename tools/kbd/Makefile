.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=2.0.0
FETCH?=curl

all: build

fetch: kbd-$(VERSION).tar.gz
unpack: kbd-$(VERSION)/
patch: unpack
prepare: kbd-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../kbd-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build KEYCODES_PROGS=yes RESIZECONS_PROGS=yes

install: build
	$(MAKE) -C build KEYCODES_PROGS=yes RESIZECONS_PROGS=yes install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r kbd-$(VERSION)/

distclean: clean
	$(RM) kbd-$(VERSION).tar.gz

kbd-$(VERSION).tar.gz:
	$(FETCH) ftp://ftp.altlinux.org/pub/people/legion/kbd/kbd-$(VERSION).tar.gz > $@

kbd-$(VERSION)/: kbd-$(VERSION).tar.gz
	tar xzf $<

