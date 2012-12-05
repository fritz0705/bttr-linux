PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xtrans-1.2.7/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xtrans-1.2.7.tar.bz2
	tar xjf xtrans-1.2.7.tar.bz2
	mkdir -p build
	touch prepare

xtrans-1.2.7.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.2.7.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xtrans-1.2.7.tar.bz2
	rm -rf xtrans-1.2.7

