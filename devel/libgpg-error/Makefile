PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libgpg-error-1.10/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libgpg-error-1.10.tar.bz2
	tar xjf libgpg-error-1.10.tar.bz2
	mkdir -p build
	touch prepare

libgpg-error-1.10.tar.bz2:
	wget ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.10.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libgpg-error-1.10.tar.bz2
	rm -rf libgpg-error-1.10

