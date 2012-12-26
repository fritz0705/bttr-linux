.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libgpg-error-1.10/configure --prefix=$(PREFIX)
	@touch configure

prepare: libgpg-error-1.10.tar.bz2
	tar xjf libgpg-error-1.10.tar.bz2
	@mkdir build
	@touch prepare

libgpg-error-1.10.tar.bz2:
	wget ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.10.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libgpg-error-1.10.tar.bz2
	$(RM) -r build/
	$(RM) -r libgpg-error-1.10/

