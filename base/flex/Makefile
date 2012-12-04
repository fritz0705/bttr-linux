PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../flex-2.5.37/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: flex-2.5.37.tar.gz
	tar xzf flex-2.5.37.tar.gz
	mkdir -p build
	touch prepare

flex-2.5.37.tar.gz:
	wget http://downloads.sourceforge.net/sourceforge/flex/flex-2.5.37.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf flex-2.5.37
	rm -f flex-2.5.37.tar.gz

