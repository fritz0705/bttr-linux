.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C zlib-1.2.7

configure: prepare
	cd zlib-1.2.7 && ./configure --prefix=$(PREFIX)
	@touch configure

prepare: zlib-1.2.7.tar.gz
	tar xzf zlib-1.2.7.tar.gz
	@mkdir build
	@touch prepare

zlib-1.2.7.tar.gz:
	wget http://zlib.net/zlib-1.2.7.tar.gz

install: build
	$(MAKE) -C zlib-1.2.7 install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm zlib-1.2.7.tar.gz
	-rm -r build/
	-rm -r zlib-1.2.7/

