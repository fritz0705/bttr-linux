.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xf86-input-evdev-2.7.3/configure --prefix=$(PREFIX)
	@touch configure

prepare: xf86-input-evdev-2.7.3.tar.bz2
	tar xjf xf86-input-evdev-2.7.3.tar.bz2
	@mkdir build
	@touch prepare

xf86-input-evdev-2.7.3.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/driver/xf86-input-evdev-2.7.3.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xf86-input-evdev-2.7.3.tar.bz2
	$(RM) -r build/
	$(RM) -r xf86-input-evdev-2.7.3/

