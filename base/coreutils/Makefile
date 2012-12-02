PREFIX=/usr
DESTDIR=
BINDIR:=/bin

all: prepare
	cd build && ../coreutils-8.20/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	$(MAKE) -C build/ all

prepare: coreutils-8.20.tar.xz
	tar xJf coreutils-8.20.tar.xz
	mkdir -p build
	touch prepare

coreutils-8.20.tar.xz:
	wget ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.20.tar.xz

install: all
	$(MAKE) -C build/ DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f prepare
	rm -rf coreutils-8.20.tar.xz
	rm -rf coreutils-8.20
