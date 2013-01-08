.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libXdmcp-1.1.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	@touch configure

prepare: libXdmcp-1.1.1.tar.bz2
	tar xjf libXdmcp-1.1.1.tar.bz2
	@mkdir build
	@touch prepare

libXdmcp-1.1.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libXdmcp-1.1.1.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libXdmcp-1.1.1.tar.bz2
	$(RM) -r build/
	$(RM) -r libXdmcp-1.1.1/

