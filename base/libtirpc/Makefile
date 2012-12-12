.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C libtirpc-0.2.2

configure: prepare
	cd libtirpc-0.2.2 && ./configure --prefix=$(PREFIX) \
		--enable-gss
	@touch configure

prepare: libtirpc-0.2.2.tar.bz2
	tar xjf libtirpc-0.2.2.tar.bz2
	@mkdir build
	@touch prepare

libtirpc-0.2.2.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-0.2.2.tar.bz2

install: build
	$(MAKE) -C libtirpc-0.2.2 install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libtirpc-0.2.2.tar.bz2
	$(RM) -r build/
	$(RM) -r libtirpc-0.2.2/

