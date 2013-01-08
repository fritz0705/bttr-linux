.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libX11-1.5.0/configure --prefix=$(PREFIX) \
		--disable-static --disable-xf86bigfont
	@touch configure

prepare: libX11-1.5.0.tar.bz2
	tar xjf libX11-1.5.0.tar.bz2
	@mkdir build
	@touch prepare

libX11-1.5.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libX11-1.5.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libX11-1.5.0.tar.bz2
	$(RM) -r build/
	$(RM) -r libX11-1.5.0/

