.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libgcrypt-1.5.0/configure --prefix=$(PREFIX) \
		--disable-static --disable-padlock-support
	@touch configure

prepare: libgcrypt-1.5.0.tar.bz2
	tar xjf libgcrypt-1.5.0.tar.bz2
	@mkdir build
	@touch prepare

libgcrypt-1.5.0.tar.bz2:
	wget ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.5.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libgcrypt-1.5.0.tar.bz2
	$(RM) -r build/
	$(RM) -r libgcrypt-1.5.0/

