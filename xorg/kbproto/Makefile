PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../kbproto-1.0.6/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: kbproto-1.0.6.tar.bz2
	tar xjf kbproto-1.0.6.tar.bz2
	mkdir -p build
	touch prepare

kbproto-1.0.6.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/kbproto-1.0.6.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f kbproto-1.0.6.tar.bz2
	rm -rf kbproto-1.0.6

