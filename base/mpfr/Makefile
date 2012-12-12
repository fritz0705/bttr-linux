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
	$(RM) prepare
	$(RM) configure
	$(RM) mpfr-3.1.1.tar.gz
	$(RM) -r build/
	$(RM) -r mpfr-3.1.1/

