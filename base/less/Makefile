.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../less-451/configure --prefix=$(PREFIX)
	@touch configure

prepare: less-451.tar.gz
	tar xzf less-451.tar.gz
	@mkdir build
	@touch prepare

less-451.tar.gz:
	wget ftp://ftp.gnu.org/gnu/less/less-451.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm less-451.tar.gz
	-rm -r build/
	-rm -r less-451/

