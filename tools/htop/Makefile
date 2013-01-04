.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../htop-1.0.2/configure --prefix=$(PREFIX) \
		--enable-unicode \
		--enable-openvz \
		--enable-vserver \
		--enable-cgroup
	@touch configure

prepare: htop-1.0.2.tar.gz
	tar xzf htop-1.0.2.tar.gz
	sed -i 's|ncursesw/curses.h|curses.h|' htop-1.0.2/RichString.c htop-1.0.2/RichString.h htop-1.0.2/configure
	@mkdir build
	@touch prepare

htop-1.0.2.tar.gz:
	wget http://downloads.sourceforge.net/htop/htop-1.0.2.tar.gz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) htop-1.0.2.tar.gz
	$(RM) -r build/
	$(RM) -r htop-1.0.2/

