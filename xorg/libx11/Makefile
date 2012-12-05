PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libX11-1.5.0/configure --prefix=$(PREFIX) \
		--disable-static --disable-xf86bigfont
	$(MAKE) -C build

prepare: libX11-1.5.0.tar.bz2
	tar xjf libX11-1.5.0.tar.bz2
	mkdir -p build
	touch prepare

libX11-1.5.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libX11-1.5.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libX11-1.5.0.tar.bz2
	rm -rf libX11-1.5.0

