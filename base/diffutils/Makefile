PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../diffutils-3.2/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: diffutils-3.2.tar.gz
	tar xzf diffutils-3.2.tar.gz
	sed -i -e '/gets is a/d' diffutils-3.2/lib/stdio.in.h
	mkdir -p build
	touch prepare

diffutils-3.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/diffutils/diffutils-3.2.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f diffutils-3.2.tar.gz
	rm -rf diffutils-3.2

