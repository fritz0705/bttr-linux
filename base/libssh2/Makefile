.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libssh2-1.4.3/configure --prefix=$(PREFIX)
	@touch configure

prepare: libssh2-1.4.3.tar.gz
	tar xzf libssh2-1.4.3.tar.gz
	@mkdir build
	@touch prepare

libssh2-1.4.3.tar.gz:
	wget http://www.libssh2.org/download/libssh2-1.4.3.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libssh2-1.4.3.tar.gz
	$(RM) -r build/
	$(RM) -r libssh2-1.4.3/
