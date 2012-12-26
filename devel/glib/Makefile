.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../glib-2.34.3/configure --prefix=$(PREFIX) --libdir=$(LIBDIR) \
		--sysconfdir=$(SYSCONFDIR) --with-pcre=system --disable-fam \
		PYTHON=python2
	@touch configure

prepare: glib-2.34.3.tar.xz
	tar xJf glib-2.34.3.tar.xz
	@mkdir build
	@touch prepare

glib-2.34.3.tar.xz:
	wget http://ftp.gnome.org/pub/GNOME/sources/glib/2.34/glib-2.34.3.tar.xz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) glib-2.34.3.tar.xz
	$(RM) -r build/
	$(RM) -r glib-2.34.3/

