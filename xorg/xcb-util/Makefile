PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xcb-util-0.3.9/configure --prefix=$(PREFIX) \
		--disable-static
	$(MAKE) -C build

prepare: xcb-util-0.3.9.tar.bz2
	tar xjf xcb-util-0.3.9.tar.bz2
	mkdir -p build
	touch prepare

xcb-util-0.3.9.tar.bz2:
	wget http://xcb.freedesktop.org/dist/xcb-util-0.3.9.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xcb-util-0.3.9.tar.bz2
	rm -rf xcb-util-0.3.9

