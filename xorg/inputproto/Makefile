.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../inputproto-2.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: inputproto-2.2.tar.bz2
	tar xjf inputproto-2.2.tar.bz2
	@mkdir build
	@touch prepare

inputproto-2.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/inputproto-2.2.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) inputproto-2.2.tar.bz2
	$(RM) -r build/
	$(RM) -r inputproto-2.2/

