PREFIX=/usr
DESTDIR=

all: prepare
	cd build && ../htop-1.0.2/configure --prefix=$(PREFIX) \
		--enable-unicode \
		--enable-openvz \
		--enable-vserver \
		--enable-cgroup
	$(MAKE) -C build

prepare: htop-1.0.2.tar.gz
	tar xzf htop-1.0.2.tar.gz
	sed -i 's|ncursesw/curses.h|curses.h|' htop-1.0.2/RichString.c htop-1.0.2/RichString.h htop-1.0.2/configure
	mkdir -p build
	touch prepare

htop-1.0.2.tar.gz:
	wget http://downloads.sourceforge.net/htop/htop-1.0.2.tar.gz

install: all
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	rm -rf build/
	rm -f prepare
	rm -rf htop-1.0.2
	rm -f htop-1.0.2.tar.gz

