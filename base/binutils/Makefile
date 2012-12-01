PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../binutils-2.23/configure --prefix=$(PREFIX)
	$(MAKE) -C build all

prepare: binutils-2.23.tar.gz
	tar xzf binutils-2.23.tar.gz
	mkdir build
	touch prepare

binutils-2.23.tar.gz:
	wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -rf binutils-2.23/
	rm -f prepare
	rm -f binutils-2.23.tar.gz

