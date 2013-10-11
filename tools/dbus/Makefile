.PHONY: all fetch unpack patch build install clean distclean

PREFIX?=/usr
ifeq ($(PREFIX),/usr)
SYSCONFDIR?=/etc
else
SYSCONFDIR?=$(PREFIX)/etc
endif
ifeq ($(PREFIX),/usr)
LOCALSTATEDIR?=/var
else
LOCALSTATEDIR?=$(PREFIX)/var
endif
DESTDIR?=
VERSION?=1.6.8
FETCH?=curl -L --retry 3

all: build

override __CONFIGURE_FLAGS := --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) \
	--localstatedir=$(LOCALSTATEDIR) $(CONFIGURE_FLAGS)

fetch: dbus-$(VERSION).tar.gz
unpack: | dbus-$(VERSION)/
patch: unpack
prepare: | dbus-$(VERSION)/
	mkdir build/
	@touch $@

configure: prepare
	cd build && ../dbus-$(VERSION)/configure $(__CONFIGURE_FLAGS)
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

