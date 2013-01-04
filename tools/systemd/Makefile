.PHONY: all build install clean

PREFIX=/usr
DESTDIR=

all: build

build: configure
	$(MAKE) -C build

configure: prepare
	cd build && ../systemd-196/configure --prefix=$(PREFIX)
	@touch configure

prepare: systemd-196.tar.xz
	tar xJf systemd-196.tar.xz
	@mkdir build
	@touch prepare

systemd-196.tar.xz:
	wget http://www.freedesktop.org/software/systemd/systemd-196.tar.xz

install: build
	$(MAKE) -C build install DESTDIR=$(DESTDIR)

clean:
	$(RM) prepare
	$(RM) configure
	$(RM) systemd-196.tar.gz
	$(RM) -r build/
	$(RM) -r systemd-196/

