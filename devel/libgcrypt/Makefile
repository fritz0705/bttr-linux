PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libgcrypt-1.5.0/configure --prefix=$(PREFIX) \
		--disable-static --disable-padlock-support
	$(MAKE) -C build

prepare: libgcrypt-1.5.0.tar.bz2
	tar xjf libgcrypt-1.5.0.tar.bz2
	mkdir -p build
	touch prepare

libgcrypt-1.5.0.tar.bz2:
	wget ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.5.0.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libgcrypt-1.5.0.tar.bz2
	rm -rf libgcrypt-1.5.0

