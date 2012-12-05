PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../libXfont-1.4.5/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	$(MAKE) -C build

prepare: libXfont-1.4.5.tar.bz2
	tar xjf libXfont-1.4.5.tar.bz2
	mkdir -p build
	touch prepare

libXfont-1.4.5.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/lib/libXfont-1.4.5.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libXfont-1.4.5.tar.bz2
	rm -rf libXfont-1.4.5

