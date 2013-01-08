.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc/X11
LOCALSTATEDIR=/var
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xorg-server-1.13.0.901/configure --prefix=$(PREFIX) \
		--enable-ipv6 \
		--enable-dri \
		--enable-dmx \
		--enable-xvfb \
		--enable-xnest \
		--enable-composite \
		--enable-xcsecurity \
		--enable-xorg \
		--enable-xephyr \
		--enable-glx-tls \
		--enable-kdrive \
		--enable-kdrive-evdev \
		--enable-kdrive-kbd \
		--enable-kdrive-mouse \
		--enable-install-setuid \
		--enable-config-udev \
		--disable-config-dbus \
		--enable-record \
		--disable-xfbdev \
		--disable-xfake \
		--disable-static \
		--sysconfdir=$(SYSCONFDIR) \
		--localstatedir=$(LOCALSTATEDIR) \
		--with-xkb-path=$(PREFIX)/share/X11/xkb \
		--with-xkb-output=$(LOCALSTATEDIR)/lib/xkb \
		--with-fontrootdir=$(PREFIX)/share/fonts
	sed -i 's/chown/-chown/' build/hw/xfree86/Makefile
	@touch configure

prepare: xorg-server-1.13.0.901.tar.bz2
	tar xjf xorg-server-1.13.0.901.tar.bz2
	@mkdir build
	@touch prepare

xorg-server-1.13.0.901.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/xserver/xorg-server-1.13.0.901.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xorg-server-1.13.0.901.tar.bz2
	$(RM) -r build/
	$(RM) -r xorg-server-1.13.0.901/

