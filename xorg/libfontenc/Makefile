PREFIX=/usr
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
DESTDIR=

all: prepare
	cd build && ../libfontenc-1.1.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --localstatedir=$(LOCALSTATEDIR) \
		--disable-static --with-encodingsdir=$(PREFIX)/share/fonts/encodings
	$(MAKE) -C build

prepare: libfontenc-1.1.1.tar.bz2
	tar xjf libfontenc-1.1.1.tar.bz2
	mkdir -p build
	touch prepare

libfontenc-1.1.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libfontenc-1.1.1.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libfontenc-1.1.1.tar.bz2
	rm -rf libfontenc-1.1.1

