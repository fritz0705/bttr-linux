PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../dbus-1.6.8/configure --prefix=$(PREFIX)
	$(MAKE) -C build
	# Build instructions

prepare: dbus-1.6.8.tar.gz
	tar xzf dbus-1.6.8.tar.gz
	mkdir -p build
	touch prepare

dbus-1.6.8.tar.gz:
	wget http://dbus.freedesktop.org/releases/dbus/dbus-1.6.8.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f dbus-1.6.8.tar.gz
	rm -rf dbus-1.6.8

