.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../kbproto-1.0.6/configure --prefix=$(PREFIX)
	@touch configure

prepare: kbproto-1.0.6.tar.bz2
	tar xjf kbproto-1.0.6.tar.bz2
	@mkdir build
	@touch prepare

kbproto-1.0.6.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/proto/kbproto-1.0.6.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) kbproto-1.0.6.tar.bz2
	$(RM) -r build/
	$(RM) -r kbproto-1.0.6/

