.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../diffutils-3.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: diffutils-3.2.tar.gz
	tar xzf diffutils-3.2.tar.gz
	sed -i -e '/gets is a/d' diffutils-3.2/lib/stdio.in.h
	@mkdir build
	@touch prepare

diffutils-3.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/diffutils/diffutils-3.2.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm diffutils-3.2.tar.gz
	-rm -r build/
	-rm -r diffutils-3.2/

