.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../tar-1.26/configure --prefix=$(PREFIX)
	touch configure

prepare: tar-1.26.tar.gz
	tar xzf tar-1.26.tar.gz
	sed -i -e '/gets is a/d' tar-1.26/gnu/stdio.in.h
	mkdir -p build
	touch prepare

tar-1.26.tar.gz:
	wget ftp://ftp.gnu.org/gnu/tar/tar-1.26.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) -r build/
	$(RM) -r tar-1.26/
	$(RM) prepare configure
	$(RM) tar-1.26.tar.gz

