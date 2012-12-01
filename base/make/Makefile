PREFIX=/usr
DESTDIR=

build all: prepare
	cd build && ../make-3.82/configure --prefix=$(PREFIX)
	$(MAKE) -C build all

prepare: make-3.82.tar.gz
	tar xzf make-3.82.tar.gz
	mkdir -p build
	touch prepare

make-3.82.tar.gz:
	wget ftp://ftp.gnu.org/gnu/make/make-3.82.tar.gz

install: all
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	rm -rf build/
	rm -f make-3.82.tar.gz
	rm -rf make-3.82/
	rm -f prepare

