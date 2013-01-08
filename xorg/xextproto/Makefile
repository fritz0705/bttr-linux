.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xextproto-7.2.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: xextproto-7.2.1.tar.bz2
	tar xjf xextproto-7.2.1.tar.bz2
	@mkdir build
	@touch prepare

xextproto-7.2.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/xextproto-7.2.1.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xextproto-7.2.1.tar.bz2
	$(RM) -r build/
	$(RM) -r xextproto-7.2.1/

