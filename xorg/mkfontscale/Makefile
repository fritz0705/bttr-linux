PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../mkfontscale-1.1.0/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: mkfontscale-1.1.0.tar.bz2
	tar xjf mkfontscale-1.1.0.tar.bz2
	mkdir -p build
	touch prepare

mkfontscale-1.1.0.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/mkfontscale-1.1.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f mkfontscale-1.1.0.tar.bz2
	rm -rf mkfontscale-1.1.0

