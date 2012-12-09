.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../patch-2.7.1/configure --prefix=$(PREFIX)
	@touch configure

prepare: patch-2.7.1.tar.gz
	tar xzf patch-2.7.1.tar.gz
	@mkdir build
	@touch prepare

patch-2.7.1.tar.gz:
	wget ftp://ftp.gnu.org/gnu/patch/patch-2.7.1.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm patch-2.7.1.tar.gz
	-rm -r build/
	-rm -r patch-2.7.1/

