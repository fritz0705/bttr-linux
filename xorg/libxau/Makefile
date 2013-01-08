.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libXau-1.0.7/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR)
	@touch configure

prepare: libXau-1.0.7.tar.bz2
	tar xjf libXau-1.0.7.tar.bz2
	@mkdir build
	@touch prepare

libXau-1.0.7.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libXau-1.0.7.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libXau-1.0.7.tar.bz2
	$(RM) -r build/
	$(RM) -r libXau-1.0.7/

