PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libxml2-2.9.0/configure --prefix=$(PREFIX) \
		--with-threads --with-history
	$(MAKE) -C build

prepare: libxml2-2.9.0.tar.gz
	tar xzf libxml2-2.9.0.tar.gz
	mkdir -p build
	touch prepare

libxml2-2.9.0.tar.gz:
	wget ftp://xmlsoft.org/libxml2/libxml2-2.9.0.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libxml2-2.9.0.tar.gz
	rm -rf libxml2-2.9.0

