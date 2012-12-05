PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../font-alias-1.0.2/configure --prefix=$(PREFIX) --with-fontrootdir=$(PREFIX)/share/fonts
	$(MAKE) -C build

prepare: font-alias-1.0.2.tar.bz2
	tar xjf font-alias-1.0.2.tar.bz2
	mkdir -p build
	touch prepare

font-alias-1.0.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/font-alias-1.0.2.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f font-alias-1.0.2.tar.bz2
	rm -rf font-alias-1.0.2

