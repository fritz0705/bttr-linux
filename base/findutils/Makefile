PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../findutils-4.2.33/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: findutils-4.2.33.tar.gz
	tar xzf findutils-4.2.33.tar.gz
	mkdir -p build
	touch prepare

findutils-4.2.33.tar.gz:
	wget ftp://ftp.gnu.org/gnu/findutils/findutils-4.2.33.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f findutils-4.2.33.tar.gz
	rm -rf findutils-4.2.33

