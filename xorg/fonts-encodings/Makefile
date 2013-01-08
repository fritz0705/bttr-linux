.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../encodings-1.0.4/configure --prefix=$(PREFIX)
	@touch configure

prepare: encodings-1.0.4.tar.bz2
	tar xjf encodings-1.0.4.tar.bz2
	@mkdir build
	@touch prepare

encodings-1.0.4.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/encodings-1.0.4.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) encodings-1.0.4.tar.bz2
	$(RM) -r build/
	$(RM) -r encodings-1.0.4/

