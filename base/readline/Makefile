.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build all

configure: prepare
	cd build && ../readline-6.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: readline-6.2.tar.gz
	tar xaf readline-6.2.tar.gz
	@mkdir build
	@touch prepare

readline-6.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz

install: build
	$(MAKE) -C build DESTDIR=$(DESTDIR) install

clean:
	-rm prepare
	-rm configure
	-rm readline-6.2.tar.gz
	-rm -r build/
	-rm -r readline-6.2/
