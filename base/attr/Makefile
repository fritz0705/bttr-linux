.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C attr-2.4.46

configure: prepare
	cd attr-2.4.46 && ./configure --prefix=$(PREFIX)
	@touch configure

prepare: attr-2.4.46.src.tar.gz
	tar xzf attr-2.4.46.src.tar.gz
	@touch prepare

attr-2.4.46.src.tar.gz:
	wget http://mirror3.layerjet.com/nongnu//attr/attr-2.4.46.src.tar.gz

install: build
	$(MAKE) -C attr-2.4.46 install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) attr-2.4.46.src.tar.gz
	$(RM) -r attr-2.4.46/

