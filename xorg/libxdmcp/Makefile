PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../libXdmcp-1.1.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	$(MAKE) -C build

prepare: libXdmcp-1.1.1.tar.bz2
	tar xjf libXdmcp-1.1.1.tar.bz2
	mkdir -p build
	touch prepare

libXdmcp-1.1.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libXdmcp-1.1.1.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libXdmcp-1.1.1.tar.bz2
	rm -rf libXdmcp-1.1.1

