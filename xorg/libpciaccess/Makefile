.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libpciaccess-0.13.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR)
	@touch configure

prepare: libpciaccess-0.13.1.tar.bz2
	tar xjf libpciaccess-0.13.1.tar.bz2
	@mkdir build
	@touch prepare

libpciaccess-0.13.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libpciaccess-0.13.1.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libpciaccess-0.13.1.tar.bz2
	$(RM) -r build/
	$(RM) -r libpciaccess-0.13.1/

