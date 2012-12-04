PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../groff-1.21/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: groff-1.21.tar.gz
	tar xzf groff-1.21.tar.gz
	mkdir -p build
	touch prepare

groff-1.21.tar.gz:
	wget ftp://ftp.gnu.org/gnu/groff/groff-1.21.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f groff-1.21.tar.gz
	rm -rf groff-1.21

