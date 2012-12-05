PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../mkfontdir-1.0.7/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: mkfontdir-1.0.7.tar.bz2
	tar xjf mkfontdir-1.0.7.tar.bz2
	mkdir -p build
	touch prepare

mkfontdir-1.0.7.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/mkfontdir-1.0.7.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f mkfontdir-1.0.7.tar.bz2
	rm -rf mkfontdir-1.0.7
