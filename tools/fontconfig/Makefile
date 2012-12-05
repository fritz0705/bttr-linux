PREFIX=/usr
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
DESTDIR=

all: prepare
	cd build && ../fontconfig-2.10.2/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) \
		--with-templatedir=$(SYSCONFDIR)/fonts/conf.avail \
		--with-xmldir=$(SYSCONFDIR)/fonts \
		--localstatedir=$(LOCALSTATEDIR) \
		--disable-static \
		--with-default-fonts=$(PREFIX)/share/fonts \
		--with-add-fonts=$(PREFIX)/share/fonts
	$(MAKE) -C build

prepare: fontconfig-2.10.2.tar.bz2
	tar xjf fontconfig-2.10.2.tar.bz2
	mkdir -p build
	touch prepare

fontconfig-2.10.2.tar.bz2:
	wget http://www.fontconfig.org/release/fontconfig-2.10.2.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f fontconfig-2.10.2.tar.bz2
	rm -rf fontconfig-2.10.2

