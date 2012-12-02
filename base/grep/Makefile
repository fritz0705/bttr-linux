PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../grep-2.14/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: grep-2.14.tar.xz
	tar xJf grep-2.14.tar.xz
	mkdir -p build
	touch prepare

grep-2.14.tar.xz:
	wget ftp://ftp.gnu.org/gnu/grep/grep-2.14.tar.xz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f grep-2.14.tar.xz
	rm -rf grep-2.14

