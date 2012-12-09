.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C libtirpc-0.2.2

configure: prepare
	cd libtirpc-0.2.2 && ./configure --prefix=$(PREFIX) \
		--enable-gss
	@touch configure

prepare: libtirpc-0.2.2.tar.bz2
	tar xjf libtirpc-0.2.2.tar.bz2
	@mkdir build
	@touch prepare

libtirpc-0.2.2.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-0.2.2.tar.bz2

install: build
	$(MAKE) -C libtirpc-0.2.2 install DESTDIR=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm libtirpc-0.2.2.tar.bz2
	-rm -r build/
	-rm -r libtirpc-0.2.2/

