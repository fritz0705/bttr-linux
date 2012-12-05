PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../libxkbfile-1.0.8/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	$(MAKE) -C build

prepare: libxkbfile-1.0.8.tar.bz2
	tar xjf libxkbfile-1.0.8.tar.bz2
	mkdir -p build
	touch prepare

libxkbfile-1.0.8.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.0.8.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libxkbfile-1.0.8.tar.bz2
	rm -rf libxkbfile-1.0.8

