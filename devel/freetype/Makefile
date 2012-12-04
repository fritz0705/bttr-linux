PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../freetype-2.4.10/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: freetype-2.4.10.tar.bz2
	tar xjf freetype-2.4.10.tar.bz2
	mkdir -p build
	touch prepare

freetype-2.4.10.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/freetype/freetype-2.4.10.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f freetype-2.4.10.tar.bz2
	rm -rf freetype-2.4.10

