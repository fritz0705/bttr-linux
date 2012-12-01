PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libssh2-1.4.3/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libssh2-1.4.3.tar.gz
	tar xzf libssh2-1.4.3.tar.gz
	mkdir -p build
	touch prepare

libssh2-1.4.3.tar.gz:
	wget http://www.libssh2.org/download/libssh2-1.4.3.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf libssh2-1.4.3
	rm -f libssh2-1.4.3.tar.gz

