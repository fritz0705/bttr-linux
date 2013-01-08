.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../xcb-proto-1.8/configure --prefix=$(PREFIX) \
		PYTHON=python2
	@touch configure

prepare: xcb-proto-1.8.tar.bz2
	tar xjf xcb-proto-1.8.tar.bz2
	@mkdir build
	@touch prepare

xcb-proto-1.8.tar.bz2:
	wget http://xcb.freedesktop.org/dist/xcb-proto-1.8.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xcb-proto-1.8.tar.bz2
	$(RM) -r build/
	$(RM) -r xcb-proto-1.8/

