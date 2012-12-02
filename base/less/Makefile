PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../less-451/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: less-451.tar.gz
	tar xzf less-451.tar.gz
	mkdir -p build
	touch prepare

less-451.tar.gz:
	wget ftp://ftp.gnu.org/gnu/less/less-451.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f less-451.tar.gz
	rm -rf less-451

