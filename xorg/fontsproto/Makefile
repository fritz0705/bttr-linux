.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../fontsproto-2.1.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: fontsproto-2.1.2.tar.bz2
	tar xjf fontsproto-2.1.2.tar.bz2
	@mkdir build
	@touch prepare

fontsproto-2.1.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/fontsproto-2.1.2.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) fontsproto-2.1.2.tar.bz2
	$(RM) -r build/
	$(RM) -r fontsproto-2.1.2/

