.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../binutils-2.23/configure --prefix=$(PREFIX)
	@touch configure

prepare: binutils-2.23.tar.gz
	tar xzf binutils-2.23.tar.gz
	@mkdir build
	@touch prepare

binutils-2.23.tar.gz:
	wget ftp://ftp.gnu.org/gnu/binutils/binutils-2.23.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) binutils-2.23.tar.gz
	$(RM) -r build/
	$(RM) -r binutils-2.23/

