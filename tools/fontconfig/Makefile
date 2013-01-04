.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../fontconfig-2.10.2/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) \
		--with-templatedir=$(SYSCONFDIR)/fonts/conf.avail \
		--with-xmldir=$(SYSCONFDIR)/fonts \
		--localstatedir=$(LOCALSTATEDIR) \
		--disable-static \
		--with-default-fonts=$(PREFIX)/share/fonts \
		--with-add-fonts=$(PREFIX)/share/fonts
	@touch configure

prepare: fontconfig-2.10.2.tar.bz2
	tar xjf fontconfig-2.10.2.tar.bz2
	@mkdir build
	@touch prepare

fontconfig-2.10.2.tar.bz2:
	wget http://www.fontconfig.org/release/fontconfig-2.10.2.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) fontconfig-2.10.2.tar.bz2
	$(RM) -r build/
	$(RM) -r fontconfig-2.10.2/

