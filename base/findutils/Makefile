.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../findutils-4.2.33/configure --prefix=$(PREFIX)
	@touch configure

prepare: findutils-4.2.33.tar.gz
	tar xzf findutils-4.2.33.tar.gz
	@mkdir build
	@touch prepare

findutils-4.2.33.tar.gz:
	wget ftp://ftp.gnu.org/gnu/findutils/findutils-4.2.33.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm findutils-4.2.33.tar.gz
	-rm -r build/
	-rm -r findutils-4.2.33/

