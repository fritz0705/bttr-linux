.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../bdftopcf-1.0.3/configure --prefix=$(PREFIX)
	@touch configure

prepare: bdftopcf-1.0.3.tar.bz2
	tar xjf bdftopcf-1.0.3.tar.bz2
	@mkdir build
	@touch prepare

bdftopcf-1.0.3.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/app/bdftopcf-1.0.3.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) bdftopcf-1.0.3.tar.bz2
	$(RM) -r build/
	$(RM) -r bdftopcf-1.0.3/

