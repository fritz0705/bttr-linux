PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gzip-1.5/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: gzip-1.5.tar.gz
	tar xzf gzip-1.5.tar.gz
	mkdir -p build
	touch prepare

gzip-1.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gzip/gzip-1.5.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gzip-1.5.tar.gz
	rm -rf gzip-1.5

