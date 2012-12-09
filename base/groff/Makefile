.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../groff-1.21/configure --prefix=$(PREFIX)
	@touch configure

prepare: groff-1.21.tar.gz
	tar xzf groff-1.21.tar.gz
	@mkdir build
	@touch prepare

groff-1.21.tar.gz:
	wget ftp://ftp.gnu.org/gnu/groff/groff-1.21.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm groff-1.21.tar.gz
	-rm -r build/
	-rm -r groff-1.21/

