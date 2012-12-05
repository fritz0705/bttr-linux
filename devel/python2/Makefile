PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../Python-2.7.3/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: Python-2.7.3.tar.bz2
	tar xjf Python-2.7.3.tar.bz2
	mkdir -p build
	touch prepare

Python-2.7.3.tar.bz2:
	wget http://python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f Python-2.7.3.tar.bz2
	rm -rf Python-2.7.3

