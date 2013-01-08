.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build 

configure: prepare
	cd build && ../xkeyboard-config-2.7/configure --prefix=$(PREFIX) \
		--with-xkb-base=$(PREFIX)/share/X11/xkb \
		--with-xkb-rules-symlink=xorg \
		--enable-compat-rules=yes
	@touch configure

prepare: xkeyboard-config-2.7.tar.bz2
	tar xjf xkeyboard-config-2.7.tar.bz2
	@mkdir build
	@touch prepare

xkeyboard-config-2.7.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-2.7.tar.bz2

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) xkeyboard-config-2.7.tar.bz2
	$(RM) -r build/
	$(RM) -r xkeyboard-config-2.7/

