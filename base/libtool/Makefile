.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libtool-2.4.2/configure --prefix=$(PREFIX)
	@touch configure

prepare: libtool-2.4.2.tar.gz
	tar xzf libtool-2.4.2.tar.gz
	@mkdir build
	@touch prepare

libtool-2.4.2.tar.gz:
	wget ftp://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libtool-2.4.2.tar.gz
	$(RM) -r build/
	$(RM) -r libtool-2.4.2/

