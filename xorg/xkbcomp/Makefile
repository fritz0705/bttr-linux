.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xkbcomp-1.2.4/configure --prefix=$(PREFIX)
	@touch configure

prepare: xkbcomp-1.2.4.tar.bz2
	tar xjf xkbcomp-1.2.4.tar.bz2
	@mkdir build
	@touch prepare

xkbcomp-1.2.4.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/app/xkbcomp-1.2.4.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xkbcomp-1.2.4.tar.bz2
	$(RM) -r build/
	$(RM) -r xkbcomp-1.2.4/

