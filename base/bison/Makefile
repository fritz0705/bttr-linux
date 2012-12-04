PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../bison-2.6.5/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: bison-2.6.5.tar.gz
	tar xzf bison-2.6.5.tar.gz
	mkdir -p build
	touch prepare

bison-2.6.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/bison/bison-2.6.5.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f bison-2.6.5.tar.gz
	rm -rf bison-2.6.5

