.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
DESTDIR?=
VERSION?=1.6.8
FETCH?=curl -L --retry 3

all: build

fetch: dbus-$(VERSION).tar.gz
unpack: dbus-$(VERSION)/
patch: unpack
prepare: dbus-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../dbus-$(VERSION)/configure --prefix=$(PREFIX)
	@touch $@

build: configure
	$(MAKE) -C build

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare configure
	$(RM) -r build/
	$(RM) -r dbus-$(VERSION)

distclean: clean
	$(RM) dbus-$(VERSION).tar.gz

dbus-$(VERSION).tar.gz:
	$(FETCH) http://dbus.freedesktop.org/releases/dbus/dbus-$(VERSION).tar.gz > $@

dbus-$(VERSION)/: dbus-$(VERSION).tar.gz
	tar xzf $<


.PHONY: Version
Version:
	@echo $(VERSION) > $@

