PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../patch-2.7.1/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: patch-2.7.1.tar.gz
	tar xzf patch-2.7.1.tar.gz
	mkdir -p build
	touch prepare

patch-2.7.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/patch/patch-2.7.1.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f patch-2.7.1.tar.gz
	rm -rf patch-2.7.1

