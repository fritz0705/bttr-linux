.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure

configure: prepare
	@touch configure

prepare: man-pages-3.44.tar.gz
	tar xzf man-pages-3.44.tar.gz
	@mkdir build
	@touch prepare

man-pages-3.44.tar.gz:
	wget http://www.kernel.org/pub/linux/docs/man-pages/man-pages-3.44.tar.gz

install: build
	$(MAKE) -C man-pages-3.44 install prefix=$(PREFIX) DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) man-pages-3.44.tar.gz
	$(RM) -r build/
	$(RM) -r man-pages-3.44/

