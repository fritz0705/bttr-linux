.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gmp-5.0.5/configure --prefix=$(PREFIX) \
		--enable-cxx
	@touch configure

prepare: gmp-5.0.5.tar.bz2
	tar xjf gmp-5.0.5.tar.bz2
	@mkdir build
	@touch prepare

gmp-5.0.5.tar.bz2:
	wget ftp://ftp.gmplib.org/pub/gmp-5.0.5/gmp-5.0.5.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) gmp-5.0.5.tar.bz2
	$(RM) -r build/
	$(RM) -r gmp-5.0.5/

