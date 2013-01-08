.PHONY: all build install clean

PREFIX=/usr
MANDIR=$(PREFIX)/share/man
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../font-util-1.3.0/configure --prefix=$(PREFIX) \
		--mandir=$(MANDIR) \
		--with-mapdir=$(PREFIX)/share/fonts/util \
		--with-fontrootdir=$(PREFIX)/share/fonts
	@touch configure

prepare: font-util-1.3.0.tar.bz2
	tar xjf font-util-1.3.0.tar.bz2
	@mkdir build
	@touch prepare

font-util-1.3.0.tar.bz2:
	wget http://xorg.freedesktop.org/releases/individual/font/font-util-1.3.0.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) font-util-1.3.0.tar.bz2
	$(RM) -r build/
	$(RM) -r font-util-1.3.0/

