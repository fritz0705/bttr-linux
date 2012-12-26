.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libffi-3.0.11/configure --prefix=$(PREFIX)
	@touch configure

prepare: libffi-3.0.11.tar.gz
	tar xzf libffi-3.0.11.tar.gz
	@mkdir build
	@touch prepare

libffi-3.0.11.tar.gz:
	wget ftp://sourceware.org/pub/libffi/libffi-3.0.11.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libffi-3.0.11.tar.gz
	$(RM) -r build/
	$(RM) -r libffi-3.0.11/

