PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../libpciaccess-0.13.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR)
	$(MAKE) -C build

prepare: libpciaccess-0.13.1.tar.bz2
	tar xjf libpciaccess-0.13.1.tar.bz2
	mkdir -p build
	touch prepare

libpciaccess-0.13.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libpciaccess-0.13.1.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libpciaccess-0.13.1.tar.bz2
	rm -rf libpciaccess-0.13.1

