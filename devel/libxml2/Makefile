.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libxml2-2.9.0/configure --prefix=$(PREFIX) \
		--with-threads --with-history
	@touch configure

prepare: libxml2-2.9.0.tar.gz
	tar xzf libxml2-2.9.0.tar.gz
	@mkdir build
	@touch prepare

libxml2-2.9.0.tar.gz:
	wget ftp://xmlsoft.org/libxml2/libxml2-2.9.0.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libxml2-2.9.0.tar.gz
	$(RM) -r build/
	$(RM) -r libxml2-2.9.0/

