PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libxslt-1.1.28/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libxslt-1.1.28.tar.gz
	tar xzf libxslt-1.1.28.tar.gz
	mkdir -p build
	touch prepare

libxslt-1.1.28.tar.gz:
	wget ftp://xmlsoft.org/libxml2/libxslt-1.1.28.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libxslt-1.1.28.tar.gz
	rm -rf libxslt-1.1.28

