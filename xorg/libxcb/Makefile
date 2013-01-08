.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libxcb-1.9/configure --prefix=$(PREFIX) \
		--enable-xinput --disable-static PYTHON=python2
	@touch configure

prepare: libxcb-1.9.tar.bz2
	tar xjf libxcb-1.9.tar.bz2
	cd libxcb-1.9 && patch -Np1 -i ../libxcb-1.1-no-pthread-stubs.patch && \
		autoreconf --force --install
	@mkdir build
	@touch prepare

libxcb-1.9.tar.bz2:
	wget http://xcb.freedesktop.org/dist/libxcb-1.9.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libxcb-1.9.tar.bz2
	$(RM) -r build/
	$(RM) -r libxcb-1.9/

