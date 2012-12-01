PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libgssglue-0.4/configure --prefix=$(PREFIX)
	$(MAKE) -C build

prepare: libgssglue-0.4.tar.gz
	tar xzf libgssglue-0.4.tar.gz
	mkdir -p build
	touch prepare

libgssglue-0.4.tar.gz:
	wget http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/libgssglue-0.4.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libgssglue-0.4.tar.gz
	rm -rf libgssglue-0.4/

