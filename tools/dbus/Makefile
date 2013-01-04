.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../dbus-1.6.8/configure --prefix=$(PREFIX)
	@touch configure

prepare: dbus-1.6.8.tar.gz
	tar xzf dbus-1.6.8.tar.gz
	@mkdir build
	@touch prepare

dbus-1.6.8.tar.gz:
	wget http://dbus.freedesktop.org/releases/dbus/dbus-1.6.8.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) dbus-1.6.8.tar.gz
	$(RM) -r build/
	$(RM) -r dbus-1.6.8
