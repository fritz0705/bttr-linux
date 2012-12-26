.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../freetype-2.4.10/configure --prefix=$(PREFIX)
	@touch configure

prepare: freetype-2.4.10.tar.bz2
	tar xjf freetype-2.4.10.tar.bz2
	@mkdir build
	@touch prepare

freetype-2.4.10.tar.bz2:
	wget http://downloads.sourceforge.net/sourceforge/freetype/freetype-2.4.10.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) freetype-2.4.10.tar.bz2
	$(RM) -r build/
	$(RM) -r freetype-2.4.10/

