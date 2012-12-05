PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xproto-7.0.23/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xproto-7.0.23.tar.bz2
	tar xjf xproto-7.0.23.tar.bz2
	mkdir -p build
	touch prepare

xproto-7.0.23.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/xproto-7.0.23.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xproto-7.0.23.tar.bz2
	rm -rf xproto-7.0.23

