PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../pixman-0.28.0/configure --prefix=$(PREFIX) --disable-static
	$(MAKE) -C build

prepare: pixman-0.28.0.tar.bz2
	tar xjf pixman-0.28.0.tar.bz2
	mkdir -p build
	touch prepare

pixman-0.28.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/pixman-0.28.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f pixman-0.28.0.tar.bz2
	rm -rf pixman-0.28.0

