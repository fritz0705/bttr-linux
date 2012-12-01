PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../autoconf-2.69/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: autoconf-2.69.tar.gz
	tar xzf autoconf-2.69.tar.gz
	mkdir -p build
	touch prepare

autoconf-2.69.tar.gz:
	wget ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf autoconf-2.69
	rm -f autoconf-2.69.tar.gz

