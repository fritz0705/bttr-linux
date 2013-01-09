.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build/

configure: prepare
	cd build && ../syslinux-5.00/configure \
		--prefix=$(PREFIX)
	@touch configure

prepare: syslinux-5.00.tar.xz
	tar xJf syslinux-5.00.tar.xz
	@mkdir build
	@touch prepare

syslinux-5.00.tar.xz:
	wget http://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-5.00.tar.xz

install: build
	$(MAKE) -C build/ install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) syslinux-5.00.tar.xz
	$(RM) -r build/
	$(RM) -r syslinux-5.00/

