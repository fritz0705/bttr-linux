PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../libdrm-2.4.40/configure --prefix=$(PREFIX) \
		--enable-udev --enable-omap-experimental-api \
		--enable-exynos-experimental-api
	$(MAKE) -C build

prepare: libdrm-2.4.40.tar.bz2
	tar xjf libdrm-2.4.40.tar.bz2
	cd libdrm-2.4.40 && patch -Np1 -i ../no-pthread-stubs.patch && \
		autoreconf --force --install
	mkdir -p build
	touch prepare

libdrm-2.4.40.tar.bz2:
	wget http://dri.freedesktop.org/libdrm/libdrm-2.4.40.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f libdrm-2.4.40.tar.bz2
	rm -rf libdrm-2.4.40

