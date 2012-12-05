PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../fontsproto-2.1.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: fontsproto-2.1.2.tar.bz2
	tar xjf fontsproto-2.1.2.tar.bz2
	mkdir -p build
	touch prepare

fontsproto-2.1.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/fontsproto-2.1.2.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f fontsproto-2.1.2.tar.bz2
	rm -rf fontsproto-2.1.2

