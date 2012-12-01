PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../mpfr-3.1.1/configure --prefix=$(PREFIX) \
		--enable-thread-safe \
		--enable-shared
	$(MAKE) -C build

prepare: mpfr-3.1.1.tar.gz
	tar xzf mpfr-3.1.1.tar.gz
	mkdir -p build
	touch prepare

mpfr-3.1.1.tar.gz:
	wget http://www.mpfr.org/mpfr-current/mpfr-3.1.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f mpfr-3.1.1.tar.gz
	rm -rf mpfr-3.1.1

