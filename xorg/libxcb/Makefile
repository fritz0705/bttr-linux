PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libxcb-1.9/configure --prefix=$(DESTDIR) \
		--enable-xinput --disable-static PYTHON=python2
	$(MAKE) -C build

prepare: libxcb-1.9.tar.bz2
	tar xjf libxcb-1.9.tar.bz2
	cd libxcb-1.9 && patch -Np1 -i ../libxcb-1.1-no-pthread-stubs.patch && \
		autoreconf --force --install
	mkdir -p build
	touch prepare

libxcb-1.9.tar.bz2:
	wget http://xcb.freedesktop.org/dist/libxcb-1.9.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libxcb-1.9.tar.bz2
	rm -rf libxcb-1.9

