PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libidn-1.25/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libidn-1.25.tar.gz
	tar xzf libidn-1.25.tar.gz
	mkdir -p build
	touch prepare

libidn-1.25.tar.gz:
	wget ftp://ftp.gnu.org/gnu/libidn/libidn-1.25.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf libidn-1.25
	rm -f libidn-1.25.tar.gz

