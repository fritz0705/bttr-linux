.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../make-3.82/configure --prefix=$(PREFIX)
	@touch configure

prepare: make-3.82.tar.gz
	tar xzf make-3.82.tar.gz
	@mkdir build
	@touch prepare

make-3.82.tar.gz:
	wget ftp://ftp.gnu.org/gnu/make/make-3.82.tar.gz

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	-rm prepare
	-rm configure
	-rm make-3.82.tar.gz
	-rm -r build/
	-rm -r make-3.82/

