.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure

configure: prepare
	@touch configure

prepare:
	tar xzf man-pages-3.44.tar.gz
	@mkdir build
	@touch prepare

man-pages-3.44.tar.gz:
	wget http://www.kernel.org/pub/linux/docs/man-pages/man-pages-3.44.tar.gz

install: build
	$(MAKE) -C man-pages-3.44 install prefix=$(PREFIX) DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm man-pages-3.44.tar.gz
	-rm -r build/
	-rm -r man-pages-3.44/

