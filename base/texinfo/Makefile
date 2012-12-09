.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../texinfo-4.9/configure --prefix=$(PREFIX)
	@touch configure

prepare: texinfo-4.9.tar.gz
	tar xzf texinfo-4.9.tar.gz
	@mkdir build
	@touch prepare

texinfo-4.9.tar.gz:
	wget ftp://ftp.gnu.org/gnu/texinfo/texinfo-4.9.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm texinfo-4.9.tar.gz
	-rm -r build/
	-rm -r texinfo-4.9/

