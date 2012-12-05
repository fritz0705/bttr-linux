PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xextproto-7.2.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xextproto-7.2.1.tar.bz2
	tar xjf xextproto-7.2.1.tar.bz2
	mkdir -p build
	touch prepare

xextproto-7.2.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/xextproto-7.2.1.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xextproto-7.2.1.tar.bz2
	rm -rf xextproto-7.2.1

