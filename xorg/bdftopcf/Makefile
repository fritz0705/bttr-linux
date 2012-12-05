PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../bdftopcf-1.0.3/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: bdftopcf-1.0.3.tar.bz2
	tar xjf bdftopcf-1.0.3.tar.bz2
	mkdir -p build
	touch prepare

bdftopcf-1.0.3.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/bdftopcf-1.0.3.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f bdftopcf-1.0.3.tar.bz2
	rm -rf bdftopcf-1.0.3

