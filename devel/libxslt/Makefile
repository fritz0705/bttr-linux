.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libxslt-1.1.28/configure --prefix=$(PREFIX)
	@touch configure

prepare: libxslt-1.1.28.tar.gz
	tar xzf libxslt-1.1.28.tar.gz
	@mkdir build
	@touch prepare

libxslt-1.1.28.tar.gz:
	wget ftp://xmlsoft.org/libxml2/libxslt-1.1.28.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libxslt-1.1.28.tar.gz
	$(RM) -r build/
	$(RM) -r libxslt-1.1.28/

