.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xcb-util-0.3.9/configure --prefix=$(PREFIX) \
		--disable-static
	@touch configure

prepare: xcb-util-0.3.9.tar.bz2
	tar xjf xcb-util-0.3.9.tar.bz2
	@mkdir build
	@touch prepare

xcb-util-0.3.9.tar.bz2:
	wget http://xcb.freedesktop.org/dist/xcb-util-0.3.9.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xcb-util-0.3.9.tar.bz2
	$(RM) -r build/
	$(RM) -r xcb-util-0.3.9/

