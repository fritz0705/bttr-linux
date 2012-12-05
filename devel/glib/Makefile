PREFIX=/usr
LIBDIR=$(PREFIX)/lib
SYSCONFDIR=/etc
DESTDIR=

all: prepare
	cd build && ../glib-2.34.3/configure --prefix=$(PREFIX) --libdir=$(LIBDIR) \
		--sysconfdir=$(SYSCONFDIR) --with-pcre=system --disable-fam \
		PYTHON=python2
	$(MAKE) -C build

prepare: glib-2.34.3.tar.xz
	tar xJf glib-2.34.3.tar.xz
	mkdir -p build
	touch prepare

glib-2.34.3.tar.xz:
	wget http://ftp.gnome.org/pub/GNOME/sources/glib/2.34/glib-2.34.3.tar.xz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f glib-2.34.3.tar.xz
	rm -rf glib-2.34.3

