PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../libXau-1.0.7/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR)
	$(MAKE) -C build

prepare: libXau-1.0.7.tar.bz2
	tar xjf libXau-1.0.7.tar.bz2
	mkdir -p build
	touch prepare

libXau-1.0.7.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libXau-1.0.7.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libXau-1.0.7.tar.bz2
	rm -rf libXau-1.0.7
