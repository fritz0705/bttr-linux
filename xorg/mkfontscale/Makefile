.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../mkfontscale-1.1.0/configure --prefix=$(PREFIX)
	@touch configure

prepare: mkfontscale-1.1.0.tar.bz2
	tar xjf mkfontscale-1.1.0.tar.bz2
	@mkdir build
	@touch prepare

mkfontscale-1.1.0.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/mkfontscale-1.1.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) mkfontscale-1.1.0.tar.bz2/
	$(RM) -r build/
	$(RM) -r mkfontscale-1.1.0/

