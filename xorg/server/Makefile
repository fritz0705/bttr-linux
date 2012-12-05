PREFIX=/usr
SYSCONFDIR=/etc/X11
LOCALSTATEDIR=/var
DESTDIR=

all: prepare
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
	$(MAKE) -C build

prepare: xorg-server-1.13.0.901.tar.bz2
	tar xjf xorg-server-1.13.0.901.tar.bz2
	mkdir -p build
	touch prepare

xorg-server-1.13.0.901.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/xserver/xorg-server-1.13.0.901.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xorg-server-1.13.0.901.tar.bz2
	rm -rf xorg-server-1.13.0.901

