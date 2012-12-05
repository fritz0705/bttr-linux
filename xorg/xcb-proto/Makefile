PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xcb-proto-1.8/configure --prefix=$(PREFIX) \
		PYTHON=python2
	$(MAKE) -C build

prepare: xcb-proto-1.8.tar.bz2
	tar xjf xcb-proto-1.8.tar.bz2
	mkdir -p build
	touch prepare

xcb-proto-1.8.tar.bz2:
	wget http://xcb.freedesktop.org/dist/xcb-proto-1.8.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xcb-proto-1.8.tar.bz2
	rm -rf xcb-proto-1.8

