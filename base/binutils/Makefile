.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../binutils-2.23/configure --prefix=$(PREFIX)
	@touch configure

prepare: binutils-2.23.tar.gz
	tar xzf binutils-2.23.tar.gz
	@mkdir build
	@touch prepare

binutils-2.23.tar.gz:
	wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm binutils-2.23.tar.gz
	-rm -r build/
	-rm -r binutils-2.23/

