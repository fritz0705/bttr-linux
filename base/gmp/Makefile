PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gmp-5.0.5/configure --prefix=$(PREFIX) \
		--enable-cxx
	$(MAKE) -C build

prepare: gmp-5.0.5.tar.bz2
	tar xjf gmp-5.0.5.tar.bz2
	mkdir -p build
	touch prepare

gmp-5.0.5.tar.bz2:
	wget ftp://ftp.gmplib.org/pub/gmp-5.0.5/gmp-5.0.5.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gmp-5.0.5.tar.bz2
	rm -rf gmp-5.0.5

