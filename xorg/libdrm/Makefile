.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libdrm-2.4.40/configure --prefix=$(PREFIX) \
		--enable-udev --enable-omap-experimental-api \
		--enable-exynos-experimental-api
	@touch configure

prepare: libdrm-2.4.40.tar.bz2
	tar xjf libdrm-2.4.40.tar.bz2
	cd libdrm-2.4.40 && patch -Np1 -i ../no-pthread-stubs.patch && \
		autoreconf --force --install
	@mkdir build
	@touch prepare

libdrm-2.4.40.tar.bz2:
	wget http://dri.freedesktop.org/libdrm/libdrm-2.4.40.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libdrm-2.4.40.tar.bz2
	$(RM) -r build/
	$(RM) -r libdrm-2.4.40/

