.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xproto-7.0.23/configure --prefix=$(PREFIX)
	@touch configure

prepare: xproto-7.0.23.tar.bz2
	tar xjf xproto-7.0.23.tar.bz2
	@mkdir build
	@touch prepare

xproto-7.0.23.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/xproto-7.0.23.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xproto-7.0.23.tar.bz2
	$(RM) -r build/
	$(RM) -r xproto-7.0.23/

