.PHONY: all fetch unpack patch prepare build install clean distclean

PREFIX=/usr
ifeq ($(PREFIX),/usr)
	SYSCONFDIR=/etc
else
	SYSCONFDIR=$(PREFIX)/etc
endif
DESTDIR=

VERSION=2.2.02.98
FETCH=curl

all: build

fetch: LVM$(VERSION).tgz
unpack: LVM$(VERSION)/
patch: unpack
prepare: patch LVM$(VERSION)/

configure: prepare
	cd LVM$(VERSION) && ./configure --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) \
		--with-udev-prefix=$(UDEV_PREFIX) --enable-pkgconfig --enable-readline \
		--enable-dmeventd --enable-cmdlib --enable-applib --enable-udev_sync \
		--enable-udev_rules --enable-lvmetad
	@touch $@

build: configure
	$(MAKE) -C LVM$(VERSION)

install: build
	$(MAKE) -C LVM$(VERSION) install_lvm2 install_device-mapper DESTDIR=$(DESTDIR)

clean:
	$(RM) configure
	$(RM) -r LVM$(VERSION)/

distclean: clean
	$(RM) -r LVM$(VERSION).tgz

LVM$(VERSION).tgz:
	$(FETCH) ftp://sources.redhat.com/pub/lvm2/LVM$(VERSION).tgz > $@

LVM$(VERSION)/: LVM$(VERSION).tgz
	tar xzf $<

