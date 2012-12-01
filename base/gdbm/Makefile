PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../gdbm-1.10/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: gdbm-1.10.tar.gz
	tar xzf gdbm-1.10.tar.gz
	mkdir -p build
	touch prepare

gdbm-1.10.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.10.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f gdbm-1.10.tar.gz
	rm -rf gdbm-1.10

