PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../util-macros-1.17/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: util-macros-1.17.tar.bz2
	tar xjf util-macros-1.17.tar.bz2
	mkdir -p build
	touch prepare

util-macros-1.17.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/util/util-macros-1.17.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f util-macros-1.17.tar.bz2
	rm -rf util-macros-1.17

