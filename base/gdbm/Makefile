.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../gdbm-1.10/configure --prefix=$(PREFIX)
	@touch configure

prepare: gdbm-1.10.tar.gz
	tar xzf gdbm-1.10.tar.gz
	@mkdir build
	@touch prepare

gdbm-1.10.tar.gz:
	wget ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.10.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm gdbm-1.10.tar.gz
	-rm -r build/
	-rm -r gdbm-1.10/

