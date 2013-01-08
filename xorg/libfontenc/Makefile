.PHONY: all build install clean

PREFIX=/usr
SYSCONFDIR=/etc
LOCALSTATEDIR=/var
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../libfontenc-1.1.1/configure --prefix=$(PREFIX) \
		--sysconfdir=$(SYSCONFDIR) --localstatedir=$(LOCALSTATEDIR) \
		--disable-static --with-encodingsdir=$(PREFIX)/share/fonts/encodings
	@touch configure

prepare: libfontenc-1.1.1.tar.bz2
	tar xjf libfontenc-1.1.1.tar.bz2
	@mkdir build
	@touch prepare

libfontenc-1.1.1.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/lib/libfontenc-1.1.1.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) libfontenc-1.1.1.tar.bz2
	$(RM) -r build/
	$(RM) -r libfontenc-1.1.1/

