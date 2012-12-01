PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../expat-2.1.0/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: expat-2.1.0.tar.gz
	tar xzf expat-2.1.0.tar.gz
	mkdir -p build
	touch prepare

expat-2.1.0.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/expat/expat-2.1.0.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf expat-2.1.0
	rm -f expat-2.1.0.tar.gz

