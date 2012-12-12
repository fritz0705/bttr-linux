.PHONY: all build install clean

PREFIX=/usr
DESTDIR=
BINDIR:=/bin

all: build

build: configure
	$(MAKE) -C build/ all

configure: prepare
	cd build && ../coreutils-8.20/configure --prefix=$(PREFIX) \
		--bindir=$(BINDIR)
	@touch configure

prepare: coreutils-8.20.tar.xz
	tar xJf coreutils-8.20.tar.xz
	@mkdir build
	@touch prepare

coreutils-8.20.tar.xz:
	wget ftp://ftp.gnu.org/gnu/coreutils/coreutils-8.20.tar.xz

install: build
	$(MAKE) -C build/ DESTDIR=$(DESTDIR) install
	ln -sf $(BINDIR)/env $(DESTDIR)/$(PREFIX)/bin/env

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) coreutils-8.20.tar.xz
	$(RM) -r build/
	$(RM) -r coreutils-8.20/

