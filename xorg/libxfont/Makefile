.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libXfont-1.4.5/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	@touch configure

prepare: libXfont-1.4.5.tar.bz2
	tar xjf libXfont-1.4.5.tar.bz2
	@mkdir build
	@touch prepare

libXfont-1.4.5.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/lib/libXfont-1.4.5.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libXfont-1.4.5.tar.bz2
	$(RM) -r build/
	$(RM) -r libXfont-1.4.5/

