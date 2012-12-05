PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libffi-3.0.11/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libffi-3.0.11.tar.gz
	tar xzf libffi-3.0.11.tar.gz
	mkdir -p build
	touch prepare

libffi-3.0.11.tar.gz:
	wget ftp://sourceware.org/pub/libffi/libffi-3.0.11.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libffi-3.0.11.tar.gz
	rm -rf libffi-3.0.11

