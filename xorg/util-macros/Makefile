.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../util-macros-1.17/configure --prefix=$(PREFIX)
	@touch configure

prepare: util-macros-1.17.tar.bz2
	tar xjf util-macros-1.17.tar.bz2
	@mkdir build
	@touch prepare

util-macros-1.17.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/util/util-macros-1.17.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) util-macros-1.17.tar.bz2
	$(RM) -r build/
	$(RM) -r util-macros-1.17/

