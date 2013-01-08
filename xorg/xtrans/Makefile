.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xtrans-1.2.7/configure --prefix=$(PREFIX)
	@touch configure

prepare: xtrans-1.2.7.tar.bz2
	tar xjf xtrans-1.2.7.tar.bz2
	@mkdir build
	@touch prepare

xtrans-1.2.7.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/xtrans-1.2.7.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xtrans-1.2.7.tar.bz2
	$(RM) -r build/
	$(RM) -r xtrans-1.2.7/

