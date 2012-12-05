PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../xkeyboard-config-2.7/configure --prefix=$(PREFIX) \
		--with-xkb-base=$(PREFIX)/share/X11/xkb \
		--with-xkb-rules-symlink=xorg \
		--enable-compat-rules=yes
	$(MAKE) -C build 

prepare: xkeyboard-config-2.7.tar.bz2
	tar xjf xkeyboard-config-2.7.tar.bz2
	mkdir -p build
	touch prepare

xkeyboard-config-2.7.tar.bz2:
	wget http://xorg.freedesktop.org/archive/individual/data/xkeyboard-config/xkeyboard-config-2.7.tar.bz2

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -f xkeyboard-config-2.7.tar.bz2
	rm -rf xkeyboard-config-2.7

