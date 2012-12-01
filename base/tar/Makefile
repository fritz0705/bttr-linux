PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../tar-1.26/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: tar-1.26.tar.gz
	tar xzf tar-1.26.tar.gz
	sed -i -e '/gets is a/d' tar-1.26/gnu/stdio.in.h
	mkdir -p build
	touch prepare

tar-1.26.tar.gz:
	wget ftp://ftp.gnu.org/gnu/tar/tar-1.26.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f tar-1.26.tar.gz
	rm -rf tar-1.26

