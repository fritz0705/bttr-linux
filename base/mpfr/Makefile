.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../mpfr-3.1.1/configure --prefix=$(PREFIX) \
		--enable-thread-safe \
		--enable-shared
	@touch configure

prepare: mpfr-3.1.1.tar.gz
	tar xzf mpfr-3.1.1.tar.gz
	@mkdir build
	@touch prepare

mpfr-3.1.1.tar.gz:
	wget http://www.mpfr.org/mpfr-current/mpfr-3.1.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm mpfr-3.1.1.tar.gz
	-rm -r build/
	-rm -r mpfr-3.1.1/

