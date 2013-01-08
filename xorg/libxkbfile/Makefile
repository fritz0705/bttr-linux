.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libxkbfile-1.0.8/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --disable-static
	@touch configure

prepare: libxkbfile-1.0.8.tar.bz2
	tar xjf libxkbfile-1.0.8.tar.bz2
	@mkdir build
	@touch prepare

libxkbfile-1.0.8.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.0.8.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libxkbfile-1.0.8.tar.bz2
	$(RM) -r build/
	$(RM) -r libxkbfile-1.0.8/

