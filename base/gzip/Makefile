.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gzip-1.5/configure --prefix=$(PREFIX)
	@touch configure

prepare: gzip-1.5.tar.gz
	tar xzf gzip-1.5.tar.gz
	@mkdir build
	@touch prepare

gzip-1.5.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gzip/gzip-1.5.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm gzip-1.5.tar.gz
	-rm -r build/
	-rm -r gzip-1.5/

