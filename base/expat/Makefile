.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../expat-2.1.0/configure --prefix=$(PREFIX)
	@touch configure

prepare: expat-2.1.0.tar.gz
	tar xzf expat-2.1.0.tar.gz
	@mkdir build
	@touch prepare

expat-2.1.0.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/expat/expat-2.1.0.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm expat-2.1.0.tar.gz
	-rm -r build/
	-rm -r expat-2.1.0/

