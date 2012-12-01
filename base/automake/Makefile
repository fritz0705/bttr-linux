PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../automake-1.12.5/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: automake-1.12.5.tar.gz
	tar xzf automake-1.12.5.tar.gz
	mkdir -p build
	touch prepare

automake-1.12.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/automake/automake-1.12.5.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f automake-1.12.5.tar.gz
	rm -rf automake-1.12.5

