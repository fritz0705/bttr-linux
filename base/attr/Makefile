PREFIX=/usr
DESTDIR=

all: prepare
	cd attr-2.4.46 && ./configure --prefix=$(PREFIX)
	$(MAKE) -C attr-2.4.46

prepare: attr-2.4.46.src.tar.gz
	tar xzf attr-2.4.46.src.tar.gz
	touch prepare

attr-2.4.46.src.tar.gz:
	wget http://mirror3.layerjet.com/nongnu//attr/attr-2.4.46.src.tar.gz

install: all
	$(MAKE) -C attr-2.4.46 install install-lib install-dev DIST_ROOT=$(DESTDIR)

clean:
	rm -f prepare
	rm -f attr-2.4.46.src.tar.gz
	rm -rf attr-2.4.46/

