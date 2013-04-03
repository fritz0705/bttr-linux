.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=0.50.2
FETCH?=curl -k

all: build

fetch: intltool-$(VERSION).tar.gz
unpack: intltool-$(VERSION)/
patch: unpack
prepare: intltool-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../intltool-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r intltool-$(VERSION)/

distclean: clean
	$(RM) intltool-$(VERSION).tar.gz

intltool-$(VERSION).tar.gz:
	$(FETCH) http://edge.launchpad.net/intltool/trunk/$(VERSION)/+download/intltool-$(VERSION).tar.gz > $@

intltool-$(VERSION)/: intltool-$(VERSION).tar.gz
	tar xzf $<

