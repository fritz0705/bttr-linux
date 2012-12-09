.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../flex-2.5.37/configure --prefix=$(PREFIX)
	@touch configure

prepare: flex-2.5.37.tar.gz
	tar xzf flex-2.5.37.tar.gz
	@mkdir build
	@touch prepare

flex-2.5.37.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/flex/flex-2.5.37.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm flex-2.5.37.tar.gz
	-rm -r build/
	-rm -r flex-2.5.37/

