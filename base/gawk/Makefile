PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gawk-4.0.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: gawk-4.0.1.tar.gz
	tar xzf gawk-4.0.1.tar.gz
	mkdir -p build
	touch prepare

gawk-4.0.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gawk/gawk-4.0.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gawk-4.0.1.tar.gz
	rm -rf gawk-4.0.1

