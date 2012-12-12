.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libgssglue-0.4/configure --prefix=$(PREFIX)
	@touch configure

prepare: libgssglue-0.4.tar.gz
	tar xzf libgssglue-0.4.tar.gz
	@mkdir build
	@touch prepare

libgssglue-0.4.tar.gz:
	wget http://www.citi.umich.edu/projects/nfsv4/linux/libgssglue/libgssglue-0.4.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libgssglue-0.4.tar.gz
	$(RM) -r build/
	$(RM) -r libgssglue-0.4/

