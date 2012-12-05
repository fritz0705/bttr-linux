PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../setxkbmap-1.3.0/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: setxkbmap-1.3.0.tar.bz2
	tar xjf setxkbmap-1.3.0.tar.bz2
	mkdir -p build
	touch prepare

setxkbmap-1.3.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/app/setxkbmap-1.3.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f setxkbmap-1.3.0.tar.bz2
	rm -rf setxkbmap-1.3.0

