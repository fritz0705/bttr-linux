PREFIX=/usr
DESTDIR=

all: prepare
	cd acl-2.2.51/ && ./configure --prefix=$(PREFIX)
	$(MAKE) -C acl-2.2.51/ 

prepare: acl-2.2.51.src.tar.gz
	tar xzf acl-2.2.51.src.tar.gz
	touch prepare

acl-2.2.51.src.tar.gz:
	wget http://mirror3.layerjet.com/nongnu/acl/acl-2.2.51.src.tar.gz

install: all
	$(MAKE) -C acl-2.2.51/ install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f acl-2.2.51.src.tar.gz
	rm -rf acl-2.2.51

