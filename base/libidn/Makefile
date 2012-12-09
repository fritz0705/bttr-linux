.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libidn-1.25/configure --prefix=$(PREFIX)
	@touch configure

prepare: libidn-1.25.tar.gz
	tar xzf libidn-1.25.tar.gz
	@mkdir build
	@touch prepare

libidn-1.25.tar.gz:
	wget ftp://ftp.gnu.org/gnu/libidn/libidn-1.25.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm libidn-1.25.tar.gz
	-rm -r build/
	-rm -r libidn-1.25/

