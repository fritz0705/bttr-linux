.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../pixman-0.28.0/configure --prefix=$(PREFIX) --disable-static
	@touch configure

prepare: pixman-0.28.0.tar.bz2
	tar xjf pixman-0.28.0.tar.bz2
	@mkdir build
	@touch prepare

pixman-0.28.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/pixman-0.28.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) pixman-0.28.0.tar.bz2
	$(RM) -r build/
	$(RM) -r pixman-0.28.0/

