.PHONY: all build install clean

PREFIX=/usr
ifeq ($(PREFIX),/usr)
	SYSCONFDIR=/etc
else
	SYSCONFDIR=$(PREFIX)/etc
endif
DESTDIR=

all: build

build: configure
	$(MAKE) -C LVM2.2.02.98

configure: prepare
	cd LVM2.2.02.98 && ./configure --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) \
		--with-udev-prefix=$(UDEV_PREFIX) --enable-pkgconfig --enable-readline \
		--enable-dmeventd --enable-cmdlib --enable-applib --enable-udev_sync \
		--enable-udev_rules --enable-lvmetad
	@touch configure

prepare: LVM2.2.02.98.tgz
	tar xzf LVM2.2.02.98.tgz
	@mkdir build
	@touch prepare

LVM2.2.02.98.tgz:
	wget ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.98.tgz

install: build
	$(MAKE) -C LVM2.2.02.98 install_lvm2 install_device-mapper DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) -r LVM2.2.02.98.tgz
	$(RM) -r build/
	$(RM) -r LVM2.2.02.98/

