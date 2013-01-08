.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../setxkbmap-1.3.0/configure --prefix=$(PREFIX)
	@touch configure

prepare: setxkbmap-1.3.0.tar.bz2
	tar xjf setxkbmap-1.3.0.tar.bz2
	@mkdir build
	@touch prepare

setxkbmap-1.3.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/app/setxkbmap-1.3.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) setxkbmap-1.3.0.tar.bz2
	$(RM) -r build/
	$(RM) -r setxkbmap-1.3.0/

