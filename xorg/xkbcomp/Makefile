PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xkbcomp-1.2.4/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: xkbcomp-1.2.4.tar.bz2
	tar xjf xkbcomp-1.2.4.tar.bz2
	mkdir -p build
	touch prepare

xkbcomp-1.2.4.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/app/xkbcomp-1.2.4.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xkbcomp-1.2.4.tar.bz2
	rm -rf xkbcomp-1.2.4

