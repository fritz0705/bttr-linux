PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xf86-input-evdev-2.7.3/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xf86-input-evdev-2.7.3.tar.bz2
	tar xjf xf86-input-evdev-2.7.3.tar.bz2
	mkdir -p build
	touch prepare

xf86-input-evdev-2.7.3.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/driver/xf86-input-evdev-2.7.3.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xf86-input-evdev-2.7.3.tar.bz2
	rm -rf xf86-input-evdev-2.7.3

