PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../encodings-1.0.4/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: encodings-1.0.4.tar.bz2
	tar xjf encodings-1.0.4.tar.bz2
	mkdir -p build
	touch prepare

encodings-1.0.4.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/encodings-1.0.4.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f encodings-1.0.4.tar.bz2
	rm -rf encodings-1.0.4

