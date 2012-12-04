PREFIX=/usr
DESTDIR=
SYSCONFDIR=/etc

all: prepare
	cd LVM2.2.02.98 && ./configure --prefix=$(PREFIX) --sysconfdir=$(SYSCONFDIR) \
		--with-udev-prefix=$(UDEV_PREFIX) --enable-pkgconfig --enable-readline \
		--enable-dmeventd --enable-cmdlib --enable-applib --enable-udev_sync \
		--enable-udev_rules --enable-lvmetad
	$(MAKE) -C LVM2.2.02.98

prepare: LVM2.2.02.98.tgz
	tar xzf LVM2.2.02.98.tgz
	mkdir -p build
	touch prepare

LVM2.2.02.98.tgz:
	wget ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.98.tgz

install: all
	$(MAKE) -C LVM2.2.02.98 install_lvm2 install_device-mapper DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf LVM2.2.02.98
	rm -f LVM2.2.02.98.tgz
