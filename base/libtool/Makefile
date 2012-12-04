PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libtool-2.4.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libtool-2.4.2.tar.gz
	tar xzf libtool-2.4.2.tar.gz
	mkdir -p build
	touch prepare

libtool-2.4.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libtool-2.4.2.tar.gz
	rm -rf libtool-2.4.2
