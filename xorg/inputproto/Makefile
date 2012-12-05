PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../inputproto-2.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: inputproto-2.2.tar.bz2
	tar xjf inputproto-2.2.tar.bz2
	mkdir -p build
	touch prepare

inputproto-2.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/inputproto-2.2.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f inputproto-2.2.tar.bz2
	rm -rf inputproto-2.2

