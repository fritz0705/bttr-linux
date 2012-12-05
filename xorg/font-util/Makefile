PREFIX=/usr
MANDIR=$(PREFIX)/share/man
DESTDIR=

all: prepare
	cd build && ../font-util-1.3.0/configure --prefix=$(PREFIX) \
		--mandir=$(MANDIR) \
		--with-mapdir=$(PREFIX)/share/fonts/util \
		--with-fontrootdir=$(PREFIX)/share/fonts
	$(MAKE) -C build

prepare: font-util-1.3.0.tar.bz2
	tar xjf font-util-1.3.0.tar.bz2
	mkdir -p build
	touch prepare

font-util-1.3.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/font-util-1.3.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f font-util-1.3.0.tar.bz2
	rm -rf font-util-1.3.0

