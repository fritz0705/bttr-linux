.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../font-alias-1.0.2/configure --prefix=$(PREFIX) --with-fontrootdir=$(PREFIX)/share/fonts
	@touch configure

prepare: font-alias-1.0.2.tar.bz2
	tar xjf font-alias-1.0.2.tar.bz2
	@mkdir build
	@touch prepare

font-alias-1.0.2.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/font-alias-1.0.2.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) font-alias-1.0.2.tar.bz2
	$(RM) -r build/
	$(RM) -r font-alias-1.0.2/

