.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../mkfontdir-1.0.7/configure --prefix=$(PREFIX)
	@touch configure

prepare: mkfontdir-1.0.7.tar.bz2
	tar xjf mkfontdir-1.0.7.tar.bz2
	@mkdir build
	@touch prepare

mkfontdir-1.0.7.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/mkfontdir-1.0.7.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) mkfontdir-1.0.7.tar.bz2
	$(RM) -r build/
	$(RM) -r mkfontdir-1.0.7/

