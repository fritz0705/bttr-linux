.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C acl-2.2.51/ 

configure: prepare
	cd acl-2.2.51/ && ./configure --prefix=$(PREFIX)
	@touch configure

prepare: acl-2.2.51.src.tar.gz
	tar xzf acl-2.2.51.src.tar.gz
	@mkdir build
	@touch prepare

acl-2.2.51.src.tar.gz:
	wget http://mirror3.layerjet.com/nongnu/acl/acl-2.2.51.src.tar.gz

install: build
	$(MAKE) -C acl-2.2.51/ install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	-rm prepare
	-rm configure
	-rm acl-2.2.51.src.tar.gz
	-rm -r build/
	-rm -r acl-2.2.51/

